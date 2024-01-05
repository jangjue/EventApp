using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Diagnostics;
using System.Net.Sockets;
using System.Data;
using System.Collections.Generic;

namespace EventApp.Admin
{
    public partial class ManageEventDetails : System.Web.UI.Page
    {
        private static readonly string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB; AttachDbFilename=|DataDirectory|\\EventManagement.mdf; Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string eventID = Request.QueryString["EventID"];

                if (!string.IsNullOrEmpty(eventID))
                {
                    DisplayEventDetails(eventID);
                }
                else
                {
                    // Handle the case where EventID is not provided
                    // For example, redirect to an error page or display a message to the user
                    lblMessage.Text = "EventID is not provided.";
                }
            }
        }

        private void DisplayEventDetails(string eventID)
        {
            DataTable dataTable = GetEvent(eventID);

            if (dataTable.Rows.Count > 0)
            {
                ddlCategory.SelectedValue = dataTable.Rows[0]["Category"].ToString();
                ddlVenue.SelectedValue = dataTable.Rows[0]["VenueName"].ToString();
                txtName.Text = dataTable.Rows[0]["Name"].ToString();
                txtEventDescription.Text = dataTable.Rows[0]["Description"].ToString();

                string[] ticketTypes = dataTable.Rows[0]["TicketTypes"].ToString().Split(',');
                foreach (var type in ticketTypes)
                {
                    ListItem item = chkTicketLevels.Items.FindByValue(type.Trim());
                    if (item != null)
                    {
                        item.Selected = true;
                    }
                }

                string[] ticketCapacities = dataTable.Rows[0]["TicketCapacities"].ToString().Split(',');
                string[] ticketPrices = dataTable.Rows[0]["TicketPrice"].ToString().Split('*');

                // Modify the following lines based on your controls and UI structure
                txtStandardCapacity.Value = ticketCapacities.Length > 0 ? ticketCapacities[0] : string.Empty;
                txtProCapacity.Value = ticketCapacities.Length > 1 ? ticketCapacities[1] : string.Empty;
                txtPremiumCapacity.Value = ticketCapacities.Length > 2 ? ticketCapacities[2] : string.Empty;

                txtStandardPrice.Value = ticketPrices.Length > 0 ? ticketPrices[0] : "00.00";
                txtProPrice.Value = ticketPrices.Length > 1 ? ticketPrices[1] : "00.00";
                txtPremiumPrice.Value = ticketPrices.Length > 2 ? ticketPrices[2] : "00.00";

                txtStandardDescription.Text = dataTable.Rows[0]["StandardDescription"].ToString();
                txtProDescription.Text = dataTable.Rows[0]["ProDescription"].ToString();
                txtPremiumDescription.Text = dataTable.Rows[0]["PremiumDescription"].ToString();

                calStartDate.SelectedDate = Convert.ToDateTime(dataTable.Rows[0]["StartDate"]);
                calEndDate.SelectedDate = Convert.ToDateTime(dataTable.Rows[0]["EndDate"]);
            }
        }

        private DataTable GetEvent(string eventID)
        {
            string query = "SELECT Category.name AS Category, Venue.Location, Venue.VenueName, Event.EventID, Event.VenueID, Event.CategoryID, Event.Name, Event.StartDate, Event.EndDate, Event.Image, Event.Description, Event.TicketCapacities," +
                            " Event.StandardDescription, Event.ProDescription, Event.PremiumDescription, Event.TicketTypes, Event.TicketPrice" +
                            " FROM  Category INNER JOIN" +
                            " Event ON Category.CategoryID = Event.CategoryID INNER JOIN" +
                            " Venue ON Event.VenueID = Venue.VenueID" +
                            " WHERE  (Event.EventID = @EventID)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@EventID", eventID);

                    connection.Open();

                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        return dataTable;
                    }
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Validate fields before updating
            if (IsValidInput())
            {
                // Get the file content as a byte array
                byte[] imageData = fileEventImage.FileBytes;

                // Update data in the database
                UpdateEventData(imageData);

                // Reset form after successful submission
                ResetForm();
            }
        }

        protected void UpdateEventData(byte[] imageData)
        {
            // Get the selected category ID based on the category name
            string selectedCategoryName = ddlCategory.SelectedValue;
            string categoryId = GetCategoryIdByName(selectedCategoryName);

            // Check if the selected category exists
            if (!string.IsNullOrEmpty(categoryId))
            {
                // Get the selected venue ID based on the venue name
                string selectedVenueName = ddlVenue.SelectedValue;
                string venueID = GetVenueIDByName(selectedVenueName);

                // Construct the update query
                string updateQuery = "UPDATE Event SET CategoryID = @CategoryID, Name = @Name, Description = @Description, " +
                                     "StartDate = @StartDate, EndDate = @EndDate, VenueID = @VenueID, Image = @Image, " +
                                     "TicketCapacities = @TicketCapacities, TicketPrice = @TicketPrice, " +
                                     "StandardDescription = @StandardDescription, ProDescription = @ProDescription, " +
                                     "PremiumDescription = @PremiumDescription, TicketTypes = @TicketTypes " +
                                     "WHERE EventID = @EventID";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(updateQuery, connection))
                    {
                        cmd.Parameters.AddWithValue("@EventID", Request.QueryString["EventID"]);
                        cmd.Parameters.AddWithValue("@CategoryID", categoryId);
                        cmd.Parameters.AddWithValue("@Name", txtName.Text);
                        cmd.Parameters.AddWithValue("@Description", txtEventDescription.Text);

                        cmd.Parameters.AddWithValue("@StartDate", calStartDate.SelectedDate);

                        cmd.Parameters.AddWithValue("@EndDate", calEndDate.SelectedDate);
                        cmd.Parameters.AddWithValue("@VenueID", venueID);
                        cmd.Parameters.AddWithValue("@Image", imageData);
                        cmd.Parameters.AddWithValue("@TicketCapacities", string.Join(",", GetTicketCapacities(GetSelectedTicketTypes())));  // Join capacities with a comma
                        cmd.Parameters.AddWithValue("@TicketPrice", GetTicketPrice(GetSelectedTicketTypes()));
                        cmd.Parameters.AddWithValue("@StandardDescription", txtStandardDescription.Text);
                        cmd.Parameters.AddWithValue("@ProDescription", txtProDescription.Text);
                        cmd.Parameters.AddWithValue("@PremiumDescription", txtPremiumDescription.Text);
                        cmd.Parameters.AddWithValue("@TicketTypes", GetSelectedTicketTypes());

                        connection.Open();

                        // Execute the update query
                        cmd.ExecuteNonQuery();

                        // Display success message
                        lblMessage.Text = "Event updated successfully!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                    }
                }
            }
        }

        private string GetSelectedTicketTypes()
        {
            List<string> selectedTypes = new List<string>();

            foreach (ListItem item in chkTicketLevels.Items)
            {
                if (item.Selected)
                {
                    selectedTypes.Add(item.Value);
                }
            }

            return string.Join(",", selectedTypes);
        }
        private string[] GetTicketCapacities(string selectedTicketTypes)
        {
            // Initialize ticket capacities to zero for Standard, Pro, and Premium
            string[] ticketCapacities = { "0", "0", "0" };

            // Split selected ticket types
            string[] types = selectedTicketTypes.Split(',');

            // Update ticket capacities based on selected types
            foreach (var type in types)
            {
                switch (type.Trim().ToLower())
                {
                    case "standard":
                        ticketCapacities[0] = txtStandardCapacity.Value; // Set the capacity for Standard
                        break;
                    case "pro":
                        ticketCapacities[1] = txtProCapacity.Value; // Set the capacity for Pro
                        break;
                    case "premium":
                        ticketCapacities[2] = txtPremiumCapacity.Value; // Set the capacity for Premium
                        break;
                    default:
                        break;
                }
            }

            return ticketCapacities;
        }

        private string GetTicketPrice(string selectedTypes)
        {
            string[] ticketPrices = { "00.00", "00.00", "00.00" }; // Initialize with default values

            // Split selected ticket types
            string[] types = selectedTypes.Split(',');

            // Update ticket prices based on selected types
            foreach (var type in types)
            {
                switch (type.Trim().ToLower())
                {
                    case "standard":
                        ticketPrices[0] = txtStandardPrice.Value; // Set the price for Standard
                        break;
                    case "pro":
                        ticketPrices[1] = txtProPrice.Value; // Set the price for Pro
                        break;
                    case "premium":
                        ticketPrices[2] = txtPremiumPrice.Value; // Set the price for Premium
                        break;
                    default:
                        break;
                }
            }

            return string.Join("*", ticketPrices);
        }
        private void ResetForm()
        {
            // Reset form fields after successful submission
            ddlCategory.SelectedIndex = 0;
            ddlVenue.SelectedIndex = 0;  // Add this line to reset the Venue dropdown
            txtName.Text = string.Empty;
            txtEventDescription.Text = string.Empty;
            // ... reset other fields

            // Clear selected dates in the calendars
            calStartDate.SelectedDate = DateTime.MinValue;
            calEndDate.SelectedDate = DateTime.MinValue;

            // Clear error messages
            lblStartDateError.Visible = false;
            lblEndDateError.Visible = false;
        }

        private string GetVenueIDByName(string venueName)
        {
            // Assuming you have a connection string named "MyEventDB" in your Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["MyEventDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT VenueID FROM Venue WHERE VenueName = @VenueName";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@VenueName", venueName);

                    object result = cmd.ExecuteScalar();

                    if (result != null)
                    {
                        return result.ToString();
                    }
                }
            }

            // Return a default or handle the case where VenueID is not found
            return string.Empty;
        }

        private string GetCategoryIdByName(string categoryName)
        {
            // Assuming you have a connection string named "MyEventDB" in your Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["MyEventDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT CategoryID FROM Category WHERE name = @CategoryName";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@CategoryName", categoryName);

                    object result = cmd.ExecuteScalar();

                    if (result != null)
                    {
                        return result.ToString();
                    }
                }
            }

            // Return a default or handle the case where CategoryID is not found
            return string.Empty;
        }
        private bool IsValidInput()
        {
            // Implement validation logic for your input fields
            // Return true if input is valid, false otherwise

            // Example validation (you should customize this based on your requirements)
            if (string.IsNullOrEmpty(txtName.Text))
            {
                lblMessage.Text = "Event name cannot be empty.";
                return false;
            }

            // Add more validation as needed...

            return true;
        }
    }
}
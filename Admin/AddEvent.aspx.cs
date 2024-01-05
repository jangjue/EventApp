using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;

namespace EventApp.Admin
{
    public partial class AddEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void calStartDate_SelectionChanged(object sender, EventArgs e)
        {
            DateTime selectedStartDate = calStartDate.SelectedDate;

            // Validate start date against today
            if (selectedStartDate < DateTime.Today)
            {
                lblStartDateError.Text = "Start date cannot be earlier than today.";
                lblStartDateError.Visible = true;
            }
            else
            {
                // Clear error message if validation is successful
                lblStartDateError.Visible = false;
            }

            // Update event duration label
            UpdateEventDurationLabel();
        }

        protected void calEndDate_SelectionChanged(object sender, EventArgs e)
        {
            DateTime selectedStartDate = calStartDate.SelectedDate;
            DateTime selectedEndDate = calEndDate.SelectedDate;

            // Validate end date against start date
            if (selectedEndDate < selectedStartDate)
            {
                lblEndDateError.Text = "End date cannot be earlier than start date.";
                lblEndDateError.Visible = true;
            }
            else
            {
                // Clear error message if validation is successful
                lblEndDateError.Visible = false;
            }

            // Update event duration label
            UpdateEventDurationLabel();

            // Check if start date is selected when end date is selected
            if (selectedStartDate == DateTime.MinValue)
            {
                lblStartDateError.Text = "Please select the start date first.";
                lblStartDateError.Visible = true;
            }
        }

        private void UpdateEventDurationLabel()
        {
            // Update the event duration label based on selected start and end dates
            DateTime selectedStartDate = calStartDate.SelectedDate;
            DateTime selectedEndDate = calEndDate.SelectedDate;

            if (selectedStartDate != DateTime.MinValue && selectedEndDate != DateTime.MinValue)
            {
                // Calculate the duration by adding 1 day to the end date to include the start date
                TimeSpan duration = selectedEndDate.AddDays(1) - selectedStartDate;

                // Show duration only if it's greater than or equal to 1 day
                if (duration.Days >= 1)
                {
                    lblEventDuration.Text = $"Event Duration: {duration.Days} days";
                }
                else
                {
                    lblEventDuration.Text = "Event duration must be at least 1 day.";
                }
            }
            else
            {
                lblEventDuration.Text = string.Empty;
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Validate fields before inserting
            if (ValidateFields())
            {
                // Get the file content as a byte array
                byte[] imageData = fileEventImage.FileBytes;


                // Insert data into the database
                InsertEventData(imageData);

                // Reset form after successful submission
                ResetForm();
            }
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

        private string GenerateNextEventID()
        {
            // Assuming you have a connection string named "MyEventDB" in your Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["MyEventDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT ISNULL(MAX(CAST(SUBSTRING(EventID, 2, LEN(EventID) - 1) AS INT)), 0) + 1 FROM Event";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    object result = cmd.ExecuteScalar();

                    if (result != DBNull.Value)
                    {
                        int nextID = Convert.ToInt32(result);
                        return "E" + nextID.ToString("D3"); // Format as E001
                    }
                    else
                    {
                        return "E001"; // Default if no records exist
                    }
                }
            }
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

        private void InsertEventData(byte[] imageData)
        {
            // Validate other fields before insertion
            if (ValidateFields())
            {
                // Assuming you have a connection string named "MyEventDB" in your Web.config
                string connectionString = ConfigurationManager.ConnectionStrings["MyEventDB"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Get the selected category ID based on the category name
                    string selectedCategoryName = ddlCategory.SelectedValue;
                    string categoryId = GetCategoryIdByName(selectedCategoryName);

                    // Check if the selected category exists
                    if (!string.IsNullOrEmpty(categoryId))
                    {
                        string insertQuery = "INSERT INTO Event (EventID, CategoryID, Name, Description, StartDate, EndDate, VenueID, Image, TicketCapacities, TicketPrice, StandardDescription, ProDescription, PremiumDescription, TicketTypes) " +
                                             "VALUES (@EventID, @CategoryID, @Name, @Description, @StartDate, @EndDate, @VenueID, @Image, @TicketCapacities, @TicketPrice, @StandardDescription, @ProDescription, @PremiumDescription, @TicketTypes)";

                        using (SqlCommand cmd = new SqlCommand(insertQuery, connection))
                        {
                            string selectedVenueName = ddlVenue.SelectedValue;
                            string venueID = GetVenueIDByName(selectedVenueName);

                            string selectedTypes = GetSelectedTicketTypes();
                            string[] ticketCapacities = GetTicketCapacities(selectedTypes);
                            cmd.Parameters.AddWithValue("@EventID", GenerateNextEventID());
                            cmd.Parameters.AddWithValue("@CategoryID", categoryId);
                            cmd.Parameters.AddWithValue("@Name", txtName.Text);
                            cmd.Parameters.AddWithValue("@Description", txtEventDescription.Text);
                            cmd.Parameters.AddWithValue("@StartDate", calStartDate.SelectedDate.ToString("dd/MM/yyyy"));
                            cmd.Parameters.AddWithValue("@EndDate", calEndDate.SelectedDate.ToString("dd/MM/yyyy"));
                            cmd.Parameters.AddWithValue("@VenueID", venueID);
                            cmd.Parameters.AddWithValue("@Image", imageData);
                            cmd.Parameters.AddWithValue("@TicketCapacities", string.Join(",", ticketCapacities));  // Join capacities with comma
                            string ticketPrice = GetTicketPrice(selectedTypes);
                            cmd.Parameters.AddWithValue("@TicketPrice", ticketPrice);
                            cmd.Parameters.AddWithValue("@StandardDescription", txtStandardDescription.Text);
                            cmd.Parameters.AddWithValue("@ProDescription", txtProDescription.Text);
                            cmd.Parameters.AddWithValue("@PremiumDescription", txtPremiumDescription.Text);
                            cmd.Parameters.AddWithValue("@TicketTypes", selectedTypes);

                            // Execute the insert query
                            cmd.ExecuteNonQuery();

                            // Display success message
                            lblMessage.Text = "Event added successfully!";
                            lblMessage.ForeColor = System.Drawing.Color.Green;

                            // Reset form after successful submission
                            ResetForm();
                        }
                    }
                }
            }
        }

        private bool ValidateFields()
        {
            // Validate other fields as needed

            // Check if a category is selected
            if (string.IsNullOrEmpty(ddlCategory.SelectedValue))
            {
                lblMessage.Text = "Please select a category.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return false;
            }

            // Check if a venue is selected
            if (string.IsNullOrEmpty(ddlVenue.SelectedValue))
            {
                lblMessage.Text = "Please select a venue.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return false;
            }

            // Check if the event name is empty
            if (string.IsNullOrWhiteSpace(txtName.Text))
            {
                lblMessage.Text = "Event name cannot be empty.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return false;
            }

            // Check if the event description is empty
            if (string.IsNullOrWhiteSpace(txtEventDescription.Text))
            {
                lblMessage.Text = "Event description cannot be empty.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return false;
            }

            // Check if at least one ticket type is selected
            if (chkTicketLevels.Items.Cast<ListItem>().All(i => !i.Selected))
            {
                lblMessage.Text = "Please select at least one ticket type.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return false;
            }

            // Check ticket type-specific validations
            if (chkTicketLevels.Items[0].Selected)
            {
                // Standard ticket type is selected
                if (string.IsNullOrWhiteSpace(txtStandardDescription.Text) || string.IsNullOrWhiteSpace(txtStandardPrice.Value))
                {
                    lblMessage.Text = "Please fill in Standard ticket details.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    return false;
                }

                // Validate Standard ticket price
                if (Convert.ToDecimal(txtStandardPrice.Value) < 0)
                {
                    lblMessage.Text = "Standard ticket price cannot be negative.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    return false;
                }
            }

            // Similar checks can be added for Pro and Premium ticket types

            // Check if start date is selected
            if (calStartDate.SelectedDate == DateTime.MinValue)
            {
                lblMessage.Text = "Please select the start date.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return false;
            }

            // Check if end date is selected
            if (calEndDate.SelectedDate == DateTime.MinValue)
            {
                lblMessage.Text = "Please select the end date.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return false;
            }

            return true;
        }

        // Helper method to check if the event name is duplicate
        private bool IsEventNameDuplicate(string eventName)
        {
            // Assuming you have a connection string named "MyEventDB" in your Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["MyEventDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT COUNT(*) FROM Event WHERE Name = @EventName";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@EventName", eventName);

                    int count = Convert.ToInt32(cmd.ExecuteScalar());

                    return count > 0;
                }
            }
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
    }
}
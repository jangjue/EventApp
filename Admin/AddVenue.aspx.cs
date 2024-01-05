using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;

namespace EventApp.Admin
{
    public partial class AddVenue : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string errorMessage = ValidateForm();

            if (string.IsNullOrEmpty(errorMessage))
            {
                // Generate the next available Venue ID
                string nextVenueID = GenerateNextVenueID();

                // Insert data into the database
                InsertVenueData(nextVenueID);

                // Make the hdnSelectedLocation visible for debugging (you can remove this in production)
                hdnSelectedLocation.Visible = true;
                
            }
            else
            {
                // Display error message
                lblMessage.Text = errorMessage;
                lblMessage.ForeColor = Color.Red;
            }
        }

        private string ValidateForm()
        {
            // Add validation checks for empty fields and duplicates
            if (string.IsNullOrWhiteSpace(txtVenue.Text))
            {
                return "Venue name cannot be empty.";
            }

            if (ddlState.SelectedIndex == 0) // Assuming 0 is the default index
            {
                return "Please select a state.";
            }

            if (string.IsNullOrWhiteSpace(hdnSelectedLocation.Value))
            {
                return "Location cannot be empty.";
            }

            // Check for duplicate venue name
            string duplicateVenueNameMessage = GetDuplicateVenueNameMessage(txtVenue.Text);
            if (!string.IsNullOrEmpty(duplicateVenueNameMessage))
            {
                return duplicateVenueNameMessage;
            }

            // Check for duplicate location
            string duplicateLocationMessage = GetDuplicateLocationMessage(hdnSelectedLocation.Value);
            if (!string.IsNullOrEmpty(duplicateLocationMessage))
            {
                return duplicateLocationMessage;
            }

            return string.Empty; // Validation passed
        }

        private string GetDuplicateVenueNameMessage(string venueName)
        {
            // Check if the venue name already exists in the database
            string connectionString = ConfigurationManager.ConnectionStrings["MyEventDB"].ConnectionString;
            string query = "SELECT COUNT(*) FROM Venue WHERE VenueName = @VenueName";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@VenueName", venueName);

                    int count = (int)cmd.ExecuteScalar();

                    if (count > 0)
                    {
                        return $"Venue with name '{venueName}' already exists in the database.";
                    }

                    return string.Empty;
                }
            }
        }

        private string GetDuplicateLocationMessage(string location)
        {
            // Check if the location already exists in the database
            string connectionString = ConfigurationManager.ConnectionStrings["MyEventDB"].ConnectionString;
            string query = "SELECT COUNT(*) FROM Venue WHERE Location = @Location";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@Location", location);

                    int count = (int)cmd.ExecuteScalar();

                    if (count > 0)
                    {
                        return $"Venue with location '{location}' already exists in the database.";
                    }

                    return string.Empty;
                }
            }
        }

        private string GenerateNextVenueID()
        {
            // Get the current maximum Venue ID from the database
            string connectionString = ConfigurationManager.ConnectionStrings["MyEventDB"].ConnectionString;
            string query = "SELECT MAX(CAST(SUBSTRING(VenueID, 2, LEN(VenueID) - 1) AS INT)) + 1 FROM Venue";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    object result = cmd.ExecuteScalar();

                    if (result != DBNull.Value)
                    {
                        int nextID = Convert.ToInt32(result);
                        return "V" + nextID.ToString("D3"); // Format as V001
                    }
                    else
                    {
                        return "V001"; // Default if no records exist
                    }
                }
            }
        }

        private void InsertVenueData(string venueID)
        {
            // Assuming you have a connection string named "MyEventDB" in your Web.config
            string connectionString = ConfigurationManager.ConnectionStrings["MyEventDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string insertQuery = "INSERT INTO Venue (VenueID, VenueName, Location, State) " +
                                     "VALUES (@VenueID, @VenueName, @Location, @State)";

                using (SqlCommand cmd = new SqlCommand(insertQuery, connection))
                {
                    // Set parameters based on your form fields
                    cmd.Parameters.AddWithValue("@VenueID", venueID);
                    cmd.Parameters.AddWithValue("@VenueName", txtVenue.Text);
                    cmd.Parameters.AddWithValue("@Location", hdnSelectedLocation.Value);
                    cmd.Parameters.AddWithValue("@State", ddlState.SelectedValue);

                    // Execute the insert query
                    cmd.ExecuteNonQuery();
                }

                // Display success message or perform any other actions
                lblMessage.Text = $"Venue at {hdnSelectedLocation.Value} added successfully!";
                lblMessage.ForeColor = Color.Green;
            }
        }
    }
}
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;

namespace EventApp.Admin
{
    public partial class ManageVenueDetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the VenueID is present in the query string
                if (Request.QueryString["VenueID"] != null)
                {
                    string venueID = Request.QueryString["VenueID"];
                    PopulateVenueDetails(venueID);
                }
                else
                {
                    // Handle the case when VenueID is not provided in the query string
                }
            }
        }

        private void PopulateVenueDetails(string venueID)
        {
            // Create a connection string
            string connectionString = ConfigurationManager.ConnectionStrings["MyEventDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT VenueName, Location, State FROM Venue WHERE VenueID = @VenueID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@VenueID", venueID);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Display the current venue details
                            lblCurrentVenueName.Text = $"Current Venue Name: {reader["VenueName"]}";
                            lblCurrentLocation.Text = $"Current Location: {reader["Location"]}";
                            lblCurrentState.Text = $"Current State: {reader["State"]}";
                        }
                        else
                        {
                            // Handle the case when the venue is not found
                            // You may redirect to an error page or perform other actions
                        }
                    }
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Validate the form
            string errorMessage = ValidateForm();

            if (string.IsNullOrEmpty(errorMessage))
            {
                string newVenueName = txtNewVenueName.Text;
                string newLocation = hdnSelectedLocation.Value;
                string newState = ddlNewState.SelectedValue;

                string venueID = Request.QueryString["VenueID"];

                string connectionString = ConfigurationManager.ConnectionStrings["MyEventDB"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string updateQuery = "UPDATE Venue SET VenueName = @VenueName, Location = @Location, State = @State WHERE VenueID = @VenueID";

                    using (SqlCommand updateCommand = new SqlCommand(updateQuery, connection))
                    {
                        updateCommand.Parameters.AddWithValue("@VenueName", newVenueName);
                        updateCommand.Parameters.AddWithValue("@Location", newLocation);
                        updateCommand.Parameters.AddWithValue("@State", newState);
                        updateCommand.Parameters.AddWithValue("@VenueID", venueID);

                        // Execute the update query
                        int rowsAffected = updateCommand.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            lblMessage.Text = "Venue details successfully updated!";
                            lblMessage.ForeColor = Color.Green;
                        }
                        else
                        {
                            lblMessage.Text = "Failed to update venue. Please try again.";
                            lblMessage.ForeColor = Color.Red;
                        }
                    }
                }
            }
            else
            {
                // Display validation error message
                lblMessage.Text = errorMessage;
                lblMessage.ForeColor = Color.Red;
            }
        }

        // Helper method to check if the venueName is unique
        private bool IsVenueNameUnique(string venueName)
        {
            // Create a connection string
            string connectionString = ConfigurationManager.ConnectionStrings["MyEventDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Check if there is any existing venue with the same name
                string checkDuplicateQuery = "SELECT COUNT(*) FROM Venue WHERE VenueName = @VenueName AND VenueID != @VenueID";

                using (SqlCommand checkDuplicateCommand = new SqlCommand(checkDuplicateQuery, connection))
                {
                    checkDuplicateCommand.Parameters.AddWithValue("@VenueName", venueName);
                    checkDuplicateCommand.Parameters.AddWithValue("@VenueID", Request.QueryString["VenueID"]);

                    int count = (int)checkDuplicateCommand.ExecuteScalar();

                    // If count is greater than 0, the venueName is not unique
                    return count == 0;
                }
            }
        }

        // Helper method to validate the form
        private string ValidateForm()
        {
            // Add validation checks for empty fields and duplicates
            if (string.IsNullOrWhiteSpace(txtNewVenueName.Text))
            {
                return "New Venue Name cannot be empty.";
            }

            // Check for duplicate venue name
            if (!IsVenueNameUnique(txtNewVenueName.Text))
            {
                return "Venue Name Already Exists";
            }

            if (ddlNewState.SelectedIndex == 0) // Assuming 0 is the default index
            {
                return "Please select a valid state.";
            }

            if (string.IsNullOrWhiteSpace(hdnSelectedLocation.Value))
            {
                return "New Location cannot be empty.";
            }

            return string.Empty; // Validation passed
        }
    }
}
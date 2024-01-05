using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EventApp.Admin
{
    public partial class ViewEventBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if EventID is provided in the query parameters
                if (Request.QueryString["EventID"] != null)
                {
                    string eventID = Request.QueryString["EventID"];

                    // Retrieve booking details for the specific EventID from the database
                    DataTable dtBookingDetails = GetBookingDetails(eventID);

                    // Bind the retrieved data to the Repeater
                    Repeater1.DataSource = dtBookingDetails;
                    Repeater1.DataBind();
                }
            }
        }

        private DataTable GetBookingDetails(string eventID)
        {
            // Define your connection string
            string connectionString = ConfigurationManager.ConnectionStrings["MyEventDB"].ConnectionString;

            // Define your SQL query
            string query = "SELECT B.BookingID, P.Name AS ParticipantName, B.Type, B.Quantity, B.BookingDate FROM Booking B INNER JOIN Participant P ON B.ParticipantID = P.ParticipantID WHERE B.EventID = @EventID";

            // Create a DataTable to hold the results
            DataTable dt = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the query
                    command.Parameters.AddWithValue("@EventID", eventID);

                    // Open the connection
                    connection.Open();

                    // Execute the query and fill the DataTable
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        adapter.Fill(dt);
                    }
                }
            }

            return dt;
        }
    }
}
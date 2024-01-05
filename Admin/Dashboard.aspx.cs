using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventApp.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load the data when the page is first loaded
                LoadDashboardData();
            }
        }

        private void LoadDashboardData()
        {
            try
            {
                // Connect to the database
                string connectionString = ConfigurationManager.ConnectionStrings["MyEventDB"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Query to get counts from each table
                    string query = "SELECT " +
                                   "(SELECT COUNT(*) FROM Event) AS TotalEvents, " +
                                   "(SELECT COUNT(*) FROM Category) AS TotalCategories, " +
                                   "(SELECT COUNT(*) FROM Venue) AS TotalVenues, " +
                                   "(SELECT COUNT(*) FROM Booking) AS TotalBookings";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // Display the counts in the dashboard
                                totalEvents.Text = reader["TotalEvents"].ToString();
                                totalCategories.Text = reader["TotalCategories"].ToString();
                                totalVenues.Text = reader["TotalVenues"].ToString();
                                totalBookings.Text = reader["TotalBookings"].ToString();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions (log or display an error message)
                Console.WriteLine(ex.Message);
            }
        }

     
    }
}
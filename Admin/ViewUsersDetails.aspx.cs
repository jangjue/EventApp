using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EventApp.Admin
{
    public partial class ViewUsersDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["ParticipantID"] != null)
                {
                    string participantID = Request.QueryString["ParticipantID"].ToString();
                    LoadParticipantDetails(participantID);
                    LoadParticipantBookingDetails(participantID);
                }
            }
        }

        protected void LoadParticipantDetails(string participantID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MyEventDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT Name FROM Participant WHERE ParticipantID = @ParticipantID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ParticipantID", participantID);

                    object result = command.ExecuteScalar();

                    if (result != null)
                    {
                        string participantName = result.ToString();
                        lblTitle.Text = $"View Users Details - {participantName}";
                    }
                }
            }
        }

        protected void LoadParticipantBookingDetails(string participantID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MyEventDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT BookingID, Event.Name AS EventName, Type, Quantity, BookingDate " +
                               "FROM Booking " +
                               "INNER JOIN Event ON Booking.EventID = Event.EventID " +
                               "WHERE Booking.ParticipantID = @ParticipantID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@ParticipantID", participantID);

                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable dataTable = new DataTable();
                        adapter.Fill(dataTable);

                        Repeater1.DataSource = dataTable;
                        Repeater1.DataBind();
                    }
                }
            }
        }
    }
}
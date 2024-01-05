using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventApp
{
     public partial class ConfirmationBooking : System.Web.UI.Page
    {
        private static string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB; AttachDbFilename=|DataDirectory|\\EventManagement.mdf; Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve values from query parameters
                string quantity = Request.QueryString["Quantity"];
                string totalPrice = Request.QueryString["TotalPrice"];
                string type = Request.QueryString["CardType"];

                // Set values to corresponding labels
                qunatityLabel.Text = $"{quantity}";
                totalPriceLabel.Text = $"RM {totalPrice}";
                typeLabel.Text = $"{type}";
            }
        }

        private string InsertBookingData()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string userID = Session["User"].ToString();
                string eventID = Request.QueryString["EventID"];
                int quantity = int.Parse(Request.QueryString["Quantity"]);
                string totalPrice = Request.QueryString["TotalPrice"];
                string type = Request.QueryString["CardType"];
                string bookingID = GenerateBookingID(conn);

                // Get the current date and time
                DateTime bookingDate = DateTime.Now;

                using (SqlCommand cmd = new SqlCommand("INSERT INTO Booking (BookingID, ParticipantID, EventID, Price, Type, Quantity, BookingDate) " +
                    "VALUES (@BookingID, @ParticipantID, @EventID, @Price, @Type, @Quantity, @BookingDate)", conn))
                {
                    cmd.Parameters.AddWithValue("@BookingID", bookingID);
                    cmd.Parameters.AddWithValue("@ParticipantID", userID);
                    cmd.Parameters.AddWithValue("@EventID", eventID);
                    cmd.Parameters.AddWithValue("@Price", decimal.Parse(totalPrice)); // Convert totalPrice to decimal
                    cmd.Parameters.AddWithValue("@Type", type);
                    cmd.Parameters.AddWithValue("@Quantity", quantity);
                    cmd.Parameters.AddWithValue("@BookingDate", bookingDate.ToString("MM/dd/yyyy"));
                    conn.Close();

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                return bookingID; // Return the generated bookingID
            }
        }


        private void InsertPaymentData(string bookingID)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string totalPrice = Request.QueryString["TotalPrice"];
                string type = Request.QueryString["CardType"];
                string paymentID = GeneratePaymentID(conn);

                // Get the current date and time
                DateTime paymentDate = DateTime.Now;

                using (SqlCommand cmd = new SqlCommand("INSERT INTO Payment (PaymentID, BookingID, PaymentDate, TotalAmount, Type) " +
                    "VALUES (@PaymentID, @BookingID, @PaymentDate, @TotalAmount, @Type)", conn))
                {
                    cmd.Parameters.AddWithValue("@BookingID", bookingID);
                    cmd.Parameters.AddWithValue("@PaymentID", paymentID);
                    cmd.Parameters.AddWithValue("@TotalAmount", totalPrice);
                    cmd.Parameters.AddWithValue("@Type", type);
                    cmd.Parameters.AddWithValue("@PaymentDate", paymentDate.ToString("MM/dd/yyyy"));
                    conn.Close();

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        protected void Confirm_Checkout(object sender, EventArgs e)
        {
            // Retrieve values from query parameters
            string eventID = Request.QueryString["EventID"];
            string quantity = Request.QueryString["Quantity"];
            string totalPrice = Request.QueryString["TotalPrice"];
            string cardType = Request.QueryString["CardType"];

            // Insert data into Booking and Payment tables and get the bookingID
            string bookingID = InsertBookingData();

            // Insert data into Payment table using the obtained bookingID
            InsertPaymentData(bookingID);

            Response.Redirect($"MyBooking.aspx");
        }



        private string GenerateBookingID(SqlConnection connection)
        {
            string query = "SELECT COUNT(*) FROM Booking";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                connection.Open();
                int count = (int?)command.ExecuteScalar() ?? 0; // If result is null, default to 0
                return $"B{count + 1:D3}";
            }
        }


        private string GeneratePaymentID(SqlConnection connection)
        {
            string query = "SELECT COUNT(*) FROM Payment";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                connection.Open();
                int count = (int?)command.ExecuteScalar() ?? 0; // If result is null, default to 0
                return $"P{count + 1:D3}";
            }
        }

    }
}
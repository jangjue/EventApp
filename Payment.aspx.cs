using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventApp
{
    public partial class Payment : System.Web.UI.Page
    {
        private static string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB; AttachDbFilename=|DataDirectory|\\EventManagement.mdf; Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["User"] == null)
                {
                    // Redirect to the login page
                    Response.Redirect("Login.aspx");
                }
                else 
                {
                    // Check if EventID and TicketType parameters are present in the query string
                    if (Request.QueryString["EventID"] != null && Request.QueryString["TicketType"] != null)
                    {
                        // Retrieve values from the query string
                        string eventID = Request.QueryString["EventID"];
                        string selectedType = Request.QueryString["TicketType"];
                        string ticketType = GetTicketTypeFromDatabase(eventID);
                        string ticketPrice = GetTicketPriceFromDatabase(eventID);



                        // Calculate the total price based on the selected quantity and the fetched unit price
                        int quantity = int.Parse(txtQuantity.Text);
                        double price = GetUnitPrice(ticketType, ticketPrice);
                        double totalPrice = quantity * price;

                        // Display the calculated price to the user
                        totalPriceLabel.Text = "RM " + totalPrice.ToString("N2");
                    }
                    else
                    {
                        // Handle the case when parameters are not present in the query string
                        // You may redirect the user or show an error message
                    }
                }
    
            }
        }
        protected void txtQuantity_TextChanged(object sender, EventArgs e)
        {
            // Triggered when the text in txtQuantity changes
            UpdateTotalPrice();
        }

        private void UpdateTotalPrice()
        {
            // Retrieve values from the query string
            string eventID = Request.QueryString["EventID"];
            string selectedType = Request.QueryString["TicketType"];
            string ticketType = GetTicketTypeFromDatabase(eventID);
            string ticketPrice = GetTicketPriceFromDatabase(eventID);

            // Validate and parse the quantity
            int quantity;
            if (int.TryParse(txtQuantity.Text, out quantity) && quantity > 0)
            {
                // Validate and parse the ticket price
                double price = GetUnitPrice(ticketType, ticketPrice);
                double totalPrice = quantity * price;

                // Display the calculated price to the user
                totalPriceLabel.Text = "RM " + totalPrice.ToString("N2");
            }
            else
            {
                // Handle the case where the quantity is not a valid positive integer
                // Display an error message or set a default quantity
            }
        }

        private string GetTicketTypeFromDatabase(string eventID)
        {
            string ticketType = null;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT TicketTypes FROM Event WHERE EventID = @EventID", connection);
                command.Parameters.AddWithValue("@EventID", eventID);
                object result = command.ExecuteScalar();

                if (result != null)
                {
                    ticketType = result.ToString();
                }
            }
            return ticketType;
        }

        private string GetTicketPriceFromDatabase(string eventID)
        {
            string price = null;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("SELECT TicketPrice FROM Event WHERE EventID = @EventID", connection);
                command.Parameters.AddWithValue("@EventID", eventID);
                object result = command.ExecuteScalar();

                if (result != null)
                {
                    price = result.ToString();
                }
            }
            return price;
        }

        private double GetUnitPrice(string ticketTypeString, string ticketPriceString)
        {
            double price = 0;
            string[] ticketType = ticketTypeString.Split(',');
            string[] ticketPrice = ticketPriceString.Split('*');
            for (int i = 0; i < ticketType.Length; i++)
            {
                if (ticketType[i].Equals("Standard"))
                {
                    
                    price = double.Parse(ticketPrice[i]);
                }
                else if (ticketType[i].Equals("Pro"))
                {
                    price = double.Parse(ticketPrice[i]);
                }
                else if (ticketType[i].Equals("Premium"))
                {
                    price = double.Parse(ticketPrice[i]);
                }
            }
            return price;
        }

        protected void Btn_Checkout(object sender, EventArgs e)
        {
            string quantity = txtQuantity.Text;
            string totalPrice = totalPriceLabel.Text;
            totalPrice = new string(totalPrice.Where(char.IsDigit).ToArray());
            // Extract the first digit of the card number
            char firstDigit = txtCardNumber.Text.FirstOrDefault();

            // Determine the card type based on the first digit
            string cardType = null;

            if (firstDigit == '5')
            {
                cardType = "MasterCard";
            }
            else if(firstDigit == '4')
            {
                cardType = "Visa Card";
            }

            // Pass the card type along with other parameters to ConfirmationBooking.aspx
            Response.Redirect($"ConfirmationBooking.aspx?EventID={Request.QueryString["EventID"]}&Quantity={quantity}&TotalPrice={totalPrice}&CardType={cardType}");
        }
    }
}
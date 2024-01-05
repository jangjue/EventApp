using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace EventApp
{
    public partial class event_details : System.Web.UI.Page
    {
        private static string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB; AttachDbFilename=|DataDirectory|\\EventManagement.mdf; Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            string eventID = Request.QueryString["EventID"];


            //if (Session["User"] == null)
            //{
            //    // Redirect to the login page
            //    Response.Redirect("Login.aspx");
            //}
            //else
            //{
            DisplayEventDetails(eventID);
            //}
            if (!IsPostBack)
            {
                // Load ticket information on the initial page load
                DisplayTicketInformation(eventID);
            }


        }

        private void DisplayEventDetails(string eventID)
        {
            DataTable dataTable = GetEvent(eventID);

            if (dataTable.Rows.Count > 0)
            {
                lblEventName.Text = dataTable.Rows[0]["Name"].ToString();
                lblDscr.Text = dataTable.Rows[0]["Description"].ToString();

                string ticketCapacitiesString = dataTable.Rows[0]["TicketCapacities"].ToString();
                string[] ticketCapacities = ticketCapacitiesString.Split(',');

                int totalCapacity = ticketCapacities.Sum(int.Parse);
                int soldTickets = GetSoldTicketsCount(eventID);
                int availableTickets = totalCapacity - soldTickets;

                lblAvaiable.Text = $"{availableTickets} Tickets";
                lblSoldOut.Text = $"{soldTickets} Tickets";

                byte[] imageData = (byte[])dataTable.Rows[0]["Image"];
                string base64String = Convert.ToBase64String(imageData);
                EventImage.ImageUrl = $"data:image/png;base64,{base64String}";
            }
            else
            {
                // Handle the case where no records were found
                // You might want to redirect the user or display an error message
            }
        }

        private void DisplayTicketInformation(string eventID)
        {
            List<TicketInfo> ticketInfoList = GetTicketInformationFromDatabase(eventID);

            rptTickets.DataSource = ticketInfoList;
            rptTickets.DataBind();
        }

        private DataTable GetEvent(string eventID)
        {
            string query = "SELECT * FROM Event WHERE EventID = @EventID";

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

        private int GetSoldTicketsCount(string eventID)
        {
            try
            {
                string query = "SELECT COUNT(*) FROM Booking WHERE EventID = @EventID";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@EventID", eventID);

                        connection.Open();

                        return (int)command.ExecuteScalar();
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions (log or display an error message)
                return 0;
            }
        }

        private List<TicketInfo> GetTicketInformationFromDatabase(string eventID)
        {
            DataTable dataTable = GetEvent(eventID);

            if (dataTable.Rows.Count > 0)
            {
                string ticketCapacitiesString = dataTable.Rows[0]["TicketCapacities"].ToString();
                string ticketTypeString = dataTable.Rows[0]["TicketTypes"].ToString();
                string ticketPriceString = dataTable.Rows[0]["TicketPrice"].ToString();

                string standardDescription = dataTable.Rows[0]["StandardDescription"].ToString();
                string proDescription = dataTable.Rows[0]["ProDescription"].ToString();
                string premiumDescription = dataTable.Rows[0]["PremiumDescription"].ToString();

                string[] ticketCapacities = ticketCapacitiesString.Split(',');
                string[] ticketType = ticketTypeString.Split(',');
                string[] ticketPrice = ticketPriceString.Split('*');

                string standardCapacity = ticketCapacities[0];
                string proCapacity = ticketCapacities[1];
                string premiumCapacity = ticketCapacities[2];

                string standardType = "";
                string proType = "";
                string premiumType = "";
                for (int i = 0; i < ticketType.Length; i++)
                {
                    if (ticketType[i].Equals("Standard"))
                    {
                        standardType = "Standard";
                    }
                    else if (ticketType[i].Equals("Pro"))
                    {
                        proType = "Pro";
                    }
                    else if (ticketType[i].Equals("Premium"))
                    {
                        premiumType = "Premium";
                    }
                }

                string standardPrice = ticketPrice[0];
                string proPrice = ticketPrice[1];
                string premiumPrice = ticketPrice[2];

                List<TicketInfo> ticketInfoList = new List<TicketInfo>();

                // Check and add Standard TicketInfo
                if (!string.IsNullOrEmpty(standardCapacity) && !string.IsNullOrEmpty(standardType))
                {
                    ticketInfoList.Add(new TicketInfo
                    {
                        TicketType = standardType,
                        TicketPrice = $"RM {standardPrice}",
                        TypeDescription = standardDescription,
                        TicketCapacity = standardCapacity
                    });
                }

                // Check and add Pro TicketInfo
                if (!string.IsNullOrEmpty(proCapacity) && !string.IsNullOrEmpty(proType))
                {
                    ticketInfoList.Add(new TicketInfo
                    {
                        TicketType = proType,
                        TicketPrice = $"RM {proPrice}",
                        TypeDescription = proDescription,
                        TicketCapacity = proCapacity
                    });
                }

                // Check and add Premium TicketInfo
                if (!string.IsNullOrEmpty(premiumCapacity) && !string.IsNullOrEmpty(premiumType))
                {
                    ticketInfoList.Add(new TicketInfo
                    {
                        TicketType = premiumType,
                        TicketPrice = $"RM {premiumPrice}",
                        TypeDescription = premiumDescription,
                        TicketCapacity = premiumCapacity
                    });
                }
                return ticketInfoList;
            }

            return new List<TicketInfo>();
        }

        protected void rptTickets_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "BuyTicket")
            {
                string selectedTicketType = e.CommandArgument.ToString();
                Response.Redirect($"Payment.aspx?EventID={Request.QueryString["EventID"]}&TicketType={selectedTicketType}");
            }
        }

        public class TicketInfo
        {
            public string TicketType { get; set; }
            public string TicketPrice { get; set; }
            public string TypeDescription { get; set; }
            public string TicketCapacity { get; set; }
        }

    }
}

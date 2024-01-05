using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventApp.Admin
{
    public partial class Booking1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string GetAvailableTickets(object eventID, object bookedQuantity, object ticketCapacities)
        {
            int totalQuantity = 0;
            if (int.TryParse(ticketCapacities?.ToString(), out totalQuantity) && totalQuantity > 0)
            {
                int booked = 0;
                int bookedResult;
                if (int.TryParse(bookedQuantity?.ToString(), out bookedResult))
                {
                    booked = bookedResult;
                }

                int available = totalQuantity - booked;
                return available.ToString();
            }

            return "N/A";
        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            Button btnModify = (Button)sender;

            string eventID = btnModify.CommandArgument;

            Response.Redirect($"ViewEventBooking.aspx?EventID={eventID}");
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }


    }
}
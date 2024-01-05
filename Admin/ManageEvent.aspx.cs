using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventApp.Admin
{
    public partial class ManageEvent : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Your existing Page_Load code here
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            // Add your Repeater1_ItemDataBound event handler logic here
        }
        protected void btnModify_Click(object sender, EventArgs e)
        {
            Button btnModify = (Button)sender;

            string eventID = btnModify.CommandArgument;

            Response.Redirect($"ManageEventDetails.aspx?EventID={eventID}");
        }

        protected string GetFormattedValue(object expr12Value)
        {
            if (expr12Value != null && decimal.TryParse(expr12Value.ToString(), out decimal expr12Decimal))
            {
                return expr12Decimal == 0 ? "N/A" : "RM " + expr12Decimal.ToString();
            }
            else
            {
                return "N/A";
            }
        }
    }
}
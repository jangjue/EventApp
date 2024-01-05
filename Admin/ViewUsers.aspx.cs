using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace EventApp.Admin
{
    public partial class ViewUsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
 
        }


        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            Button btnModify = (Button)sender;

            string participantID = btnModify.CommandArgument;

            Response.Redirect($"ViewUsersDetails.aspx?ParticipantID={participantID}");
        }
    }
}
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventApp.Admin
{
    public partial class ManageVenue : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if it's a postback to avoid rebinding on every postback
            if (!IsPostBack)
            {
                BindRepeaterData();
            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Get the row number label
                Label lblRowNumber = (Label)e.Item.FindControl("lblRowNumber");

                if (lblRowNumber != null)
                {
                    // Set the row number (1-based index)
                    lblRowNumber.Text = (e.Item.ItemIndex + 1).ToString();
                }
            }
        }

        protected void BindRepeaterData()
        {
            // Assuming you have a method to retrieve venue data from the database
            // DataTable dataTable = GetDataFromDatabase();

            // Add a new column for row numbers
            // dataTable.Columns.Add("RowNumber", typeof(int));
            // for (int i = 0; i < dataTable.Rows.Count; i++)
            // {
            //     dataTable.Rows[i]["RowNumber"] = i + 1;
            // }

            // Repeater1.DataSource = dataTable;
            // Repeater1.DataBind();
        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            // Get the clicked button
            Button btnModify = (Button)sender;

            // Get the VenueID from the CommandArgument
            string venueID = btnModify.CommandArgument;

            // Redirect to the modify page, passing the VenueID as a query parameter
            Response.Redirect($"ManageVenueDetails.aspx?VenueID={venueID}");
        }
    }
}

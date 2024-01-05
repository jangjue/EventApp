using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventApp.Admin
{
    public partial class ManageCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected int RowNumber
        {
            get
            {
                // Use ViewState to persist the row number across postbacks
                if (ViewState["RowNumber"] == null)
                {
                    ViewState["RowNumber"] = 1;
                }

                return (int)ViewState["RowNumber"];
            }
            set
            {
                ViewState["RowNumber"] = value;
            }
        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Get the row number label
                Label lblRowNumber = (Label)e.Item.FindControl("Label1");

                if (lblRowNumber != null)
                {
                    // Set the row number (1-based index)
                    lblRowNumber.Text = (e.Item.ItemIndex + 1).ToString();
                }
            }
        }

        protected void BindRepeaterData()
        {
            DataTable dataTable = new DataTable();
            // Retrieve your data from the database and populate the DataTable
            // Example: dataTable = GetDataFromDatabase();

            // Add a new column for row numbers
            dataTable.Columns.Add("RowNumber", typeof(int));
            for (int i = 0; i < dataTable.Rows.Count; i++)
            {
                dataTable.Rows[i]["RowNumber"] = i + 1;
            }

            Repeater1.DataSource = dataTable;
            Repeater1.DataBind();
        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            // Get the clicked button
            Button btnModify = (Button)sender;

            // Get the CategoryID from the CommandArgument
            string categoryID = btnModify.CommandArgument;

            // Redirect to the modify page, passing the CategoryID as a query parameter
            Response.Redirect($"ManageCategoryDetails.aspx?CategoryID={categoryID}");
        }
    }
}
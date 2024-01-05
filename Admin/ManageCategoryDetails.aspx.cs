using System;
using System.Data.SqlClient;
using System.Configuration;

namespace EventApp.Admin
{
    public partial class ManageCategoryDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the CategoryID is present in the query string
                if (Request.QueryString["CategoryID"] != null)
                {
                    string categoryID = Request.QueryString["CategoryID"];
                    PopulateCategoryDetails(categoryID);
                }
                else
                {
                    // Handle the case when CategoryID is not provided in the query string
                    // You may redirect to an error page or perform other actions
                }
            }
        }

        private void PopulateCategoryDetails(string categoryID)
        {
            // Create a connection string
            string connectionString = ConfigurationManager.ConnectionStrings["MyEventDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT Name, Description FROM Category WHERE CategoryID = @CategoryID";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CategoryID", categoryID);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Display the current category details
                            lblCurrentCategoryName.Text = $"Current Category Name: {reader["Name"]}";
                            lblCurrentDescription.Text = $"Current Description: {reader["Description"]}";
                        }
                        else
                        {
                            // Handle the case when the category is not found
                            // You may redirect to an error page or perform other actions
                        }
                    }
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Retrieve the new values from the textboxes
            string newCategoryName = txtNewCategoryName.Text;
            string newDescription = txtNewDescription.Text;

            // Validate that categoryName is not empty
            if (string.IsNullOrEmpty(newCategoryName))
            {
                lblMessage.Text = "New Category Name cannot be empty.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return; // Stop further processing if validation fails
            }

            // Validate that categoryName is unique
            if (!IsCategoryNameUnique(newCategoryName))
            {
                lblMessage.Text = "Category Name Already Exist";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return; // Stop further processing if validation fails
            }

            // Validate that description is not empty
            if (string.IsNullOrEmpty(newDescription))
            {
                lblMessage.Text = "New Description cannot be empty.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return; // Stop further processing if validation fails
            }

            // Retrieve the CategoryID from the query string
            string categoryID = Request.QueryString["CategoryID"];

            // Create a connection string
            string connectionString = ConfigurationManager.ConnectionStrings["MyEventDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Update query to modify the category details
                string updateQuery = "UPDATE Category SET Name = @Name, Description = @Description WHERE CategoryID = @CategoryID";

                using (SqlCommand updateCommand = new SqlCommand(updateQuery, connection))
                {
                    updateCommand.Parameters.AddWithValue("@Name", newCategoryName);
                    updateCommand.Parameters.AddWithValue("@Description", newDescription);
                    updateCommand.Parameters.AddWithValue("@CategoryID", categoryID);

                    // Execute the update query
                    int rowsAffected = updateCommand.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        // Update successful
                        // You may display a success message or redirect to another page
                        lblMessage.Text = "Category successfully updated!";
                        lblMessage.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        // Handle the case when the update fails
                        // You may display an error message or take other actions
                        lblMessage.Text = "Failed to update category. Please try again.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                }
            }
        }

        // Helper method to check if the categoryName is unique
        private bool IsCategoryNameUnique(string categoryName)
        {
            // Create a connection string
            string connectionString = ConfigurationManager.ConnectionStrings["MyEventDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Check if there is any existing category with the same name
                string checkDuplicateQuery = "SELECT COUNT(*) FROM Category WHERE Name = @Name";

                using (SqlCommand checkDuplicateCommand = new SqlCommand(checkDuplicateQuery, connection))
                {
                    checkDuplicateCommand.Parameters.AddWithValue("@Name", categoryName);

                    int count = (int)checkDuplicateCommand.ExecuteScalar();

                    // If count is greater than 0, the categoryName is not unique
                    return count == 0;
                }
            }
        }
    }
}
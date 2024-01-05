using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;

namespace EventApp.Admin
{
    public partial class AddCatagory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed4_Click(object sender, EventArgs e)
        {
            // Retrieve values from the form
            string categoryName = txtCategory.Text.Trim();
            string categoryDescription = txtDescription.Text.Trim();

            // Validate empty fields
            if (string.IsNullOrEmpty(categoryName) && string.IsNullOrEmpty(categoryDescription))
            {
                // Display an error message for both fields empty
                lblMessage.Text = "Both category name and description are required.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
                return; // Exit the method
            }

            if (string.IsNullOrEmpty(categoryName))
            {
                // Display an error message for empty name field
                lblMessage.Text = "Category name cannot be empty.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
                return; // Exit the method
            }

            if (string.IsNullOrEmpty(categoryDescription))
            {
                // Display an error message for empty description field
                lblMessage.Text = "Category description cannot be empty.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
                return; // Exit the method
            }

            // Create a connection string
            string connectionString = ConfigurationManager.ConnectionStrings["MyEventDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Check for duplicate category name
                string checkDuplicateQuery = "SELECT COUNT(*) FROM Category WHERE UPPER(Name) = UPPER(@Name)";
                using (SqlCommand checkDuplicateCommand = new SqlCommand(checkDuplicateQuery, connection))
                {
                    checkDuplicateCommand.Parameters.AddWithValue("@Name", categoryName);

                    int duplicateCount = (int)checkDuplicateCommand.ExecuteScalar();

                    if (duplicateCount > 0)
                    {
                        // Display an error message for duplicate category name
                        lblMessage.Text = "Category name already exists. Please choose a different name.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Visible = true;
                        return; // Exit the method
                    }
                }

                // Retrieve the maximum CategoryID from the Category table
                string getMaxCategoryIdQuery = "SELECT MAX(CAST(SUBSTRING(CategoryID, 2, LEN(CategoryID) - 1) AS INT)) FROM Category WHERE ISNUMERIC(SUBSTRING(CategoryID, 2, LEN(CategoryID) - 1)) = 1";
                using (SqlCommand getMaxCategoryIdCommand = new SqlCommand(getMaxCategoryIdQuery, connection))
                {
                    object result = getMaxCategoryIdCommand.ExecuteScalar();

                    int maxCategoryId;
                    if (result != null && int.TryParse(result.ToString(), out maxCategoryId))
                    {
                        // Increment the maximum CategoryID
                        int nextCategoryId = maxCategoryId + 1;

                        // Format the CategoryID as 'C001', 'C002', etc.
                        string nextCategoryID = "C" + nextCategoryId.ToString("D3");

                        // Insert data into the Category table
                        string insertCategoryQuery = "INSERT INTO Category (CategoryID, Name, Description) VALUES (@CategoryID, @Name, @Description)";
                        using (SqlCommand insertCategoryCommand = new SqlCommand(insertCategoryQuery, connection))
                        {
                            // Add parameters to prevent SQL injection
                            insertCategoryCommand.Parameters.AddWithValue("@CategoryID", nextCategoryID);
                            insertCategoryCommand.Parameters.AddWithValue("@Name", categoryName);
                            insertCategoryCommand.Parameters.AddWithValue("@Description", categoryDescription);

                            // Execute the query
                            insertCategoryCommand.ExecuteNonQuery();
                        }
                    }
                    else
                    {
                        // If there are no existing categories, set the next CategoryID to 'C001'
                        string nextCategoryID = "C001";

                        // Insert data into the Category table
                        string insertCategoryQuery = "INSERT INTO Category (CategoryID, Name, Description) VALUES (@CategoryID, @Name, @Description)";
                        using (SqlCommand insertCategoryCommand = new SqlCommand(insertCategoryQuery, connection))
                        {
                            // Add parameters to prevent SQL injection
                            insertCategoryCommand.Parameters.AddWithValue("@CategoryID", nextCategoryID);
                            insertCategoryCommand.Parameters.AddWithValue("@Name", categoryName);
                            insertCategoryCommand.Parameters.AddWithValue("@Description", categoryDescription);

                            // Execute the query
                            insertCategoryCommand.ExecuteNonQuery();
                        }
                    }
                }
            }

            // Display a success message
            lblMessage.Text = "Category successfully added!";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Visible = true;
        }
    }
}
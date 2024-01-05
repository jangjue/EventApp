using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCrypt.Net;

namespace EventApp
{
    public partial class Login : System.Web.UI.Page
    {
        private static string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB; AttachDbFilename=|DataDirectory|\\EventManagement.mdf; Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string userName = txtUserName.Text;
            string password = txtPassword.Text;

            // Check credentials against the participant table
            if (AuthenticateUser("Participant", userName, password))
            {
                // Redirect to the participant home page
                Response.Redirect("Home.aspx");
                return; // Exit the method to prevent further checks
            }

            // Check credentials against the staff table
            if (AuthenticateUser("Staff", userName, password))
            {
                // Redirect to the staff home page
                Response.Redirect("Admin/Dashboard.aspx");
            }
            else
            {
                // Neither participant nor staff found
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid credentials.');", true);
            }
        }

        private bool AuthenticateUser(string userType, string userName, string enteredPassword)
        {
            string query = $"SELECT {userType}ID, Password FROM {userType} WHERE (UserName = @UserName)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UserName", userName);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read()) // Check if a user with the given username exists
                    {
                        string storedPasswordHash = reader["Password"].ToString();

                        // Compare the entered password with the stored hashed password using BCrypt
                        if (BCrypt.Net.BCrypt.Verify(enteredPassword, storedPasswordHash))
                        {
                            Session["User"] = reader["ParticipantID"].ToString(); // Set the session to the user ID
                            return true;
                        }
                    }

                    return false;
                }
            }
        }


        private bool VerifyHashedPassword(string enteredPassword, string hashedPassword)
        {
            string password = BCrypt.Net.BCrypt.HashPassword(enteredPassword);

            // Replace the following line with your actual password hashing logic
            return password== hashedPassword;
        }

    }
}

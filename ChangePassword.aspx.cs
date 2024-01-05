using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventApp
{
    public partial class VerifyOTP : System.Web.UI.Page
    {
        private static string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB; AttachDbFilename=|DataDirectory|\\EventManagement.mdf; Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            string email = Request.QueryString["email"];

            if (!string.IsNullOrEmpty(email))
            {
                string newPassword = txtNewPassword.Text.Trim();
                string repeatNewPassword = txtRepeatNewPassword.Text.Trim();

                // Validate passwords and update password if validation passes
                if (!string.IsNullOrEmpty(newPassword) && newPassword == repeatNewPassword)
                {
                    UpdatePassword(email, newPassword);

                    string script = "setTimeout(function() { alert('Password changed successful.'); window.location.href = 'Login.aspx'; }, 100);";
                    ScriptManager.RegisterStartupScript(this, GetType(), "redirectScript", script, true);
                }
                else
                {
                    // Handle password validation error (e.g., show error message)
                }
            }
            else
            {
                // Handle missing email parameter (e.g., show error message)
            }
        }


        private void UpdatePassword(string email, string newPassword)
        {
            string query = "UPDATE Participant SET Password = @newPassword WHERE Email = @email";
            string hashedPassword = BCrypt.Net.BCrypt.HashPassword(newPassword);
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@email", email);
                    command.Parameters.AddWithValue("@newPassword", hashedPassword);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }
    }
}
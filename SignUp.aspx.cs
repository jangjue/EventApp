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
    public partial class WebForm2 : System.Web.UI.Page
    {
        private static string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB; AttachDbFilename=|DataDirectory|\\EventManagement.mdf; Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignupButton_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            if (!IsUsernameAvailable(userName.Text.Trim()))
            {
                return;
            }

            // Hash the password using bcrypt
            string hashedPassword = BCrypt.Net.BCrypt.HashPassword(password.Text);

            // SqlConnection
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // Generate ParticipantID
                string participantID = GenerateParticipantID(conn);

                // Read default image file content and convert to byte array
                byte[] defaultImageBytes = ReadImageFile("~/img/profile.png");

                // SqlCommand with parameters
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Participant (ParticipantID, Name, IC, ContactNum, Image, UserName, Password, Email, TokenOfOtp) " +
                    "VALUES (@ParticipantID, @Name, @IC, @ContactNum, @Image, @UserName, @Password, @Email, @otp)", conn))
                {
                    // Add parameters
                    cmd.Parameters.AddWithValue("@ParticipantID", participantID);
                    cmd.Parameters.AddWithValue("@Name", fullName.Text);
                    cmd.Parameters.AddWithValue("@IC", "null");
                    cmd.Parameters.AddWithValue("@ContactNum", "null");

                    if (defaultImageBytes != null)
                    {
                        cmd.Parameters.AddWithValue("@Image", defaultImageBytes);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@Image", DBNull.Value);
                    }
                    cmd.Parameters.AddWithValue("@UserName", userName.Text);
                    cmd.Parameters.AddWithValue("@Password", hashedPassword); // Use hashed password
                    cmd.Parameters.AddWithValue("@Email", email.Text);
                    cmd.Parameters.AddWithValue("@otp", "null");
                    conn.Close();
                    // Open connection and execute query
                    conn.Open();
                    cmd.ExecuteNonQuery();

                    Response.Redirect("Login.aspx");
                }
            }
        }



        private byte[] ReadImageFile(string filePath)
        {
            try
            {
                // Read the content of the image file and convert it to a byte array
                byte[] imageBytes = File.ReadAllBytes(Server.MapPath(filePath));
                return imageBytes;
            }
            catch (Exception ex)
            {
                // Handle exceptions, such as file not found
                // You can log the exception or show an error message
                return null;
            }
        }

        private string GenerateParticipantID(SqlConnection connection)
        {
            string query = "SELECT COUNT(*) FROM Participant";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                connection.Open();
                int count = (int?)command.ExecuteScalar() ?? 0; // If result is null, default to 0
                return $"P{count + 1:D3}";
            }
        }

        [WebMethod]
        public static bool IsUsernameAvailable(string userName)
        {
            // Check if the username is available in the database

            string query = "SELECT COUNT(*) FROM Participant WHERE UserName = @UserName";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UserName", userName);

                    connection.Open();
                    int count = (int)command.ExecuteScalar();

                    return count == 0;
                }
            }
        }
    }
}
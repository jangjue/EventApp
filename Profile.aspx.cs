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
    public partial class Profile : System.Web.UI.Page
    {
        private static string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB; AttachDbFilename=|DataDirectory|\\EventManagement.mdf; Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                // Redirect to the login page
                Response.Redirect("UserLogin.aspx");
            }
            else
            {
                string userId = Session["User"].ToString();
                string query = "SELECT * FROM Participant WHERE ParticipantID = @ParticipantID";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@ParticipantID", userId);

                        connection.Open();

                        // Use SqlDataAdapter to fill a DataTable
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            DataTable dataTable = new DataTable();
                            adapter.Fill(dataTable);

                            // Check if any rows were returned
                            if (dataTable.Rows.Count > 0)
                            {
                                txtName.Text = dataTable.Rows[0]["Name"].ToString();
                                txtEmail.Text = dataTable.Rows[0]["Email"].ToString();
                                txtUsername.Text = dataTable.Rows[0]["UserName"].ToString();
                                txtCurrentPassword.Text = dataTable.Rows[0]["Password"].ToString();
                                // Retrieve image data from the DataTable
                                byte[] imageData = (byte[])dataTable.Rows[0]["Image"];

                                // Convert byte array to base64 string
                                string base64String = Convert.ToBase64String(imageData);

                                // Set the base64 string as the ImageUrl
                                imgAvatar.ImageUrl = "data:image/png;base64," + base64String;
                            }
                            else
                            {
                                // Handle the case where no records were found
                                // You might want to redirect the user or display an error message
                            }
                        }
                    }
                }
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            
        }
        
        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            string participantId = Session["User"].ToString();
            string currentPassword = txtCurrentPassword.Text.Trim();
            string newPassword = txtNewPassword.Text.Trim();
            string repeatNewPassword = txtRepeatNewPassword.Text.Trim();

            // Validate the current password
            if (ValidateCurrentPassword(participantId, currentPassword))
            {
                // Validate the new password and the repeated new password
                if (ValidateNewPasswords(newPassword, repeatNewPassword))
                {
                    UpdatePassword(participantId, newPassword);
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    ShowErrorMessage("New passwords do not match.");
                }
            }
            else
            {
                ShowErrorMessage("Incorrect current password.");
            }
        }

        private bool ValidateCurrentPassword(string participantId, string currentPassword)
        {
            string query = "SELECT COUNT(*) FROM Participant WHERE ParticipantID = @participantId AND Password = @currentPassword";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@participantId", participantId);
                    command.Parameters.AddWithValue("@currentPassword", currentPassword);

                    connection.Open();

                    int count = Convert.ToInt32(command.ExecuteScalar());

                    return count > 0;
                }
            }
        }

        private bool ValidateNewPasswords(string newPassword, string repeatNewPassword)
        {
            // Check if the new passwords match, are not empty, and meet additional criteria
            if (!string.IsNullOrWhiteSpace(newPassword) && newPassword == repeatNewPassword)
            {
                return true;
            }
            // Return false if the passwords do not meet the criteria
            return false;
        }


        private void UpdatePassword(string participantId, string newPassword)
        {
            string query = "UPDATE Participant SET Password = @newPassword WHERE ParticipantID = @participantId";
            string hashedPassword = BCrypt.Net.BCrypt.HashPassword(newPassword);
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@participantId", participantId);
                    command.Parameters.AddWithValue("@newPassword", hashedPassword);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        private void ShowErrorMessage(string message)
        {
            // You can customize how you want to display error messages to the user
            // For example, you might set a label's text or display a JavaScript alert
            ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{HttpUtility.JavaScriptStringEncode(message)}');", true);
        }

        protected void Sumbit_Click(object sender, EventArgs e)
        {
            // Gather data from textboxes
            string userId = Session["User"].ToString();
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string username = txtUsername.Text.Trim();
            string ic = txtIC.Text.Trim();  // Assuming you have an IC textbox
            string contactNum = txtContactNum.Text.Trim();  // Assuming you have a contact number textbox

            // Update the participant's general information in the database
            UpdateParticipantInfo(userId, name, email, username, ic, contactNum);

            // Display a success message or redirect to another page if needed
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Profile updated successfully.');", true);
        }

        private void UpdateParticipantInfo(string userId, string name, string email, string username, string ic, string contactNum)
        {
            // Construct the update query
            string query = "UPDATE Participant SET Name = @name, Email = @email, UserName = @username, IC = @ic, ContactNum = @contactNum WHERE ParticipantID = @userId";

            // Set up SqlConnection and SqlCommand
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to the command
                    command.Parameters.AddWithValue("@userId", userId);
                    command.Parameters.AddWithValue("@name", name);
                    command.Parameters.AddWithValue("@email", email);
                    command.Parameters.AddWithValue("@username", username);
                    command.Parameters.AddWithValue("@ic", ic);
                    command.Parameters.AddWithValue("@contactNum", contactNum);

                    try
                    {
                        // Open connection and execute the update query
                        //connection.Open();
                        //command.ExecuteNonQuery();
                        Response.Redirect(Request.Url.ToString());
                    }
                    catch (Exception ex)
                    {
                        // Handle the exception (e.g., log it, display an error message)
                        // You might want to provide user-friendly error handling
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error updating profile: {HttpUtility.JavaScriptStringEncode(ex.Message)}');", true);
                    }
                }
            }
        }

        protected void VerifyEmail_Click(object sender, EventArgs e)
        {
            string userName = txtUsername.Text.Trim();
            string email = txtEmail.Text.Trim();
            string link = HttpContext.Current.Request.Url.AbsoluteUri;

            // Call the SendVerificationEmail method
            SendEmail emailSender = new SendEmail();
            emailSender.SendVerificationEmail(userName, email, link);

        }
    }
}
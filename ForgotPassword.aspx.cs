using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventApp
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        private static string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB; AttachDbFilename=|DataDirectory|\\EventManagement.mdf; Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();

            // Check if the email exists in your database and if OTP is not already generated
            if (IsEmailValid(email))
            {
                string existingOTP = GetStoredOTP(email);

                if (string.IsNullOrEmpty(existingOTP))
                {
                    // OTP is not generated, generate and send the verification email
                    string otp = GenerateOTP();

                    // Store the OTP in the database
                    StoreOTPInDatabase(email, otp);

                    // Send the verification email
                    string link = HttpContext.Current.Request.Url.AbsoluteUri;
                    SendEmail emailSender = new SendEmail();
                    emailSender.SendVerificationEmail("User", email, otp, link);

                    // Disable the "Send OTP" button after it has been clicked
                    btnSubmit.Enabled = false;
                }
                else
                {
                    // Handle the case when the OTP is already generated and sent
                    lblError.Text = "Verification email already sent. Please check your inbox. " +
                        "If you did not receive it, you can click the 'Resend OTP' button.";
                }
            }
            else
            {
                // Handle the case when the email is not valid
                lblError.Text = "Invalid email address.";
            }
        }

        protected void btnResendOTP_Click(object sender, EventArgs e)
        {
            // Resend the OTP when the user clicks the "Resend OTP" button

            string email = txtEmail.Text.Trim();
            string existingOTP = GetStoredOTP(email);

            if (!string.IsNullOrEmpty(existingOTP))
            {
                // OTP is already generated, regenerate and send the verification email
                string newOTP = GenerateOTP();

                // Update the stored OTP in the database
                StoreOTPInDatabase(email, newOTP);

                // Send the verification email with the new OTP
                string link = HttpContext.Current.Request.Url.AbsoluteUri;
                SendEmail emailSender = new SendEmail();
                emailSender.SendVerificationEmail("User", email, newOTP, link);

                // Inform the user that a new OTP has been sent
                lblError.Text = "New verification email sent. Please check your inbox.";
            }
            else
            {
                // OTP is not generated, generate and send the verification email
                string otp = GenerateOTP();

                // Store the OTP in the database
                StoreOTPInDatabase(email, otp);

                // Send the verification email
                string link = HttpContext.Current.Request.Url.AbsoluteUri;
                SendEmail emailSender = new SendEmail();
                emailSender.SendVerificationEmail("User", email, otp, link);
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Retrieve user input OTP
            string userOTP = txtOTP.Text.Trim();

            // Retrieve stored OTP from the database
            string storedOTP = GetStoredOTP(txtEmail.Text.Trim());

            // Check if user input is not empty and is 6 digits
            if (!string.IsNullOrEmpty(userOTP) && userOTP.Length == 6)
            {
                if (userOTP == storedOTP)
                {
                    // Redirect to the ChangePassword page
                    string email = txtEmail.Text.Trim();
                    Response.Redirect($"ChangePassword.aspx?email={email}");
                }
                else
                {
                    // Invalid OTP
                    lblError.Text = "Invalid OTP. Please try again.";
                }
            }
            else
            {
                // Invalid OTP format
                lblError.Text = "Invalid OTP format. Please enter a 6-digit OTP.";
            }
        }


        private bool IsEmailValid(string email)
        {
            string query = "SELECT COUNT(*) FROM Participant WHERE Email = @email";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@email", email);

                    connection.Open();
                    int count = (int)command.ExecuteScalar();

                    return count > 0;
                }
            }
        }

        private string GetStoredOTP(string email)
        {
            string query = "SELECT TokenOfOtp FROM Participant WHERE Email = @email AND TokenOfOtp IS NOT NULL";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@email", email);

                    connection.Open();
                    return (string)command.ExecuteScalar();
                }
            }
        }

        private void StoreOTPInDatabase(string email, string otp)
        {
            string query = "UPDATE Participant SET TokenOfOtp = @TokenOfOtp WHERE email = @email";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@email", email);
                    command.Parameters.AddWithValue("@TokenOfOtp", otp);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        static string GenerateOTP()
        {
            Random random = new Random();
            int otpNumber = random.Next(100000, 999999); 

            return otpNumber.ToString("D6"); 
        }
    }
}
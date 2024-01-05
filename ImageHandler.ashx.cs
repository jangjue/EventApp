using System;
using System.Data.SqlClient;
using System.Web;

namespace EventApp
{
    /// <summary>
    /// Summary description for ImageHandler
    /// </summary>
    public class ImageHandler : IHttpHandler
    {
        //private static string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB; AttachDbFilename=C:\\Users\\yikming\\source\\repos\\EventApp\\App_Data\\EventManagement.mdf; Integrated Security=True";
        private static string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB; AttachDbFilename=C:\\Users\\Jue\\Desktop\\School\\Repeat\\WAD\\New folder\\EventApp\\EventApp\\App_Data\\EventManagement.mdf; Integrated Security=True";

        public void ProcessRequest(HttpContext context)
        {
            string eventID = context.Request.QueryString["EventID"];

            // Validate and sanitize the input (prevent SQL injection)
            if (!string.IsNullOrEmpty(eventID))
            {
                // Query the database to get the image data based on EventID
                byte[] imageData = GetImageData(eventID);

                if (imageData != null)
                {
                    // Set the response headers for image content
                    context.Response.ContentType = "image/jpeg"; // Adjust based on your image format

                    // Write the image data to the response stream
                    context.Response.BinaryWrite(imageData);
                }
                else
                {
                    // Handle the case where image data is not found
                    context.Response.StatusCode = 404; // Not Found
                }
            }
            else
            {
                // Handle the case where EventID is missing or not valid
                context.Response.StatusCode = 400; // Bad Request
            }
        }

        private byte[] GetImageData(String eventID)
        {
            // Query the database to get image data based on EventID
            string query = $"SELECT Image FROM Event WHERE EventID = @EventID";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@EventID", eventID);

                    connection.Open();
                    return (byte[])command.ExecuteScalar();
                }
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}

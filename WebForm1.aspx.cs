using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventApp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            string userName = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string subject = txtName.Text.Trim();
            string msg = txtMessage.Text.Trim();
            string link = HttpContext.Current.Request.Url.AbsoluteUri;

            // Call the SendVerificationEmail method
            SendEmail emailSender = new SendEmail();
            emailSender.SendVerificationEmail(userName, email, subject, msg, link);

        }
    }
}
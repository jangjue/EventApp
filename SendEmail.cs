using MimeKit;
using MailKit.Net.Smtp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Xml.Linq;


namespace EventApp
{
    public class SendEmail
    {
        public void SendVerificationEmail(string userName,string email,string otp, string link)
        {

            string emailContent = $@"
                <!DOCTYPE html>
                <html lang=""en"">
                <head>
                    <meta charset=""UTF-8"">
                    <title>OTP Verification</title>
                </head>
                <body>
                    Hi {userName},
                    Thank you for using our EMS! This is your OTP Code <br><br> <h2>{otp}</h2>.<br><br>
                    Please reset your password in 30 minutes.
                </body>
                ";

            var emailSender = new EmailSender("smtp.gmail.com", 587, "yikmingsoh7@gmail.com", "fzdx fmoo enek pyet");
            emailSender.SendEmail(email, "Verify OTP Email", emailContent);
        }

        public void SendVerificationEmail(string userName, string email, string subject, string msg, string link)
        {

            string emailContent = $@"
                <!DOCTYPE html>
                <html lang=""en"">
                <head>
                    <meta charset=""UTF-8"">
                    <title>Email Verification</title>
                </head>
                <body>
                    Name: {userName},<br>
                    Email: {email},<br>
                    Subject: {subject},<br>
                    Message: {msg},
                </body>
                ";

            var emailSender = new EmailSender("smtp.gmail.com", 587, "yikmingsoh7@gmail.com", "fzdx fmoo enek pyet");
            emailSender.SendEmail("yikmingsoh7@gmail.com", "Contact Us", emailContent);
        }

        public void SendVerificationEmail(string userName, string email, string link)
        {

            string emailContent = $@"
            <!DOCTYPE html>
            <html lang=""en"">
            <head>
                <meta charset=""UTF-8"">
                <title>Email Verification</title>
            </head>
            <body>
                Hi {userName},<br><br>
                Thank you for signing up on EMS! We're excited to have you on board and will be happy to help you set everything up.<br>
                Please click the link below to verify your email address: {email}<br><br>
                <a href=""{link}"">Click Here</a>
            </body>
            </html>";

            var emailSender = new EmailSender("smtp.gmail.com", 587, "yikmingsoh7@gmail.com", "fzdx fmoo enek pyet");
            emailSender.SendEmail(email, "Verify Email", emailContent);
        }
    }

    public class EmailSender
    {
        private readonly string _smtpServer;
        private readonly int _smtpPort;
        private readonly string _smtpUsername;
        private readonly string _smtpPassword;

        public EmailSender(string smtpServer, int smtpPort, string smtpUsername, string smtpPassword)
        {
            _smtpServer = smtpServer;
            _smtpPort = smtpPort;
            _smtpUsername = smtpUsername;
            _smtpPassword = smtpPassword;
        }

        public void SendEmail(string toEmail, string subject, string body)
        {
            var message = new MimeMessage();
            message.From.Add(new MailboxAddress("EMS", "ems@eventmanage.com"));
            message.To.Add(new MailboxAddress("", toEmail));
            message.Subject = subject;

            message.Body = new TextPart("html")
            {
                Text = body
            };

            using (var client = new SmtpClient())
            {
                client.Connect(_smtpServer, _smtpPort, false);
                client.Authenticate(_smtpUsername, _smtpPassword);
                client.Send(message);
                client.Disconnect(true);
            }
        }
    }

}
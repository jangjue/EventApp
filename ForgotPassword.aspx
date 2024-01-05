<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="EventApp.ForgotPassword" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login & Signup Form</title>
    <link rel="stylesheet" href="css/login.css" />
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<%--<script type="text/javascript">
    function showOTPTextBox() {
        var btnSubmit = document.getElementById('<%= btnSubmit.ClientID %>');
        var txtOTP = document.getElementById('<%= txtOTP.ClientID %>');

        // Set the elements to be visible
        btnSubmit.style.display = 'block';
        txtOTP.style.display = 'block';

        // Set a cookie to indicate that OTP has been sent
        document.cookie = "otpSent=true; path=/";

        return true; // Allow the default form submission to occur
    }

    function checkIfOTPSent() {
        // Read the cookie to check if OTP has been sent
        var otpSent = document.cookie.replace(/(?:(?:^|.*;\s*)otpSent\s*=\s*([^;]*).*$)|^.*$/, "$1");

        if (otpSent === "true") {
            // If OTP has been sent, show the OTP elements
            showOTPTextBox();
        }
    }

    function resetCookieOnClose() {
        // Reset the cookie when the window is closed
        document.cookie = "otpSent=; path=/; expires=0;";
    }

    // Call the function to check if OTP has been sent on page load
    window.onload = checkIfOTPSent;

    // Call the function to reset the cookie on window close
    window.onbeforeunload = resetCookieOnClose;
</script>--%>

</head>
<body>
    <section class="wrapper">
        <div class="form signup">
            <header>Login</header>
            <form runat="server" id="loginForm" onsubmit="return submitForm()">
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email" />
                <asp:TextBox ID="txtOTP" runat="server" placeholder="Enter OTP"/>

                <!-- RegularExpressionValidator for 6-digit OTP -->
                <asp:RegularExpressionValidator ID="revOTP" runat="server" ControlToValidate="txtOTP"
                    ValidationExpression="^\d{6}$" ErrorMessage="OTP must be a 6-digit number." Display="Dynamic" CssClass="text-danger" />

                <asp:Button ID="btnSend" runat="server" Text="Send OTP" OnClick="btnSend_Click"  />
                <asp:Button ID="btnResend" runat="server" Text="Did Not receive? Click to resend." OnClick="btnResendOTP_Click" />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                <asp:Label ID="lblError" runat="server" Text=""></asp:Label><br />
            </form>
        </div>
    </section>
</body>
</html>

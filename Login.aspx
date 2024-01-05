<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EventApp.Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login & Signup Form</title>
    <link rel="stylesheet" href="css/login.css" />
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
    <section class="wrapper">
        <div class="form signup">
            <header>Login</header>
            <form runat="server" id="loginForm" onsubmit="return submitForm()">
                <asp:TextBox ID="txtUserName" runat="server" placeholder="User Name" />
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" />
                <asp:Button ID="loginButton" runat="server" Text="Login" OnClientClick="return submitForm()" OnClick="btnLogin_Click" />
            </form>

        </div>
                <div class="text">
            <h3>Forgot Password? <a href="ForgotPassword.aspx">Click Here</a></h3>
        </div>        <div class="text">
            <h3>Does Not have an account? <a href="SignUp.aspx">Sign Up now</a></h3>
        </div>
    </section>
</body>
</html>

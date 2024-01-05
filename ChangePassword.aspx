<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="EventApp.VerifyOTP" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Change Password</title>
    <link rel="stylesheet" href="css/login.css" />
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
    <section class="wrapper">
        <div class="form signup">
            <header>Change Password</header>
            <form runat="server" id="loginForm" onsubmit="return submitForm()">

                    <asp:TextBox runat="server" ID="txtNewPassword" TextMode="Password" placeholder="New Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ControlToValidate="txtNewPassword" Text="New Password is required." ErrorMessage="New Password is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>

                    <asp:TextBox runat="server" ID="txtRepeatNewPassword" TextMode="Password" placeholder="Repeat Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvRepeatNewPassword" runat="server" ControlToValidate="txtRepeatNewPassword" Text="Repeat New Password is required." ErrorMessage="Repeat New Password is required." CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvRepeatNewPassword" runat="server" ControlToCompare="txtNewPassword" ControlToValidate="txtRepeatNewPassword" Operator="Equal" Type="String" Text="Passwords do not match." ErrorMessage="Passwords do not match." CssClass="text-danger" Display="Dynamic"></asp:CompareValidator>
                    <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="Invalid password format. Password must include at least one uppercase letter, one lowercase letter, one digit, and one special character." Display="Dynamic" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$" CssClass="text-danger" />
                    <br/>
                    <asp:Button runat="server" ID="btnChangePassword" Text="Change Password" OnClick="btnChangePassword_Click" />
            </form>
        </div>
    </section>
</body>
</html>



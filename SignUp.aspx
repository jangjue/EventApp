<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="EventApp.WebForm2" %>

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
            <header>Signup</header>
            <form runat="server" id="signupForm" onsubmit="return submitForm()">
                <span id="usernameAvailability"></span>
                <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ControlToValidate="fullName" ErrorMessage="Full name is required." Display="Dynamic" CssClass="text-danger"/>
                <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="userName" ErrorMessage="User Name is required." Display="Dynamic" CssClass="text-danger"/>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="email" ErrorMessage="Email address is required." Display="Dynamic" CssClass="text-danger"/>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="email" ErrorMessage="Invalid email address." Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="text-danger"/>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="password" ErrorMessage="Password is required." Display="Dynamic" CssClass="text-danger"/>
                <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="password" ErrorMessage="Invalid password format. Password must include at least one uppercase letter, one lowercase letter, one digit, and one special character." Display="Dynamic" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$" CssClass="text-danger"/>
                <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="confirmPassword" ErrorMessage="Confirm Password is required." Display="Dynamic" CssClass="text-danger"/>
                <asp:CompareValidator ID="cvPasswordMatch" runat="server" ControlToCompare="password" ControlToValidate="confirmPassword" ErrorMessage="Passwords do not match." Display="Dynamic" CssClass="text-danger"/>

                <asp:TextBox ID="fullName" runat="server" placeholder="Full name" />
                <asp:TextBox ID="userName" runat="server" placeholder="User Name" />
                <asp:TextBox ID="email" runat="server" placeholder="Email address" />
                <asp:TextBox ID="password" runat="server" TextMode="Password" placeholder="Password" />
                <asp:TextBox ID="confirmPassword" runat="server" TextMode="Password" placeholder="Confirm Password" />
                <asp:Button ID="signupButton" runat="server" Text="Signup" OnClientClick="return submitForm()" OnClick="SignupButton_Click" />
            </form>
        </div>
        <script>
            $(document).ready(function () {
                $("#userName").blur(function () {
                    // Get the entered username
                    var userName = $("#userName").val();

                    // Call the WebMethod to check username availability
                    $.ajax({
                        type: "POST",
                        url: "SignUp.aspx/IsUsernameAvailable",
                        data: '{userName: "' + userName + '" }',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d) {
                                // Username is available
                                // You can update the UI accordingly, e.g., show a green checkmark
                                $("#usernameAvailability").text("Username is available").css("color", "green");
                            } else {
                                // Username is not available
                                // You can update the UI accordingly, e.g., show a red warning
                                $("#usernameAvailability").text("Username is already taken").css("color", "red");
                            }
                        },
                        error: function (error) {
                            console.log(error);
                        }
                    });
                });
            });
        </script>

    </section>
</body>
</html>

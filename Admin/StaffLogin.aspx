<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffLogin.aspx.cs" Inherits="EventApp.Admin.StaffLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Form</title>
    <link rel="stylesheet" type="text/css" href="../css/StyleSheet1.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        form {
            border: 3px solid #f1f1f1;
        }

        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        button:hover {
            opacity: 0.8;
        }

        .cnbtn {
            background-color: #ec3f3f;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 49%;
        }

        .lgnbtn {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 50%;
        }

        .imgcontainer {
            text-align: center;
            margin: 24px 0 12px 0;
        }

        img.avatar {
            width: 40%;
            border-radius: 50%;
        }

        .container {
            padding: 16px;
        }

        span.psw {
            float: right;
            padding-top: 16px;
        }
        /* Change styles for span and cancel button on extra small screens */
        @media screen and (max-width: 300px) {
            span.psw {
                display: block;
                float: none;
            }

            .cnbtn {
                width: 100%;
            }
        }

        .frmalg {
            margin: auto;
            width: 40%;
        }

        .auto-style1 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            cursor: pointer;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server" class="frmalg">
        <asp:Login ID="Login1" runat="server" class="frmalg">
            <LayoutTemplate>
                <center>
                    <h3>Staff Login </h3>
                </center>
                <table align="center" cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                    <tr>
                        <td>
                            <table cellpadding="0">
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:CheckBox ID="RememberMe" runat="server" Text=" Remember me" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="color: Red;">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:Button ID="LoginButton" Width="341px" CssClass="auto-style1" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:HyperLink ID="HyperLink1" Width="307px" runat="server" CssClass="form-button" Text="Back" NavigateUrl="~/Home.aspx" Font-Underline="False"></asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:Login>


    </form>
</body>
</html>

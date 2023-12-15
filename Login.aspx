<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EventApp.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="/css/StyleSheet1.css" />
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Login ID="Login1" runat="server" class="frmalg" DestinationPageUrl="~/Home.aspx">
        <LayoutTemplate>
            <center>
                <h3>Login </h3>
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
                                    <asp:HyperLink ID="HyperLink1" Width="341px" runat="server" CssClass="form-button" Text="Staff?" NavigateUrl="~/Admin/StaffLogin.aspx" Font-Underline="False"></asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:Login>
</asp:Content>

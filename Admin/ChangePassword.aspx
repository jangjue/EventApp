<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="EventApp.Admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/StyleSheet1.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ChangePassword runat="server">
        <CancelButtonStyle CssClass="cancel-button" />
        <ChangePasswordButtonStyle CssClass="form-button" />
        <ChangePasswordTemplate>
            <h2 class="form-header">Change Your Password</h2>
            <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table cellpadding="0">
                            <tr>
                                <td align="left" class="form-label">
                                    <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword">Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="CurrentPassword" runat="server" CssClass="form-input" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="ctl11">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="form-label">
                                    <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword">New Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="NewPassword" runat="server" CssClass="form-input" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword" ErrorMessage="New Password is required." ToolTip="New Password is required." ValidationGroup="ctl11">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" class="form-label">
                                    <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword">Confirm New Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="ConfirmNewPassword" runat="server" CssClass="form-input" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword" ErrorMessage="Confirm New Password is required." ToolTip="Confirm New Password is required." ValidationGroup="ctl11">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" Display="Dynamic" ErrorMessage="The Confirm New Password must match the New Password entry." ValidationGroup="ctl11"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword" CssClass="form-button" Text="Change Password" ValidationGroup="ctl11" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </ChangePasswordTemplate>
        <LabelStyle CssClass="form-label" />
        <TextBoxStyle CssClass="form-input" />
        <TitleTextStyle CssClass="form-header" />
    </asp:ChangePassword>
    <p>&nbsp;</p>
</asp:Content>

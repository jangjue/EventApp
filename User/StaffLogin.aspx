<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffLogin.aspx.cs" Inherits="EventApp.User.StaffLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Welcome to Staff Login<br />
            <br />
            <asp:Login ID="Login1" runat="server">
            </asp:Login>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/MainPage.aspx">Go Back to Main</asp:HyperLink>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StaffMenu.aspx.cs" Inherits="EventApp.User.Staff.StaffMenu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Staff Menu<br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server">Create Staff User</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/User/Staff/UserManagement.aspx">Staff Management</asp:HyperLink>
        </div>
    </form>
</body>
</html>

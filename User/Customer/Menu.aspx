<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="EventApp.User.Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            The Ticketing Store - Customer Side<br />
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server">Order a Ticket</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink3" runat="server">Order History</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server">Edit My Account</asp:HyperLink>
            <br />
            <br />
        </div>
    </form>
</body>
</html>

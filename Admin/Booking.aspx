<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="EventApp.Admin.Booking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/table.css" />

    <div style="margin-top: 20px; margin-bottom: 20px;">
    <table id="myTable" class="auto-style4">
    <thead>
        <h2>Manage Booking</h2>
    <hr style="margin-top: 10px; margin-bottom: 20px;" />
        <tr>
            <th class="auto-style6">#</th>
            <th class="auto-style6">Booking ID</th>
            <th class="auto-style6">Event Name</th>
            <th class="auto-style6">Full Name</th>
            <th class="auto-style6">Number of Ticket</th>
            <th class="auto-style6">Booking Date</th>
            <th class="auto-style6">Action</th>

        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="auto-style5">1</td>
            <td class="auto-style5">B001</td>
            <td class="auto-style5">Basketball Competition</td>
            <td class="auto-style5">Soh Yik Ming</td>
            <td class="auto-style5">1</td>
            <td class="auto-style5">2023-12-15</td>
            <td class="auto-style5"><asp:Button runat="server" Text="Delete" CssClass="cancel-button" /></td>
        </tr>
        <tr>
            <td class="auto-style5">2</td>
            <td class="auto-style5">B002</td>
            <td class="auto-style5">Political Speech</td>
            <td class="auto-style5">Lau Hui Liang</td>
            <td class="auto-style5">3</td>
            <td class="auto-style5">2023-11-17</td>
            <td class="auto-style5">
                <asp:Button runat="server" Text="Delete" CssClass="cancel-button" />
            </td>
        </tr>
        <tr>
            <td class="auto-style5">3</td>
            <td class="auto-style5">B003</td>
            <td class="auto-style5">Invest Sharing</td>
            <td class="auto-style5">Yee Jang Jue</td>
            <td class="auto-style5">4</td>
            <td class="auto-style5">2023-10-11</td>
            <td class="auto-style5">
                <asp:Button runat="server" Text="Delete" CssClass="cancel-button" />
            </td>
        </tr>
    </tbody>
</table>
        </div>
</asp:Content>

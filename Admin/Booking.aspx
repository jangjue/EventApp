<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="EventApp.Admin.Booking1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/table.css" />

    <div style="margin-top: 20px; margin-bottom: 20px;">
    <table id="myTable" class="auto-style4">
    <thead>
        <h2>View Booking</h2>
    <hr style="margin-top: 10px; margin-bottom: 20px;" />
        <tr>
            <th class="auto-style6">#</th>
            <th class="auto-style6">Event ID</th>
            <th class="auto-style6">Event Name</th>
            <th class="auto-style6">Total Ticket</th>
            <th class="auto-style6">Available Ticket</th>
            <th class="auto-style6">Start Date</th>
            <th class="auto-style6">End Date</th>
            <th class="auto-style6">Action</th>

        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="auto-style5">1</td>
            <td class="auto-style5">E001</td>
            <td class="auto-style5">Basketball Competition</td>
            <td class="auto-style5">100</td>
            <td class="auto-style5">1</td>
            <td class="auto-style5">2023-12-15</td>
            <td class="auto-style5">2023-12-17</td>
            <td class="auto-style5"><asp:Button runat="server" Text="View" CssClass="edit-button" PostBackUrl="~/Admin/ViewEventBooking.aspx" /></td>
        </tr>
        <tr>
            <td class="auto-style5">2</td>
            <td class="auto-style5">E002</td>
            <td class="auto-style5">Basketball Competition</td>
            <td class="auto-style5">100</td>
            <td class="auto-style5">1</td>
            <td class="auto-style5">2023-12-15</td>
            <td class="auto-style5">2023-12-17</td>
            <td class="auto-style5"><asp:Button runat="server" Text="View" CssClass="edit-button" PostBackUrl="~/Admin/ViewEventBooking.aspx" /></td>
        </tr>
        <tr>
            <td class="auto-style5">3</td>
            <td class="auto-style5">E003</td>
            <td class="auto-style5">Basketball Competition</td>
            <td class="auto-style5">100</td>
            <td class="auto-style5">1</td>
            <td class="auto-style5">2023-12-15</td>
            <td class="auto-style5">2023-12-17</td>
            <td class="auto-style5"><asp:Button runat="server" Text="View" CssClass="edit-button" /></td>
        </tr>
                <tr>
            <td class="auto-style5">4</td>
            <td class="auto-style5">E004</td>
            <td class="auto-style5">Basketball Competition</td>
            <td class="auto-style5">100</td>
            <td class="auto-style5">1</td>
            <td class="auto-style5">2023-12-15</td>
            <td class="auto-style5">2023-12-17</td>
            <td class="auto-style5"><asp:Button runat="server" Text="View" CssClass="edit-button" /></td>
        </tr>
                <tr>
            <td class="auto-style5">5</td>
            <td class="auto-style5">E005</td>
            <td class="auto-style5">Basketball Competition</td>
            <td class="auto-style5">100</td>
            <td class="auto-style5">1</td>
            <td class="auto-style5">2023-12-15</td>
            <td class="auto-style5">2023-12-17</td>
            <td class="auto-style5"><asp:Button runat="server" Text="View" CssClass="edit-button" /></td>
        </tr>
                <tr>
            <td class="auto-style5">6</td>
            <td class="auto-style5">E006</td>
            <td class="auto-style5">Basketball Competition</td>
            <td class="auto-style5">100</td>
            <td class="auto-style5">1</td>
            <td class="auto-style5">2023-12-15</td>
            <td class="auto-style5">2023-12-17</td>
            <td class="auto-style5"><asp:Button runat="server" Text="View" CssClass="edit-button" /></td>
        </tr>
                <tr>
            <td class="auto-style5">7</td>
            <td class="auto-style5">E007</td>
            <td class="auto-style5">Basketball Competition</td>
            <td class="auto-style5">100</td>
            <td class="auto-style5">1</td>
            <td class="auto-style5">2023-12-15</td>
            <td class="auto-style5">2023-12-17</td>
            <td class="auto-style5"><asp:Button runat="server" Text="View" CssClass="edit-button" /></td>
        </tr>
                <tr>
            <td class="auto-style5">8</td>
            <td class="auto-style5">E008</td>
            <td class="auto-style5">Basketball Competition</td>
            <td class="auto-style5">100</td>
            <td class="auto-style5">1</td>
            <td class="auto-style5">2023-12-15</td>
            <td class="auto-style5">2023-12-17</td>
            <td class="auto-style5"><asp:Button runat="server" Text="View" CssClass="edit-button" /></td>
        </tr>

    </tbody>
</table>
        </div>
</asp:Content>

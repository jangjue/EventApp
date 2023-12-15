<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ViewBooking.aspx.cs" Inherits="EventApp.Admin.Booking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/table.css" />

    <div style="margin-top: 20px; margin-bottom: 20px;">
    <table id="myTable" class="auto-style4">
    <thead>
        <h2>View Event Booking</h2>
    <hr style="margin-top: 10px; margin-bottom: 20px;" />
        <asp:Label runat="server" Text="Label">Select the event that you want to view booking status</asp:Label><br /><br />
        <tr>
            <th class="auto-style6">#</th>
            <th class="auto-style6">Event ID</th>
            <th class="auto-style6">Event Name</th>
            <th class="auto-style6">Total Seat</th>
            <th class="auto-style6">Available Seat</th>
            <th class="auto-style6">Start Date</th>
            <th class="auto-style6">End Date</th>
            <th class="auto-style6">Action</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1</td>
            <td>E001</td>
            <td>Basketball Competition</td>
            <td>100</td>
            <td>1</td>
            <td>2023-12-15</td>
            <th><asp:Button runat="server" Text="View"/></th>
        </tr>
        <tr>
            <td class="auto-style5">2</td>
            <td class="auto-style5">B002</td>
            <td class="auto-style5">Political Speech</td>
            <td class="auto-style5">Lau Hui Liang</td>
            <td class="auto-style5">3</td>
            <td class="auto-style5">2023-11-17</td>
            <th class="auto-style5"><asp:Button runat="server" Text="View"/></th>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">3</td>
            <td class="auto-style5">B003</td>
            <td class="auto-style5">Invest Sharing</td>
            <td class="auto-style5">Yee Jang Jue</td>
            <td class="auto-style5">4</td>
            <td class="auto-style5">2023-10-11</td>
            <th class="auto-style5"><asp:Button runat="server" Text="View"/></th>
            </td>
        </tr>
    </tbody>
</table>
        </div>
</asp:Content>

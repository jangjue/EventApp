<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="EventApp.Admin.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../css/dashboard.css">
    <script src="../js/dashboard.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Dashboard</h2>
<hr style="margin-top: 10px; margin-bottom: 20px;" />
    <div class="dashboard">
        <div class="box">
            <div class="metric" id="totalEventsBox">
                <h2>Total Events</h2>
                <p><asp:Label ID="totalEvents" runat="server"></asp:Label></p>
            </div>
        </div>

        <div class="box">
            <div class="metric">
                <h2>Total Categories</h2>
                <p><asp:Label ID="totalCategories" runat="server"></asp:Label></p>
            </div>
        </div>

        <div class="box">
            <div class="metric">
                <h2>Total Venues</h2>
                <p><asp:Label ID="totalVenues" runat="server"></asp:Label></p>
            </div>
        </div>

        <div class="box">
            <div class="metric">
                <h2>Total Bookings</h2>
                <p><asp:Label ID="totalBookings" runat="server"></asp:Label></p>
            </div>
        </div>
    </div>

  

</asp:Content>
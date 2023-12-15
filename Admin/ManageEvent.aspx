<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ManageEvent.aspx.cs" Inherits="EventApp.Admin.ManageEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/table.css" />

    <div style="margin-top: 20px; margin-bottom: 20px;">
    <table id="myTable" class="auto-style4">
    <thead>
        <h2>Manage Event</h2>
    <hr style="margin-top: 10px; margin-bottom: 20px;" />
        <tr>
            <th class="auto-style6">#</th>
            <th class="auto-style6">Event Name</th>
            <th class="auto-style6">Category</th>
            <th class="auto-style6">Event from - To</th>
            <th class="auto-style6">Action</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="auto-style5">1</td>
            <td class="auto-style5">Basketball Competition</td>
            <td class="auto-style5">Sport</td>
            <td class="auto-style5">2023-05-21 - 2023-05-22</td>
            <td class="auto-style5"><asp:Button runat="server" Text="Edit" CssClass="edit-button" /></td>

        </tr>
        <tr>
            <td class="auto-style5">2</td>
            <td class="auto-style5">political Speech</td>
            <td class="auto-style5">Political</td>
            <td class="auto-style5">2023-05-25 - 2023-05-28</td>
            <td class="auto-style5"><asp:Button runat="server" Text="Edit" CssClass="edit-button" /></td>
        </tr>
        <tr>
             <td class="auto-style5">3</td>
             <td class="auto-style5">Investment sharing</td>
             <td class="auto-style5">Business</td>
             <td class="auto-style5">2023-05-28 - 2023-05-28</td>
             <td class="auto-style5"><asp:Button runat="server" Text="Edit" CssClass="edit-button" /></td>
        </tr>
    </tbody>
</table>
        </div>
</asp:Content>
<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ManageUser.aspx.cs" Inherits="EventApp.Admin.ManageUser" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/table.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 20px; margin-bottom: 20px;">
        <table id="myTable" class="auto-style4">
            <thead>
                <h2>Manage Users</h2>
                <hr style="margin-top: 10px; margin-bottom: 20px;" />
                <tr>
                    <th>#</th>
                    <th>Full Name</th>
                    <th>Username</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="auto-style5">1</td>
                    <td class="auto-style5">Lau Hui Liang</td>
                    <td class="auto-style5">Rather</td>
                    <td class="auto-style5"><asp:Button runat="server" Text="Edit" CssClass="edit-button" /></td>
                </tr>
                <tr>
                    <td class="auto-style5">2</td>
                    <td class="auto-style5">Soh Yik Ming</td>
                    <td class="auto-style5">Super123</td>
                    <td class="auto-style5"><asp:Button runat="server" Text="Edit" CssClass="edit-button" /></td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>

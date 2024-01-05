<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ManageVenue.aspx.cs" Inherits="EventApp.Admin.ManageVenue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style7 {
            width: 659px;
            height: 214px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/table.css" />

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound">
        <HeaderTemplate>
            <table id="myTable" class="auto-style4">
                <thead>
                    <h2>Manage Venue</h2>
                    <hr style="margin-top: 10px; margin-bottom: 20px;" />
                    <tr>
                        <th class="auto-style6">#</th>
                        <th class="auto-style6">Venue Name</th>
                        <th class="auto-style6">Location</th>
                        <th class="auto-style6">State</th>
                        <th class="auto-style6">Action</th>
                    </tr>
                </thead>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td class="auto-style5"><%# Container.ItemIndex + 1 %></td>
                <td class="auto-style5"><%# Eval("VenueName") %></td>
                <td class="auto-style5"><%# Eval("Location") %></td>
                <td class="auto-style5"><%# Eval("State") %></td>
                <td class="auto-style5">
                    <asp:Button runat="server" ID="btnModify" Text="Modify" CssClass="edit-button" OnClick="btnModify_Click" CommandArgument='<%# Eval("VenueID") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyEventDB %>" SelectCommand="SELECT * FROM [Venue]"></asp:SqlDataSource>
</asp:Content>
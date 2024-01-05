<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ViewUsers.aspx.cs" Inherits="EventApp.Admin.ViewUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/table.css" />

    <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound" DataSourceID="SqlDataSource1">
        <HeaderTemplate>
            <table id="myTable" class="auto-style4">
                <thead>
                    <h2>View Users</h2>
                    <hr style="margin-top: 10px; margin-bottom: 20px;" />
                    <tr>
                        <th class="auto-style6">#</th>
                        <th class="auto-style6">Name</th>
                        <th class="auto-style6">User Name</th>
                        <th class="auto-style6">Email</th>
                        <th class="auto-style6">Contact Number</th>
                        <th class="auto-style6">Action</th>
                    </tr>
                </thead>
        </HeaderTemplate>
        <ItemTemplate>
    <tr>
        <td class="auto-style5"><%# Container.ItemIndex + 1 %></td>
        <td class="auto-style5"><%# Eval("Name") %></td>
        <td class="auto-style5"><%# Eval("UserName") %></td>
        <td class="auto-style5"><%# Eval("Email") %></td>
        <td class="auto-style5"><%# Eval("ContactNum") %></td>
        <td class="auto-style5">
            <asp:Button runat="server" ID="btnModify" Text="View" CssClass="edit-button" OnClick="btnModify_Click" CommandArgument='<%# Eval("ParticipantID") %>' />
        </td>
    </tr>
</ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyEventDB %>"
        SelectCommand="SELECT * FROM [Participant]">
    </asp:SqlDataSource>
</asp:Content>
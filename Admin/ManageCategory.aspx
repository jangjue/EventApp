<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ManageCategory.aspx.cs" Inherits="EventApp.Admin.ManageCategory" %>

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
        <headertemplate>
            <table id="myTable" class="auto-style4">
                <thead>
                    <h2>Manage Category</h2>
                    <hr style="margin-top: 10px; margin-bottom: 20px;" />
                    <tr>
                        <th class="auto-style6">#</th>
                        <th class="auto-style6">Category Name</th>
                        <th class="auto-style6">Description</th>
                        <th class="auto-style6">Action</th>
                    </tr>
                </thead>
        </headertemplate>
        <itemtemplate>
            <tr>
                <td class="auto-style5"><%# Container.ItemIndex + 1 %></td>
                <td class="auto-style5"><%# Eval("Name") %></td>
                <td class="auto-style5"><%# Eval("Description") %></td>
                <td class="auto-style5">
                    <asp:Button runat="server" ID="btnModify" Text="Modify" CssClass="edit-button" OnClick="btnModify_Click" CommandArgument='<%# Eval("CategoryID") %>' />
                </td>
            </tr>
        </itemtemplate>
        <footertemplate>
            </table>
        </footertemplate>
    </asp:Repeater>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyEventDB %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>

</asp:Content>

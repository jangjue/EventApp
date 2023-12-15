<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ManageCategoryDetails.aspx.cs" Inherits="EventApp.Admin.ManageCategoryDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <link rel="stylesheet" type="text/css" href="../css/AdminCategory.css" />
        <h2 class="form-header">Manage Category</h2>
    <hr class="form-divider" />

    <div class="form-container">
        <form id="categoryForm">
            <div class="form-section">
                <asp:Label runat="server" CssClass="form-label" Text="Current Category Name: Sport"></asp:Label><br />
                <asp:Label runat="server" CssClass="form-label" Text="Current Description"></asp:Label><br /><br /><br />
            </div>

            <div class="form-section">
                <asp:Label runat="server" CssClass="form-label" Text="New Category Name"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-input"></asp:TextBox><br />
                <asp:Label runat="server" CssClass="form-label" Text="New Description"></asp:Label>
                <asp:TextBox runat="server" CssClass="form-input"></asp:TextBox>
            </div>

            <div class="form-section">
                <asp:Button runat="server" Text="Submit" CssClass="form-button" />
            </div>
        </form>
    </div>
</asp:Content>

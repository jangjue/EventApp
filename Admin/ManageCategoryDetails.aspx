<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ManageCategoryDetails.aspx.cs" Inherits="EventApp.Admin.ManageCategoryDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/AdminCategory.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="form-header">Manage Category Details</h2>
    <hr class="form-divider" />

    <div class="form-container">
        <form id="categoryForm">
            <div class="form-section">
                <asp:Label runat="server" ID="lblCurrentCategoryName" CssClass="form-label-current"></asp:Label><br />
                <asp:Label runat="server" ID="lblCurrentDescription" CssClass="form-label-current"></asp:Label><br /><br /><br />
            </div>

            <div class="form-section">
                <asp:Label runat="server" CssClass="form-label" Text="New Category Name : "></asp:Label>
                <asp:TextBox runat="server" ID="txtNewCategoryName" CssClass="form-input"></asp:TextBox><br />
                <asp:Label runat="server" CssClass="form-label" Text="New Description   : "></asp:Label>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <asp:TextBox runat="server" ID="txtNewDescription" CssClass="form-input"></asp:TextBox>
            </div>

            <div class="form-section">
                <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="form-button" OnClick="btnSubmit_Click" />
            </div>
            <asp:Label runat="server" ID="lblMessage"></asp:Label>
        </form>
    </div>
</asp:Content>
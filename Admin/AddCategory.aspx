<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="EventApp.Admin.AddCatagory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/AdminCategory.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2 class="form-header">Add Category</h2>
    <hr class="form-divider" />

    <div class="form-container">
        <form id="categoryForm">
            <div class="form-section">
                <asp:Label runat="server" CssClass="form-label" Text="Category"></asp:Label>
                <br />
                <input id="Text1" type="text" class="form-input" />
            </div>

            <div class="form-section">
                <asp:Label runat="server" CssClass="form-label" Text="Description"></asp:Label>
                <br />
                <asp:TextBox runat="server" CssClass="form-input"></asp:TextBox>
            </div>

            <div class="form-section">
                <asp:Button runat="server" Text="Submit" CssClass="form-button" />
            </div>
        </form>
    </div>

</asp:Content>

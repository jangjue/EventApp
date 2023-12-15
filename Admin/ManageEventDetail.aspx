﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ManageEventDetail.aspx.cs" Inherits="EventApp.Admin.ManageEventDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/AddEvent.css" />
            <h2>Edit Event</h2>
    <hr style="margin-top: 10px; margin-bottom: 20px;" />
    <div class="fieldset-container">
    <fieldset>
        <legend>Edit Event Form</legend>
        <asp:Label runat="server" Text="Category"></asp:Label><br />
        <asp:DropDownList runat="server">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem>Sport</asp:ListItem>
            <asp:ListItem>Political</asp:ListItem>
            <asp:ListItem>Business</asp:ListItem>
        </asp:DropDownList><br />

        <asp:Label runat="server" Text="Name"></asp:Label><br />
        <input id="Text1" type="text" /><br />

        <asp:Label runat="server" Text="Description"></asp:Label><br />
        <input id="Text1" type="text" /><br />

        <asp:CheckBoxList runat="server" RepeatDirection="Horizontal" CssClass="checkbox-list">
            <asp:ListItem>Standard</asp:ListItem>
            <asp:ListItem>Pro</asp:ListItem>
            <asp:ListItem>Premium</asp:ListItem>
        </asp:CheckBoxList>
        <asp:TextBox runat="server"></asp:TextBox>
        <asp:TextBox runat="server"></asp:TextBox>
        <asp:TextBox runat="server"></asp:TextBox>

        <asp:Label runat="server" Text="Start Date"></asp:Label><br />
        <asp:Calendar runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
            <NextPrevStyle VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#808080" />
            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
            <SelectorStyle BackColor="#CCCCCC" />
            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
            <WeekendDayStyle BackColor="#FFFFCC" />
        </asp:Calendar><br />

        <asp:Label runat="server" Text="End Date"></asp:Label><br />
        <asp:Calendar runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
            <NextPrevStyle VerticalAlign="Bottom" />
            <OtherMonthDayStyle ForeColor="#808080" />
            <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
            <SelectorStyle BackColor="#CCCCCC" />
            <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
            <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
            <WeekendDayStyle BackColor="#FFFFCC" />
        </asp:Calendar><br />

        <asp:Label runat="server" Text="Venue"></asp:Label><br />
        <asp:TextBox runat="server"></asp:TextBox><br />

        <asp:Label runat="server" Text="Location"></asp:Label><br />
        <div>
            <iframe src="https://www.google.com/maps/embed?pb=!1m12!1m8!1m3!1d7967.0714855348515!2d101.726904!3d3.215785!3m2!1i1024!2i768!4f13.1!2m1!1starumt!5e0!3m2!1sen!2smy!4v1702574901114!5m2!1sen!2smy" width="600" height="450" style="border: 0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div><br />

        <asp:Label runat="server" Text="Event Featured Image"></asp:Label><br />
        <asp:FileUpload runat="server"></asp:FileUpload><br /><br />
        <asp:Button runat="server" Text="Reset" />
        <asp:Button runat="server" Text="Submit" />
    </fieldset>
        </div>
</asp:Content>
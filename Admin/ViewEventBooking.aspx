<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ViewEventBooking.aspx.cs" Inherits="EventApp.Admin.ViewEventBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style7 {
            height: 44px;
            width: 148px;
        }
        .auto-style8 {
            height: 20px;
            width: 148px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/table.css" />

    <div style="margin-top: 20px; margin-bottom: 20px;">
        <table id="myTable" class="auto-style4">
            <thead>
                <h2>View Booking Details</h2>
                <hr style="margin-top: 10px; margin-bottom: 20px;" />
                <tr>
                    <th class="auto-style6">#</th>
                    <th class="auto-style6">Booking ID</th>
                    <th class="auto-style6">Full Name</th>
                    <th class="auto-style6">Type Of Ticket</th>
                    <th class="auto-style6">Number of Ticket</th>
                    <th class="auto-style6">Booking Date</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td class="auto-style5"><%# Container.ItemIndex + 1 %></td>
                            <td class="auto-style5"><%# Eval("BookingID") %></td>
                            <td class="auto-style5"><%# Eval("ParticipantName") %></td>
                            <td class="auto-style5"><%# Eval("Type") %></td>
                            <td class="auto-style5"><%# Eval("Quantity") %></td>
                            <td class="auto-style5"><%# Eval("BookingDate", "{0:yyyy-MM-dd}") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
</asp:Content>
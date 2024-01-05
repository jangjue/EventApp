<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="MyBooking.aspx.cs" Inherits="EventApp.MyBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="speakers" class="wow fadeInUp">
        <div class="container">
            <div class="section-header">
                <h2>My Booking</h2>
                <p>Here is your booking! Enjoy the event.</p>
            </div>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <HeaderTemplate>
                    <table id="myTable" class="display">
                        <thead>
                            <tr>
                                <td class="auto-style3">
                                    <asp:Label ID="Label1" runat="server" Text="Booking ID"></asp:Label>
                                </td>
                                <td class="auto-style5">
                                    <asp:Label ID="Label3" runat="server" Text="Event Name"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:Label ID="Label4" runat="server" Text="Booking Date"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:Label ID="Label5" runat="server" Text="Quantity"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:Label ID="Label2" runat="server" Text="Total Price"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:Label ID="Label6" runat="server" Text="Type"></asp:Label>
                                </td>
                            </tr>
                        </thead>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="auto-style5"><%# Eval("BookingID") %></td>
                        <td class="auto-style1"><%# Eval("Name") %></td>
                        <td class="auto-style1"><%# Eval("BookingDate", "{0:dd/MM/yyyy}") %></td>
                        <td class="auto-style1"><%# Eval("Quantity") %></td>
                        <td class="auto-style1"><%# Eval("Price") %></td>
                        <td class="auto-style1"><%# Eval("Type") %></td>
                    </tr>
                </ItemTemplate>

                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <div class="section-header" style="margin-top: 20px;">
                <h2>Booking History</h2>
                <p>Here is your booking history!</p>
            </div>
            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                <HeaderTemplate>
                    <table id="myTable1" class="display">
                        <thead>
                            <tr>
                                <td class="auto-style3">
                                    <asp:Label ID="Label1" runat="server" Text="Booking ID"></asp:Label>
                                </td>
                                <td class="auto-style5">
                                    <asp:Label ID="Label3" runat="server" Text="Event Name"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:Label ID="Label4" runat="server" Text="Booking Date"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:Label ID="Label5" runat="server" Text="Quantity"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:Label ID="Label2" runat="server" Text="Total Price"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:Label ID="Label6" runat="server" Text="Type"></asp:Label>
                                </td>
                            </tr>
                        </thead>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="auto-style5"><%# Eval("BookingID") %></td>
                        <td class="auto-style1"><%# Eval("Name") %></td>
                        <td class="auto-style1"><%# Eval("BookingDate", "{0:dd/MM/yyyy}") %></td>
                        <td class="auto-style1"><%# Eval("Quantity") %></td>
                        <td class="auto-style1"><%# Eval("Price") %></td>
                        <td class="auto-style1"><%# Eval("Type") %></td>
                    </tr>
                </ItemTemplate>

                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT Booking.BookingID, Booking.ParticipantID, Booking.EventID, Booking.Price, Booking.Type, Booking.Quantity, Booking.BookingDate, Event.Name FROM Booking INNER JOIN Event ON Booking.EventID = Event.EventID
WHERE (Booking.ParticipantID = @ParticipantID) AND (Booking.BookingDate &lt; Event.EndDate)">
                <SelectParameters>
                    <asp:SessionParameter Name="ParticipantID" SessionField="User" Type="String" DefaultValue="" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT Booking.BookingID, Booking.ParticipantID, Booking.EventID, Booking.Price, Booking.Type, Booking.Quantity, Booking.BookingDate, Event.Name FROM Booking INNER JOIN Event ON Booking.EventID = Event.EventID
WHERE (Booking.ParticipantID = @ParticipantID) AND (Booking.BookingDate &gt; Event.EndDate)">
                <SelectParameters>
                    <asp:SessionParameter Name="ParticipantID" SessionField="User" Type="String" DefaultValue="" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </section>
</asp:Content>


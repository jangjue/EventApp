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
            <table id="myTable" class="display">
                <thead>
                    <tr>
                        <td class="auto-style3">
                            <asp:Label ID="Label1" runat="server" Text="Booking ID"></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <asp:Label ID="Label2" runat="server" Text="Event ID"></asp:Label>
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
                            <asp:Label ID="Label6" runat="server" Text="Type"></asp:Label>
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="auto-style3">B0001</td>
                        <td class="auto-style1">E0001</td>
                        <td class="auto-style5">Drama</td>
                        <td class="auto-style1">02/12/2023</td>
                        <td class="auto-style1">1</td>
                        <td class="auto-style1">normal</td>
                    </tr>
                    <tr>
                        <td class="auto-style2">B0002</td>
                        <td>E0002</td>
                        <td class="auto-style4">Singing Competition</td>
                        <td>05/12/2023</td>
                        <td>2</td>
                        <td>pro</td>
                    </tr>
                </tbody>
            </table>
        </div>

    </section>
</asp:Content>


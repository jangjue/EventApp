<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="Event.aspx.cs" Inherits="EventApp.Event" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
    <main id="main">
        <section id="speakers" class="wow fadeInUp">
            <div class="container">
                <div class="section-header">
                    <h2>Our Event </h2>
                    <p>Here are the event during the period!</p>
                </div>

                <table id="myTable" class="display">
                    <thead>
                        <tr>
                            <td class="col-lg-4 col-md-6">
                                <asp:Label ID="Label1" runat="server" Text="Poster"></asp:Label>
                            </td>
                            <td class="auto-style5">
                                <asp:Label ID="Label3" runat="server" Text="Event Name"></asp:Label>
                            </td>
                            <td class="auto-style1">
                                <asp:Label ID="Label4" runat="server" Text="Start Date"></asp:Label>
                            </td>
                            <td class="auto-style1">
                                <asp:Label ID="Label5" runat="server" Text="End Date"></asp:Label>
                            </td>
                            <td class="auto-style1">
                                <asp:Label ID="Label6" runat="server" Text="Categories"></asp:Label>
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="auto-style3">
                                <div>
                                    <a href="event-details.aspx">
                                        <img class="photo" src="img/event/event1.jpg" alt="Event 1" class="img-fluid" />
                                    </a>
                                </div>
                            </td>
                            <td class="auto-style5">Star Night</td>
                            <td class="auto-style1">02/12/2023</td>
                            <td class="auto-style1">20/12/2023</td>
                            <td class="auto-style1">Drama</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <div>
                                    <a href="event-details.aspx">
                                        <img class="photo" src="img/event/event4.jpg" alt="Event 1" class="img-fluid" /></a>
                                </div>
                            </td>
                            <td class="auto-style4">Validity Carnival</td>
                            <td>05/12/2023</td>
                            <td>15/12/2023</td>
                            <td>Singing Competition</td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </section>
    </main>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="event-details.aspx.cs" Inherits="EventApp.event_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        header {
            background-color: black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main id="main" style="padding-top: 50px">
        <!--==========================
          Event Details Section
        ============================-->
        <section id="events-details" class="wow fadeIn">
            <div class="container">
                <div class="section-header">
                    <h2>Event Details</h2>
                    <p>The Information of the price, venue, and date.</p>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <asp:Image ID="EventImage" runat="server" CssClass="img-fluid" />
                    </div>
                    <div class="col-md-6">
                        <div class="details">
                            <asp:Label ID="lblEventName" runat="server" Text="Event Name" CssClass="title"></asp:Label>
                            <div class="social">
                                <a href=""><i class="fa fa-twitter"></i></a>
                                <a href=""><i class="fa fa-facebook"></i></a>
                            </div>
                            <p>
                                <asp:Label ID="lblDscr" runat="server"></asp:Label>
                            </p>

                            <h2>Available Ticket :</h2>
                            <asp:Label ID="lblAvaiable" runat="server" Text=""></asp:Label>

                            <h2>Sold Out Ticket :</h2>
                            <asp:Label ID="lblSoldOut" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="buy-tickets" class="section-with-bg wow fadeInUp">
            <div class="container">
                <div class="section-header">
                    <h2>Buy Tickets</h2>
                    <p></p>
                </div>

                <div class="row justify-content-center">
                    <asp:Repeater ID="rptTickets" runat="server" OnItemCommand="rptTickets_ItemCommand">
                        <ItemTemplate>
                            <div class="col-md-6 col-lg-4 mb-5">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title text-muted text-uppercase text-center"><%# Eval("TicketType") %></h5>
                                        <h6 class="card-price text-center"><%# Eval("TicketPrice") %></h6>
                                        <hr />
                                        <ul class="fa-ul">
                                            <li><span class="fa-li"><i class="fa fa-check"></i></span><%# Eval("TypeDescription") %></li>
                                            <li><span class="fa-li"><i class="fa fa-check"></i></span>Capacity: <%# Eval("TicketCapacity") %></li>
                                        </ul>
                                        <hr />
                                        <div class="text-center">
                                            <asp:Button ID="btnBuy" runat="server" CssClass="btn" Text="Buy Now" CommandArgument='<%# Eval("TicketType") %>' CommandName="BuyTicket" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </section>
    </main>
</asp:Content>

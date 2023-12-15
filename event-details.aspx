<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="event-details.aspx.cs" Inherits="EventApp.event_details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--==========================
          Event Details Section
        ============================-->
    <section id="events-details" class="wow fadeIn">
        <div class="container">
            <div class="section-header">
                <h2>Speaker Details</h2>
                <p>Praesentium ut qui possimus sapiente nulla.</p>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <img src="img/event/event1.jpg" alt="Speaker 1" class="img-fluid">
                </div>

                <div class="col-md-6">
                    <div class="details">
                        <h2>Brenden Legros</h2>
                        <div class="social">
                            <a href=""><i class="fa fa-twitter"></i></a>
                            <a href=""><i class="fa fa-facebook"></i></a>
                        </div>
                        <p>Voluptatem perferendis sed assumenda voluptatibus. Laudantium molestiae sint. Doloremque odio dolore dolore sit. Quae labore alias ea omnis ex expedita sapiente molestias atque. Optio voluptas et.</p>

                        <p>Aboriosam inventore dolorem inventore nam est esse. Aperiam voluptatem nisi molestias laborum ut. Porro dignissimos eum. Tempore dolores minus unde est voluptatum incidunt ut aperiam.</p>

                        <p>Et dolore blanditiis officiis non quod id possimus. Optio non commodi alias sint culpa sapiente nihil ipsa magnam. Qui eum alias provident omnis incidunt aut. Eius et officia corrupti omnis error vel quia omnis velit. In qui debitis autem aperiam voluptates unde sunt et facilis.</p>
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

            <div class="row">
                <div class="col-lg-4">
                    <div class="card mb-5 mb-lg-0">
                        <div class="card-body">
                            <h5 class="card-title text-muted text-uppercase text-center">Standard Access</h5>
                            <h6 class="card-price text-center">$150</h6>
                            <hr>
                            <ul class="fa-ul">
                                <li><span class="fa-li"><i class="fa fa-check"></i></span>Regular Seating</li>
                                <li><span class="fa-li"><i class="fa fa-check"></i></span>Coffee Break</li>
                                <li><span class="fa-li"><i class="fa fa-check"></i></span>Custom Badge</li>
                                <li class="text-muted"><span class="fa-li"><i class="fa fa-times"></i></span>Community Access</li>
                                <li class="text-muted"><span class="fa-li"><i class="fa fa-times"></i></span>Workshop Access</li>
                                <li class="text-muted"><span class="fa-li"><i class="fa fa-times"></i></span>After Party</li>
                            </ul>
                            <hr>
                            <div class="text-center">
                                <asp:Button ID="Button1" runat="server" class="btn" data-toggle="modal" data-target="#buy-ticket-modal" data-ticket-type="standard-access" Text="Buy Now" PostBackUrl="~/Payment.aspx" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="card mb-5 mb-lg-0">
                        <div class="card-body">
                            <h5 class="card-title text-muted text-uppercase text-center">Pro Access</h5>
                            <h6 class="card-price text-center">$250</h6>
                            <hr>
                            <ul class="fa-ul">
                                <li><span class="fa-li"><i class="fa fa-check"></i></span>Regular Seating</li>
                                <li><span class="fa-li"><i class="fa fa-check"></i></span>Coffee Break</li>
                                <li><span class="fa-li"><i class="fa fa-check"></i></span>Custom Badge</li>
                                <li><span class="fa-li"><i class="fa fa-check"></i></span>Community Access</li>
                                <li class="text-muted"><span class="fa-li"><i class="fa fa-times"></i></span>Workshop Access</li>
                                <li class="text-muted"><span class="fa-li"><i class="fa fa-times"></i></span>After Party</li>
                            </ul>
                            <hr>
                            <div class="text-center">
                                <asp:Button ID="Button2" runat="server" class="btn" data-toggle="modal" data-target="#buy-ticket-modal" data-ticket-type="pro-access" Text="Buy Now" PostBackUrl="~/Payment.aspx" />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Pro Tier -->
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title text-muted text-uppercase text-center">Premium Access</h5>
                            <h6 class="card-price text-center">$350</h6>
                            <hr>
                            <ul class="fa-ul">
                                <li><span class="fa-li"><i class="fa fa-check"></i></span>Regular Seating</li>
                                <li><span class="fa-li"><i class="fa fa-check"></i></span>Coffee Break</li>
                                <li><span class="fa-li"><i class="fa fa-check"></i></span>Custom Badge</li>
                                <li><span class="fa-li"><i class="fa fa-check"></i></span>Community Access</li>
                                <li><span class="fa-li"><i class="fa fa-check"></i></span>Workshop Access</li>
                                <li><span class="fa-li"><i class="fa fa-check"></i></span>After Party</li>
                            </ul>
                            <hr>
                            <div class="text-center">
                                <asp:Button ID="Button3" runat="server" class="btn" data-ticket-type="premium-access" Text="Buy Now" PostBackUrl="~/Payment.aspx" />
                            </div>


                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>

</asp:Content>

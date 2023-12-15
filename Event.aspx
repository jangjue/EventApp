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

                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="speaker">
                            <img src="img/event/event1.jpg" alt="Event 1" class="img-fluid"/>
                            <div class="details">
                                <h3><a href="event-details.aspx">Brenden Legros</a></h3>
                                <p>Quas alias incidunt</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="speaker">
                            <img src="img/event/event2.jpg" alt="Event 2" class="img-fluid"/>
                            <div class="details">
                                <h3><a href="event-details.html">Hubert Hirthe</a></h3>
                                <p>Consequuntur odio aut</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="speaker">
                            <img src="img/event/event3.jpg" alt="Event 3" class="img-fluid"/>
                            <div class="details">
                                <h3><a href="event-details.html">Cole Emmerich</a></h3>
                                <p>Fugiat laborum et</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="speaker">
                            <img src="img/event/event6.jpg" alt="Event 4" class="img-fluid"/>
                            <div class="details">
                                <h3><a href="event-details.html">Jack Christiansen</a></h3>
                                <p>Debitis iure vero</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="speaker">
                           <img src="img/event/event5.jpg" alt="Event 5" class="img-fluid"/>
                            <div class="details">
                                <h3><a href="event-details.html">Alejandrin Littel</a></h3>
                                <p>Qui molestiae natus</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="speaker">
                           <img src="img/event/event8.jpg" alt="Event 6" class="img-fluid"/>
                            <div class="details">
                                <h3><a href="event-details.html">Willow Trantow</a></h3>
                                <p>Non autem dicta</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </main>
</asp:Content>

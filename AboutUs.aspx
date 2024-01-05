<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="EventApp.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 569px;
        height: 409px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <section id="intro">
    <div class="intro-container wow fadeIn">
        <h1 class="mb-4 pb-0">Event<br>
            <span>Management</span> System</h1>
        <p class="mb-4 pb-0">We Turn Ideas Into Action. More Than Just Event Planning.</p>
        <p class="mb-4 pb-0">An event management system built for growth</p>
        <a href="https://www.youtube.com/watch?v=Z9Zc5mcymf4" class="venobox play-btn mb-4" data-vbtype="video"
            data-autoplay="true"></a>
        <a href="Event.aspx" class="about-btn scrollto">About The Event</a>
    </div>
</section>
    <section id="about">
        <div class="container">
            <div class="row"  style="margin-bottom: 50px;">
                <div class="col-lg-6" >
                    <h2>   About The Event Manegement System   </h2>
                    <p>
                        An event tech platform for face-to-face, online, and hybrid experiences
                        Are you using manual processes to plan and execute great events? Ditch the time-consuming work.
                        With EMS, you’ll have the power to automate tasks and simplify the entire 
                        planning process so you can focus on what matters most—your attendees. 
                    </p>
                </div>
                <div>
                    <img src="img/home-bg1.png" alt="EMS" class="auto-style1">
                </div>
            </div>
            <div class="row">
                <div>
                    <img src="img/home-bg2.png" alt="EMS" class="auto-style1">
                </div>
                <div class="col-lg-5" style="margin-left: 30px;">
                    <h2>      Why using Event Manegement System    </h2>
                    <p>
                        On college and university campuses, events are happening all the time, whether student- or faculty-focused, 
                        and often through in-house or third parties and vendors. When these events take place, it is critical to use an 
                        event management system that offers full control and planning capabilities to ensure activities happen on time,
                        in accommodating spaces and keeping in mind the safety of every attending. Comprehensive event planning software 
                        will allow campus event planners to book large-scale events, communicate with service providers, and maintain 
                        a single source of record for repeatable, measurable events.
                    </p>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="EventApp.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
    header {
        background-color: black;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main id="main" style="padding-top: 50px">
    <section id="speakers" class="wow fadeInUp">
        <div class="container">
            <div class="section-header">
                <h2>Our Event </h2>
                <p>Here are the event during the period!</p>
            </div>

            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                <HeaderTemplate>
                    <table id="myTable" class="display">
                        <thead>
                            <tr>
                                <td class="col-lg-4 col-md-6">
                                    <asp:Label ID="Label1" runat="server" Text="Poster"></asp:Label>
                                </td>
                                <td class="auto-style5">
                                    <asp:Label ID="Label2" runat="server" Text="Event Name"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:Label ID="Label3" runat="server" Text="Start Date"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:Label ID="Label4" runat="server" Text="End Date"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:Label ID="Label5" runat="server" Text="State"></asp:Label>
                                </td>
                                <td class="auto-style1">
                                    <asp:Label ID="Label6" runat="server" Text="Category"></asp:Label>
                                </td>
                            </tr>
                        </thead>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td class="auto-style3">
                            <div>
                                <a href='<%# Eval("EventID", "event-details.aspx?EventID={0}") %>'>
                                    <img class="photo" src='<%# "ImageHandler.ashx?EventID=" + Eval("EventID") %>' class="img-fluid" />
                                </a>
                            </div>
                        </td>
                        <td class="auto-style5"><%# Eval("Name") %></td>
                        <td class="auto-style1"><%# Eval("StartDate", "{0:MM/dd/yyyy}") %></td>
                        <td class="auto-style1"><%# Eval("EndDate", "{0:MM/dd/yyyy}") %></td>
                        <td class="auto-style1"><%# Eval("State") %></td>
                        <td class="auto-style1"><%# Eval("CategoryName") %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT EventID, Name, StartDate, EndDate, Image, State, CategoryName
FROM (
    SELECT 
        Event.EventID, 
        Event.Name, 
        Event.StartDate, 
        Event.EndDate, 
        Event.Image, 
        Venue.State, 
        Category.name AS CategoryName,
        CAST(Event.EndDate AS DATE) AS EndDateOnly
    FROM Event
    INNER JOIN Category ON Event.CategoryID = Category.CategoryID
    INNER JOIN Venue ON Event.VenueID = Venue.VenueID
) AS Events
WHERE EndDateOnly >= CAST(GETDATE() AS DATE);"></asp:SqlDataSource>
        </section>
    </main>
</asp:Content>

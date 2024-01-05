<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ManageEvent.aspx.cs" Inherits="EventApp.Admin.ManageEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/table.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <HeaderTemplate>
            <h2>Manage Event</h2>
            <hr style="margin-top: 10px; margin-bottom: 20px;" />
            <table id="myTable" class="auto-style4">
                <thead>
                    <tr>
                        <th class="auto-style6">#</th>
                        <th class="auto-style6">Event Name</th>
                        <th class="auto-style6">Venue Name</th>
                        <th class="auto-style6">Category</th>
                        <th class="auto-style6">Duration</th>
                        <th class="auto-style6">Ticket Type</th>
                        <th class="auto-style6">Capacity</th>
                        <th class="auto-style6">Price (RM)</th>
                        <th class="auto-style6">Action</th>
                    </tr>
                </thead>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td class="auto-style5"><%# Container.ItemIndex + 1 %></td>
                <td class="auto-style5"><%# Eval("EventName") %></td>
                <td class="auto-style5"><%# Eval("VenueName") %></td>
                <td class="auto-style5"><%# Eval("CategoryName") %></td>
                <td class="auto-style5"><%# $"{Eval("StartDate"):MM/dd/yyyy} - {Eval("EndDate"):MM/dd/yyyy}" %></td>
                <td class="auto-style5">
                    <%# Eval("TicketTypes").ToString().Replace(",", "<br />") %>
                </td>
                <td class="auto-style5">
                    <%# GetFormattedCapacity(Eval("TicketCapacities")) %>
                </td>
                <td class="auto-style5">
                    <%# GetFormattedPrice(Eval("TicketPrice")) %>
                </td>
                <td class="auto-style5">
                    <asp:Button runat="server" ID="btnModify" Text="Modify" CssClass="edit-button" OnClick="btnModify_Click" CommandArgument='<%# Eval("EventID") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyEventDB %>"
        SelectCommand="SELECT Event.EventID, Event.Name AS EventName, Venue.VenueName, Category.name AS CategoryName, Event.StartDate, Event.EndDate, Event.TicketCapacities, Event.TicketTypes, Event.TicketPrice
                       FROM Event 
                       INNER JOIN Venue ON Event.VenueID = Venue.VenueID
                       INNER JOIN Category ON Event.CategoryID = Category.CategoryID">
    </asp:SqlDataSource>
</asp:Content>

<script runat="server">
    protected string GetFormattedCapacity(object capacity)
    {
        string[] capacities = capacity?.ToString().Split(',');
        List<string> formattedCapacities = new List<string>();

        foreach (string cap in capacities)
        {
            if (!string.IsNullOrWhiteSpace(cap) && cap != "0")
            {
                formattedCapacities.Add(cap);
            }
        }

        return string.Join("<br />", formattedCapacities);
    }

    protected string GetFormattedPrice(object price)
    {
        string[] prices = price?.ToString().Split('*');
        List<string> formattedPrices = new List<string>();

        foreach (string p in prices)
        {
            if (!string.IsNullOrWhiteSpace(p) && p != "00.00")
            {
                formattedPrices.Add($"{p}");
            }
        }

        return string.Join("<br />", formattedPrices);
    }
</script>
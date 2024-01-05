<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="EventApp.Admin.Booking1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style7 {
            width: 659px;
            height: 214px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/table.css" />

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="Repeater1_ItemDataBound">
        <headertemplate>
            <table id="myTable" class="auto-style4">
                <thead>
                    <h2>View Booking</h2>
                    <hr style="margin-top: 10px; margin-bottom: 20px;" />
                    <tr>
                        <th class="auto-style6">#</th>
                        <th class="auto-style6">Event ID</th>
                        <th class="auto-style6">Event Name</th>
                        <th class="auto-style6">Ticket Types</th>
                        <th class="auto-style6">Available Ticket</th>
                        <th class="auto-style6">Event Duration</th>
                        <th class="auto-style6">Action</th>
                    </tr>
                </thead>
        </headertemplate>
        <itemtemplate>
            <tr>
                <td class="auto-style5"><%# Container.ItemIndex + 1 %></td>
                <td class="auto-style5"><%# Eval("EventID") %></td>
                <td class="auto-style5"><%# Eval("Name") %></td>
                <td class="auto-style5">
                    <%# Eval("TicketTypes").ToString().Replace(",", "<br />") %>
                </td>
                <td class="auto-style5">
                    <%# GetFormattedCapacity(Eval("TicketCapacities")) %>
                </td>
                <td class="auto-style5">
                    <%-- Assuming StartDate and EndDate are DateTime fields --%>
                    <%# ((DateTime)Eval("StartDate")).ToString("MM/dd/yyyy") + " - " + ((DateTime)Eval("EndDate")).ToString("MM/dd/yyyy") %>
                </td>
                <td class="auto-style5">
                    <asp:Button runat="server" ID="btnModify" Text="View" CssClass="edit-button" OnClick="btnModify_Click" CommandArgument='<%# Eval("EventID") %>' />
                </td>
            </tr>
        </itemtemplate>
        <footertemplate>
            </table>
        </footertemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyEventDB %>" SelectCommand="SELECT [EventID], [Name], [StartDate], [EndDate], [TicketCapacities], [TicketTypes] FROM [Event]"></asp:SqlDataSource>

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
    </script>
</asp:Content>

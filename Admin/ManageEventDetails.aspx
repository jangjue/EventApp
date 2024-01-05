<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ManageEventDetails.aspx.cs" Inherits="EventApp.Admin.ManageEventDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <link rel="stylesheet" type="text/css" href="../css/AddEvent.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Manage Event Details</h2>
    <asp:Label runat="server" ID="lblMessage" ForeColor="Red"></asp:Label>
    
    <hr style="margin-top: 10px; margin-bottom: 20px;" />

    <div class="fieldset-container">
    <fieldset>
        <legend>Edit Event Form</legend>
        <asp:Label runat="server" Text="" ID="Label1"></asp:Label><br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyEventDB %>" SelectCommand="SELECT [name] FROM [Category]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyEventDB %>" SelectCommand="SELECT [VenueName] FROM [Venue]"></asp:SqlDataSource>
        <asp:Label runat="server" Text="Category"></asp:Label>
        <br />
        <asp:DropDownList runat="server" AppendDataBoundItems="True" DataTextField="name" DataValueField="name" DataSourceID="SqlDataSource1" ID="ddlCategory">
            <asp:ListItem Text="-- Select New Category --" Value="" />
        </asp:DropDownList><br />
        <asp:Label runat="server" Text="Venue"></asp:Label>
        <br />
        <asp:DropDownList runat="server" AppendDataBoundItems="True" DataTextField="VenueName" DataValueField="VenueName" DataSourceID="SqlDataSource2" ID="ddlVenue">
            <asp:ListItem Text="-- Select New Venue --" Value="" />
        </asp:DropDownList>
        <br />

        <asp:Label runat="server" Text="Name"></asp:Label>
        <br />
        <asp:TextBox runat="server" placeholder="Enter new event name" id="txtName"></asp:TextBox>
        <asp:Label runat="server" Text="Description"></asp:Label>
        <br />
        <asp:TextBox runat="server" placeholder="Enter new event description" id="txtEventDescription"></asp:TextBox>

        <asp:Label runat="server" Text="Ticket Type"></asp:Label>
        <asp:CheckBoxList ID="chkTicketLevels" runat="server" RepeatDirection="Horizontal" CssClass="checkbox-list">
            <asp:ListItem Value="Standard">Standard</asp:ListItem>
            <asp:ListItem Value="Pro">Pro</asp:ListItem>
            <asp:ListItem Value="Premium">Premium</asp:ListItem>
        </asp:CheckBoxList>
        <br />

        <div id="standardDescription">
            <asp:TextBox ID="txtStandardDescription" runat="server" placeholder="Standard Ticket Description"></asp:TextBox>
            <asp:Label runat="server" Text="Total Standard Ticket :   "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="number" id="txtStandardCapacity" runat="server" placeholder="(e.g 100)" /><br />
            <asp:Label runat="server" Text="Standard Ticket Price : RM"></asp:Label>
            <input type="number" id="txtStandardPrice" runat="server" placeholder="0.00" pattern="^\d+(\.\d{2})?$" title="Enter a non-negative number with up to two decimal places" /><br />
        </div>
        <br />

        <div id="proDescription">
            <asp:TextBox ID="txtProDescription" runat="server" placeholder="Pro Ticket Description"></asp:TextBox>
            <asp:Label runat="server" Text="Total Pro Ticket :   "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="number" id="txtProCapacity" runat="server" placeholder="(e.g 100)" /><br />
            <asp:Label runat="server" Text="Pro Ticket Price : RM"></asp:Label>
            <input type="number" id="txtProPrice" runat="server" placeholder="0.00" pattern="^\d+(\.\d{2})?$" title="Enter a non-negative number with up to two decimal places" /><br />
        </div>
        <br />

        <div id="premiumDescription">
            <asp:TextBox ID="txtPremiumDescription" runat="server" placeholder="Premium Ticket Description"></asp:TextBox>
            <asp:Label runat="server" Text="Total Premium Ticket :   "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="number" id="txtPremiumCapacity" runat="server" placeholder="(e.g 100)" /><br />
            <asp:Label runat="server" Text="Premium Ticket Price : RM"></asp:Label>
            <input type="number" id="txtPremiumPrice" runat="server" placeholder="0.00" pattern="^\d+(\.\d{2})?$" title="Enter a non-negative number with up to two decimal places" /><br />
        </div>
        <br />

        <asp:Label runat="server" Text="Start Date"></asp:Label>
        <br />
        <asp:Calendar ID="calStartDate" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest"
            Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" Width="400px"
            NextPrevFormat="FullMonth" TitleFormat="Month">
            <dayheaderstyle backcolor="#CCCCCC" font-bold="True" font-size="7pt" forecolor="#333333" height="10pt" />
            <daystyle width="14%" />
            <nextprevstyle font-size="8pt" forecolor="White" />
            <othermonthdaystyle forecolor="#999999" />
            <selecteddaystyle backcolor="#CC3333" forecolor="White" />
            <selectorstyle backcolor="#CCCCCC" font-bold="True" font-names="Verdana" font-size="8pt" forecolor="#333333" width="1%" />
            <titlestyle backcolor="Black" font-bold="True" font-size="13pt" forecolor="White" height="14pt" />
            <todaydaystyle backcolor="#CCCC99" />
        </asp:Calendar>
        <asp:Label ID="lblStartDateError" runat="server" ForeColor="Red" Visible="false"></asp:Label>
        <br />
        <br />

        <asp:Label runat="server" Text="End Date"></asp:Label>
        <br />
        <asp:Calendar ID="calEndDate" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest"
            Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" Width="400px"
             NextPrevFormat="FullMonth" TitleFormat="Month">
            <dayheaderstyle backcolor="#CCCCCC" font-bold="True" font-size="7pt" forecolor="#333333" height="10pt" />
            <daystyle width="14%" />
            <nextprevstyle font-size="8pt" forecolor="White" />
            <othermonthdaystyle forecolor="#999999" />
            <selecteddaystyle backcolor="#CC3333" forecolor="White" />
            <selectorstyle backcolor="#CCCCCC" font-bold="True" font-names="Verdana" font-size="8pt" forecolor="#333333" width="1%" />
            <titlestyle backcolor="Black" font-bold="True" font-size="13pt" forecolor="White" height="14pt" />
            <todaydaystyle backcolor="#CCCC99" />
        </asp:Calendar>
        <asp:Label ID="lblEndDateError" runat="server" ForeColor="Red" Visible="false"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblEventDuration" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Label runat="server" Text="Event Featured Image"></asp:Label>
        <br />
        <asp:FileUpload runat="server" ID="fileEventImage"></asp:FileUpload>
        <br />
        <br />
        <asp:Button runat="server" Text="Reset" />
        <asp:Button runat="server" Text="Submit" OnClick="btnSubmit_Click" />
    </fieldset>
</div>

        <script type="text/javascript">

        </script>
</asp:Content>
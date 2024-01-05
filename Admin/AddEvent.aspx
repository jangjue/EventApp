
<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddEvent.aspx.cs" Inherits="EventApp.Admin.AddEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/AddEvent.css" />
    <h2>Add Event</h2>
    <hr style="margin-top: 10px; margin-bottom: 20px;" />
    <div class="fieldset-container">
        <fieldset>
            <legend>Add Event Form</legend>
            <asp:Label runat="server" Text="" ID="lblMessage"></asp:Label><br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyEventDB %>" SelectCommand="SELECT [name] FROM [Category]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MyEventDB %>" SelectCommand="SELECT [VenueName] FROM [Venue]"></asp:SqlDataSource>
            <asp:Label runat="server" Text="Category"></asp:Label>
            <br />
            <asp:DropDownList runat="server" AppendDataBoundItems="True" DataTextField="name" DataValueField="name" DataSourceID="SqlDataSource1" ID="ddlCategory">
                <asp:ListItem Text="-- Select Category --" Value="" />
            </asp:DropDownList><br />
            <asp:Label runat="server" Text="Venue"></asp:Label>
            <br />
            <asp:DropDownList runat="server" AppendDataBoundItems="True" DataTextField="VenueName" DataValueField="VenueName" DataSourceID="SqlDataSource2" ID="ddlVenue">
                <asp:ListItem Text="-- Select Venue --" Value="" />
            </asp:DropDownList>
            <br />

            <asp:Label runat="server" Text="Name"></asp:Label>
            <br />
            <asp:TextBox runat="server" placeholder="Enter event name" id="txtName"></asp:TextBox>
            <asp:Label runat="server" Text="Description"></asp:Label>
            <br />
            <asp:TextBox runat="server" placeholder="Enter event description" id="txtEventDescription"></asp:TextBox>

            <asp:Label runat="server" Text="Ticket Type"></asp:Label>
            <asp:CheckBoxList ID="chkTicketLevels" runat="server" RepeatDirection="Horizontal" CssClass="checkbox-list">
                <asp:ListItem Value="Standard">Standard</asp:ListItem>
                <asp:ListItem Value="Pro">Pro</asp:ListItem>
                <asp:ListItem Value="Premium">Premium</asp:ListItem>
            </asp:CheckBoxList>
            <br />

            <div id="standardDescription" style="display: none;">
                <asp:TextBox ID="txtStandardDescription" runat="server" placeholder="Standard Ticket Description"></asp:TextBox>
                <asp:Label runat="server" Text="Total Standard Ticket :   "></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="number" id="txtStandardCapacity" runat="server" placeholder="(e.g 100)" min="1" /><br />
                <asp:Label runat="server" Text="Standard Ticket Price : RM"></asp:Label>
                <input type="number" id="txtStandardPrice" runat="server" placeholder="0.00" pattern="^\d+(\.\d{2})?$" title="Enter a non-negative number with up to two decimal places" /><br />
            </div>
            <br />

            <div id="proDescription" style="display: none;">
                <asp:TextBox ID="txtProDescription" runat="server" placeholder="Pro Ticket Description"></asp:TextBox>
                <asp:Label runat="server" Text="Total Pro Ticket :   "></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="number" id="txtProCapacity" runat="server" placeholder="(e.g 100)" min="1" /><br />
                <asp:Label runat="server" Text="Pro Ticket Price : RM"></asp:Label>
                <input type="number" id="txtProPrice" runat="server" placeholder="0.00" pattern="^\d+(\.\d{2})?$" title="Enter a non-negative number with up to two decimal places" /><br />
            </div>
            <br />

            <div id="premiumDescription" style="display: none;">
                <asp:TextBox ID="txtPremiumDescription" runat="server" placeholder="Premium Ticket Description"></asp:TextBox>
                <asp:Label runat="server" Text="Total Premium Ticket :   "></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="number" id="txtPremiumCapacity" runat="server" placeholder="(e.g 100)" min="1" /><br />
                <asp:Label runat="server" Text="Premium Ticket Price : RM"></asp:Label>
                <input type="number" id="txtPremiumPrice" runat="server" placeholder="0.00" pattern="^\d+(\.\d{2})?$" title="Enter a non-negative number with up to two decimal places" /><br />
            </div>
            <br />

            <asp:Label runat="server" Text="Start Date"></asp:Label>
            <br />
            <asp:Calendar ID="calStartDate" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest"
                Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" Width="400px"
                OnSelectionChanged="calStartDate_SelectionChanged" NextPrevFormat="FullMonth" TitleFormat="Month">
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
                OnSelectionChanged="calEndDate_SelectionChanged" NextPrevFormat="FullMonth" TitleFormat="Month">
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
        // Function to show/hide textboxes based on checkbox selection
        function toggleTextBoxes() {
            var standardDescription = document.getElementById('standardDescription');
            var proDescription = document.getElementById('proDescription');
            var premiumDescription = document.getElementById('premiumDescription');

            // Reset visibility
            standardDescription.style.display = 'none';
            proDescription.style.display = 'none';
            premiumDescription.style.display = 'none';

            // Check which checkboxes are selected
            var checkboxes = document.querySelectorAll('[id*=chkTicketLevels] input[type=checkbox]');
            checkboxes.forEach(function (checkbox) {
                if (checkbox.checked) {
                    var level = checkbox.value.toLowerCase();
                    if (level === 'standard') {
                        standardDescription.style.display = 'block';
                    } else if (level === 'pro') {
                        proDescription.style.display = 'block';
                    } else if (level === 'premium') {
                        premiumDescription.style.display = 'block';
                    }
                }
            });
        }

        // Attach the function to the checkbox click event
        var checkboxes = document.querySelectorAll('[id*=chkTicketLevels] input[type=checkbox]');
        checkboxes.forEach(function (checkbox) {
            checkbox.addEventListener('click', toggleTextBoxes);
        });

    </script>
    
</asp:Content>


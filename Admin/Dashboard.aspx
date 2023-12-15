<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="EventApp.Admin.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/AdminDashboard.css" />

<table class="graph">
	<caption>Event Category Join Rate</caption>
	<thead>
		<tr>
			<th scope="col">Item</th>
			<th scope="col">Percent</th>
		</tr>
	</thead><tbody>
		<tr style="height:85%">
			<th scope="row">Sport</th>
			<td><span>85%</span></td>
		</tr>
		<tr style="height:23%">
			<th scope="row">Conferences</th>
			<td><span>23%</span></td>
		</tr>
		<tr style="height:7%">
			<th scope="row">Trade shows</th>
			<td><span>7%</span></td>
		</tr>
		<tr style="height:38%">
			<th scope="row">Networking events</th>
			<td><span>38%</span></td>
		</tr>
		<tr style="height:35%">
			<th scope="row">Workshops</th>
			<td><span>35%</span></td>
		</tr>
		<tr style="height:30%">
			<th scope="row">Team building events</th>
			<td><span>30%</span></td>
		</tr>
		<tr style="height:5%">
			<th scope="row">Product launch events</th>
			<td><span>5%</span></td>
		</tr>
		<tr style="height:20%">
			<th scope="row">Charity events</th>
			<td><span>20%</span></td>
		</tr>
	</tbody>
</table>

<div id="piechart"></div>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);

        // Draw the chart and set the chart values
        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Sport', 'Hours per Day'],
                ['Conferences', 8],
                ['Trade Shows', 2],
                ['Networking Events', 4],
                ['Workshops', 2],
                ['Team Building Events', 8]
            ]);

            var options = { 'title': 'Event Category Organize Percentage', 'width': 800, 'height': 800 };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));
            chart.draw(data, options);
        }
    </script>
</asp:Content>
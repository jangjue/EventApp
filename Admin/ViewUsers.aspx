<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ViewUsers.aspx.cs" Inherits="EventApp.Admin.ManageUser" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/table.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 20px; margin-bottom: 20px;">
        <table id="myTable" class="auto-style4">
            <thead>
                <h2>Manage Users</h2>
                <hr style="margin-top: 10px; margin-bottom: 20px;" />
                <tr>
                    <th>#</th>
                    <th>Full Name</th>
                    <th>Username</th>
                    <th>Current Booking</th>
                    <th>Event History</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="auto-style5">1</td>
                    <td class="auto-style5">Lau Hui Liang</td>
                    <td class="auto-style5">Rather</td>
                    <td class="auto-style5">Basketball Competition</td>
                    <td class="auto-style5">-Invest Sharing<br />
                        -Political Speech</td>
                </tr>
                <tr>
                    <td class="auto-style5">2</td>
                    <td class="auto-style5">Soh Yik Ming</td>
                    <td class="auto-style5">Superman</td>
                    <td class="auto-style5">Basketball Competition</td>
                    <td class="auto-style5">-Invest Sharing<br />
                        -Political Speech</td>
                </tr>
                <tr>
                    <td class="auto-style5">3</td>
                    <td class="auto-style5">Yee Jang Jue</td>
                    <td class="auto-style5">fishing123</td>
                    <td class="auto-style5">Basketball Competition</td>
                    <td class="auto-style5">-Invest Sharing<br />
                        -Political Speech</td>
                </tr>
                <tr>
                    <td class="auto-style5">4</td>
                    <td class="auto-style5">Ng Ding Lun</td>
                    <td class="auto-style5">Holyshit</td>
                    <td class="auto-style5">Basketball Competition</td>
                    <td class="auto-style5">-Invest Sharing<br />
                        -Political Speech</td>
                </tr>
                <tr>
                    <td class="auto-style5">5</td>
                    <td class="auto-style5">Hew Kian Feng</td>
                    <td class="auto-style5">RichGuy</td>
                    <td class="auto-style5">Basketball Competition</td>
                    <td class="auto-style5">-Invest Sharing<br />
                        -Political Speech</td>
                </tr>
                <tr>
                    <td class="auto-style5">5</td>
                    <td class="auto-style5">Siew Jun Qiang</td>
                    <td class="auto-style5">dragoncity</td>
                    <td class="auto-style5">Basketball Competition</td>
                    <td class="auto-style5">-Invest Sharing<br />
                        -Political Speech</td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
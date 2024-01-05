<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="ManageVenueDetails.aspx.cs" Inherits="EventApp.Admin.ManageVenueDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../css/AdminCategory.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="form-header">Manage Venue Details</h2>
    <hr class="form-divider" />

    <div class="form-container">
        <form id="venueForm">
            <div class="form-section">
                <asp:Label runat="server" ID="lblCurrentVenueName" CssClass="form-label-current"></asp:Label><br /><br />
                <asp:Label runat="server" ID="lblCurrentLocation" CssClass="form-label-current"></asp:Label><br /><br />
                <asp:Label runat="server" ID="lblCurrentState" CssClass="form-label-current"></asp:Label><br /><br />
            </div>

            <asp:Label runat="server" ID="lblMessage"></asp:Label><br /><br />

            <div class="form-section">
                <asp:Label runat="server" CssClass="form-label" Text="New Venue Name : "></asp:Label>
                <asp:TextBox runat="server" ID="txtNewVenueName" CssClass="form-input"></asp:TextBox><br /><br />

                <asp:Label runat="server" CssClass="form-label" Text="New State : "></asp:Label>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <asp:DropDownList runat="server" ID="ddlNewState" CssClass="form-input">
                    <asp:ListItem>-- Select State --</asp:ListItem>
                    <asp:ListItem>Kuala Lumpur</asp:ListItem>
                    <asp:ListItem>Johor</asp:ListItem>
                    <asp:ListItem>Kedah</asp:ListItem>
                    <asp:ListItem>Kelantan</asp:ListItem>
                    <asp:ListItem>Malacca</asp:ListItem>
                    <asp:ListItem>Negeri Sembilan</asp:ListItem>
                    <asp:ListItem>Pahang</asp:ListItem>
                    <asp:ListItem>Penang</asp:ListItem>
                    <asp:ListItem>Perak</asp:ListItem>
                    <asp:ListItem>Perlis</asp:ListItem>
                    <asp:ListItem>Sabah</asp:ListItem>
                    <asp:ListItem>Sarawak</asp:ListItem>
                    <asp:ListItem>Selangor</asp:ListItem>
                    <asp:ListItem>Terengganu</asp:ListItem>
                </asp:DropDownList><br /><br />

                <div id="map" style="height: 400px; width: 100%;"></div>
                <asp:Label runat="server" CssClass="form-label" Text="New Location : "></asp:Label>
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <input id="autocomplete" type="text" placeholder="Enter new address">
                <asp:HiddenField ID="hdnSelectedLocation" runat="server" /><br /><br />


            </div>

            <div class="form-section">
                <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="form-button" OnClick="btnSubmit_Click" />
            </div>
        </form>
    </div>

    <script>
        let map;
        let autocomplete;

        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: -34.397, lng: 150.644 },
                zoom: 8
            });

            autocomplete = new google.maps.places.Autocomplete(document.getElementById('autocomplete'));
            autocomplete.bindTo('bounds', map);

            autocomplete.addListener('place_changed', function () {
                const place = autocomplete.getPlace();
                if (place.geometry) {
                    // Access place details, including address: place.formatted_address
                    console.log('Selected Address:', place.formatted_address);

                    // Update the hidden field with the selected place's address
                    document.getElementById('<%= hdnSelectedLocation.ClientID %>').value = place.formatted_address;

                    // Update the map's center to the selected place
                    map.setCenter(place.geometry.location);
                }
            });
        }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDFDJaKUuaI482d-rYPu_787qlRIRMhT_0&libraries=places&callback=initMap" async defer></script>
</asp:Content>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:gb="http://www.example.com/garage">

    <!-- Root template -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Your Domain Name</title>
                <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        margin: 20px;
                    }
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin: 20px 0;
                    }
                    th, td {
                        border: 1px solid #ddd;
                        padding: 8px;
                        text-align: left;
                    }
                    th {
                        background-color: #f2f2f2;
                    }
                    h1 {
                        text-align: center;
                    }
                    #map {
                        height: 500px; /* Adjust the height as needed */
                        width: 100%;
                      }
                      
                </style>
            </head>
            <body>
                <h1>Garage Booking</h1>

                <!-- Bookings Table -->
                <h2>Bookings</h2>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Customer ID</th>
                            <th>Vehicle Model</th>
                            <th>Service Date</th>
                            <th>Service ID</th>
                            <th>Price Amount</th>
                            <th>Location ID</th>
                            <th>Payment Method ID</th>
                            <th>Rating ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="gb:garageBooking/gb:bookings/gb:booking">
                            <tr>
                                <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="gb:customerId"/></td>
                                <td><xsl:value-of select="gb:vehicleModel"/></td>
                                <td><xsl:value-of select="gb:serviceDate"/></td>
                                <td><xsl:value-of select="gb:serviceId"/></td>
                                <td><xsl:value-of select="gb:priceAmount"/></td>
                                <td><xsl:value-of select="gb:locationId"/></td>
                                <td><xsl:value-of select="gb:paymentMethodId"/></td>
                                <td><xsl:value-of select="gb:ratingId"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>

                <!-- Locations Table -->
                <h2>Locations</h2>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Street</th>
                            <th>City</th>
                            <th>State</th>
                            <th>Postal Code</th>
                            <th>Country</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="gb:garageBooking/gb:locations/gb:location">
                            <tr>
                                <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="gb:street"/></td>
                                <td><xsl:value-of select="gb:city"/></td>
                                <td><xsl:value-of select="gb:state"/></td>
                                <td><xsl:value-of select="gb:postalCode"/></td>
                                <td><xsl:value-of select="gb:country"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>

                <!-- Customers Table -->
                <h2>Customers</h2>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Phone</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="gb:garageBooking/gb:customers/gb:customer">
                            <tr>
                                <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="gb:name"/></td>
                                <td><xsl:value-of select="gb:phone"/></td>
                                <td><xsl:value-of select="gb:email"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>

                <!-- Services Table -->
                <h2>Services</h2>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Service Name</th>
                            <th>Service Cost</th>
                            <th>Service Hours</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="gb:garageBooking/gb:services/gb:service">
                            <tr>
                                <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="gb:serviceName"/></td>
                                <td><xsl:value-of select="gb:serviceCost"/></td>
                                <td><xsl:value-of select="gb:serviceHours"/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>

                <!-- Payment Methods Table -->
                <h2>Payment Methods</h2>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Payment Method</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="gb:garageBooking/gb:paymentMethods/gb:paymentMethod">
                            <tr>
                                <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="."/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>

                <!-- Ratings Table -->
                <h2>Ratings</h2>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Rating</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="gb:garageBooking/gb:ratings/gb:rating">
                            <tr>
                                <td><xsl:value-of select="@id"/></td>
                                <td><xsl:value-of select="."/></td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
                <h2>Route Map between Delhi and Agra</h2>
    <div id="map" class="map"></div>

    <!-- Leaflet JS -->
    <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    <!-- Custom script -->
    <script>
        console.log("Initializing map..."); // Add this line to debug
      function initMap() {
        
        var map = L.map('map').setView([27.84, 77.57], 7); 

        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
          maxZoom: 19,
          attribution: '© OpenStreetMap contributors'
        }).addTo(map);

        // Define the coordinates for the route
        var routeCoordinates = [
        [12.9716, 77.5946], // Bangalore
        [10.8505, 76.2711]  // Kerala (center of Kerala)
    ];

        // Draw the route on the map with better visibility
        var polyline = L.polyline(routeCoordinates, { color: 'blue', weight: 5 }).addTo(map);
        map.fitBounds(polyline.getBounds()); // Fit map to the route

        // Add markers for each location
        L.marker(routeCoordinates[0]).addTo(map).bindPopup('Banglore').openPopup();
        L.marker(routeCoordinates[1]).addTo(map).bindPopup('Kerala').openPopup();
      }

      // Initialize the map when the page loads
      document.addEventListener('DOMContentLoaded', function() {
        initMap();
      });
    </script>
</body>
        </html>
    </xsl:template>

</xsl:stylesheet>

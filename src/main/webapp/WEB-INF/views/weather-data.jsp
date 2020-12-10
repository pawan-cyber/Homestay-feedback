<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Market Price</title>
    <style>
        #customers {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        #customers td, #customers th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        #customers tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #customers tr:hover {
            background-color: #ddd;
        }

        #customers th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #F1B24A;
            color: white;
        }

        .styled-table {
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 0.9em;
            font-family: sans-serif;
            min-width: 1050px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
        }

        .styled-table thead tr {
            background-color: #F1B24A;
            color: #ffffff;
            text-align: left;
        }

        .styled-table th,
        .styled-table td {
            padding: 12px 15px;
        }

        .styled-table tbody tr.active-row {
            font-weight: bold;
            color: #F1B24A;
        }

        .styled-table tbody tr {
            border-bottom: 1px solid #dddddd;
        }

        .styled-table tbody tr:nth-of-type(even) {
            background-color: #f3f3f3;
        }

        .styled-table tbody tr:last-of-type {
            border-bottom: 2px solid #F1B24A;
        }
    </style>
</head>
<body class="background">
<div class="container" style="margin-top: 100px;">
    <div class="card border-primary">
        <div class="card-title bg-primary">
            <h3 class="text-center text-white">Weather Data</h3>
        </div>
        <div class="card-body">
            <table class="table styled-table" id="customers">
                <tr class="background">
                    <td ><h6>City Name</h6></td>
                    <td><h6 id="name"></h6></td>
                </tr>
                <tr class="background">
                    <td ><h6>Humidity</h6></td>
                    <td><h6 id="humidity"></h6></td>
                </tr>
                <tr class="background">
                    <td ><h6 >Pressure</h6></td>
                    <td><h6 id="pressure"></h6></td>
                </tr>
                <tr class="background">
                    <td><h6 >Maximum Temperature</h6></td>
                    <td><h6 id="temp_max"></h6></td>
                </tr>
                <tr class="background">
                    <td><h6 >Minimum Temperature</h6></td>
                    <td><h6 id="temp_min"></h6></td>
                </tr>
                <tr class="background">
                    <td><h6 >Visibility</h6></td>
                    <td><h6 id="visibility"></h6></td>
                </tr>
            </table>
        </div>
        <div class="card-footer">
            <span>
                <strong><i>Source:</i> Nepal Weather Api , <i>website: </i>https://nepal-weather-api.herokuapp.com/</strong>
            </span>
        </div>
    </div>
</div>
</body>
<script>
    $(document).ready(function () {
        showData();
    });

    function showData() {
        $.ajax({
            url: "http://api.openweathermap.org/data/2.5/weather?id=1283240&lang=en&units=metric&APPID=845ebe51ff2d4509697271f731091f6c&fbclid=IwAR0iyLnLi6-iQUB106-5uPm6dZDIlwGhrQ6qCX-hLpo1p-z8MCjx4jnwgpo",
            type: "GET",
            success: function (data) {

                if (data == null) {
                    alert("no data found !!");

                } else {
                    console.log(data);
                 document.getElementById("name").innerText = data.name;
                 document.getElementById("humidity").innerText = data.main.humidity + ' g.kg-1';
                 document.getElementById("pressure").innerText = data.main.pressure + ' pascal';
                 document.getElementById("temp_max").innerText = data.main.temp_max + '° celsius';
                 document.getElementById("temp_min").innerText = data.main.temp_min + '° celsius';
                 document.getElementById("visibility").innerText = data.main.temp_min + ' kilometre';
                }
            },

        });

    }
</script>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="CSSsimple/adminDashbord.css">

        <!-- jQuery UI -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="//code.jquery.com/jquery-1.12.4.js"></script>
        <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        <title>Admin Dashboard</title>
        <script>

                $(document).ready(function () {
                var startDate, endDate; // Biến lưu trữ ngày bắt đầu và ngày kết thúc

                        // Retrieve data from the server-side and store it in a variable named "dataPoints"
                        var dataPoints = <%= request.getAttribute("dataPoints") %>;
                        var orderData = [];
                        var footfallData = [];
                        var revenueData = [];
                        // Chuyển đổi dữ liệu từ servlet thành định dạng dữ liệu cho biểu đồ
                        for (var i = 0; i < dataPoints.data.length; i++) {
                            var item = dataPoints.data[i];
                            var dataPoint = {
                                x: new Date(item.date),
                                    y: item.order
                            };
                            orderData.push(dataPoint);
                            dataPoint = {
                                x: new Date(item.date),
                                y: item.footfall
                            };
                            footfallData.push(dataPoint);
                            dataPoint = {
                                x: new Date(item.date),
                                y: item.revenue
                            };
                            revenueData.push(dataPoint);
                }

                // Lấy ngày nhỏ nhất và ngày lớn nhất từ dữ liệu thu được từ servlet
                // Tải dữ liệu JSON đã chuyển đổi từ servlet
                var dataPoints = ${dataPoints}; // Đã chuyển đổi thành đối tượng JavaScript

                        // Tìm ngày nhỏ nhất và ngày lớn nhất từ dữ liệu
                        var minTimestamp = dataPoints.data[0].date;
                        var maxTimestamp = dataPoints.data[dataPoints.data.length - 1].date;
                        // Chuyển đổi timestamp thành đối tượng Date của JavaScript
                        var minDate = new Date(minTimestamp);
                        var maxDate = new Date(maxTimestamp);
                        // Tạo selection từ ngày nhỏ nhất đến ngày lớn nhất
                        var startDateSelect = $('<select id="startDate"></select>');
                        var endDateSelect = $('<select id="endDate"></select>');
                        // Lấy danh sách các tháng và năm
                        var months = [];
                        var years = [];
                        for (var currentDate = new Date(minDate); currentDate <= maxDate; currentDate.setMonth(currentDate.getMonth() + 1)) {
                var month = currentDate.toLocaleString('default', { month: 'long' });
                        var year = currentDate.getFullYear();
                        if (!months.includes(month)) {
                months.push(month);
                        var option = $('<option value="' + month + '">' + month + '</option>');
                        startDateSelect.append(option);
                        endDateSelect.append(option.clone());
                }

                if (!years.includes(year)) {
                years.push(year);
                        var option = $('<option value="' + year + '">' + year + '</option>');
                        startDateSelect.append(option);
                        endDateSelect.append(option.clone());
                }
                }

                // Gắn kết sự kiện change cho selection
                startDateSelect.change(function () {
                var selectedMonth = $(this).val();
                        var selectedYear = $("#startYear").val();
                        var newStartDate = new Date(selectedYear, months.indexOf(selectedMonth));
                        if (endDate && newStartDate > endDate) {
                alert("Vui lòng chọn ngày bắt đầu trước ngày kết thúc.");
                        return;
                } else if (endDate && newStartDate.getTime() === endDate.getTime()) {
                alert("Ngày bắt đầu không thể bằng ngày kết thúc.");
                        return;
                }

                startDate = newStartDate;
                        updateChart();
                });
                        endDateSelect.change(function () {
                        var selectedMonth = $(this).val();
                                var selectedYear = $("#endYear").val();
                                var newEndDate = new Date(selectedYear, months.indexOf(selectedMonth));
                                if (startDate && newEndDate < startDate) {
                        alert("Vui lòng chọn ngày kết thúc sau ngày bắt đầu.");
                                return;
                        } else if (startDate && newEndDate.getTime() === startDate.getTime()) {
                        alert("Ngày kết thúc không thể bằng ngày bắt đầu.");
                                return;
                        }

                        endDate = newEndDate;
                                updateChart();
                        });
//                        var selectionContainer = $('<div class="selection-container"></div>');
//                        selectionContainer.append('<label for="startDate">Start Date:</label>');
//                        selectionContainer.append(startDateSelect);
//                        selectionContainer.append('<select id="startYear"></select>');
//                        selectionContainer.append('<label for="endDate">End Date:</label>');
//                        selectionContainer.append(endDateSelect);
//                        selectionContainer.append('<select id="endYear"></select>');
//                        $("body").prepend(selectionContainer);
                       
                        // Tạo biểu đồ
                        var chart = new CanvasJS.Chart("chartContainer", {
                        title: {
                        text: "Admin Dashboard"
                        },
                                axisY: [{
                                title: "Order",
                                        lineColor: "#C24642",
                                        tickColor: "#C24642",
                                        labelFontColor: "#C24642",
                                        titleFontColor: "#C24642",
                                        includeZero: true
                                },
                                {
                                title: "Footfall",
                                        lineColor: "#369EAD",
                                        tickColor: "#369EAD",
                                        labelFontColor: "#369EAD",
                                        titleFontColor: "#369EAD",
                                        includeZero: true
                                }],
                                axisY2: {
                                title: "Revenue",
                                        lineColor: "#7F6084",
                                        tickColor: "#7F6084",
                                        labelFontColor: "#7F6084",
                                        titleFontColor: "#7F6084",
                                        includeZero: true,
                                        prefix: "$"
                                },
                                toolTip: {
                                shared: true
                                },
                                legend: {
                                cursor: "pointer",
                                        itemclick: function (e) {
                                        if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                                        e.dataSeries.visible = false;
                                        } else {
                                        e.dataSeries.visible = true;
                                        }
                                        chart.render();
                                        }
                                },
                                data: [{
                                type: "line",
                                        name: "Order",
                                        color: "#C24642",
                                        showInLegend: true,
                                        axisYIndex: 0,
                                        dataPoints: orderData
                                },
                                {
                                type: "line",
                                        name: "Footfall",
                                        color: "#369EAD",
                                        showInLegend: true,
                                        axisYIndex: 1,
                                        dataPoints: footfallData
                                },
                                {
                                type: "line",
                                        name: "Revenue",
                                        color: "#7F6084",
                                        axisYType: "secondary",
                                        showInLegend: true,
                                        dataPoints: revenueData
                                }]
                        });
                        // Hàm cập nhật biểu đồ dựa trên ngày bắt đầu và kết thúc
                                function updateChart() {
                                var filteredOrderData = [];
                                        var filteredFootfallData = [];
                                        var filteredRevenueData = [];
                                        // Lọc dữ liệu dựa trên ngày bắt đầu và kết thúc
                                        for (var i = 0; i < data.data.length; i++) {
                                var item = data.data[i];
                                        var date = new Date(item.date);
                                        if ((!startDate || date >= startDate) && (!endDate || date <= endDate)) {
                                var dataPoint = {
                                x: date,
                                        y: item.order
                                };
                                        filteredOrderData.push(dataPoint);
                                        dataPoint = {
                                        x: date,
                                                y: item.footfall
                                        };
                                        filteredFootfallData.push(dataPoint);
                                        dataPoint = {
                                        x: date,
                                                y: item.revenue
                                        };
                                        filteredRevenueData.push(dataPoint);
                                }
                                }

                                // Cập nhật dữ liệu cho biểu đồ
                                chart.options.data[0].dataPoints = filteredOrderData;
                                        chart.options.data[1].dataPoints = filteredFootfallData;
                                        chart.options.data[2].dataPoints = filteredRevenueData;
                                        chart.render();
                                }

                        // Khởi tạo biểu đồ ban đầu
                        chart.render();
                     
                    
            });
        </script>


        <style>
            .selection-container {
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 10px;
            }

            .selection-container label {
                margin-right: 5px;
            }
        </style>
    </head>
    <body>
        <!-- SIDEBAR -->
        <jsp:include page="headerDashbord.jsp" />
        <!-- SIDEBAR -->
        <!-- CONTENT -->
        <section id="content">
            <!-- NAVBAR -->
            <nav>
                <i class='bx bx-menu'></i>
                <form action="#">
                    <div class="form-input">
                        <input type="search" placeholder="Search...">
                        <button type="submit" class="search-btn"><i class='bx bx-search'></i></button>
                    </div>
                </form>
            </nav>
            <!-- NAVBAR -->

            <!-- MAIN -->
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>Admin Dashboard</h1>
                        <ul class="breadcrumb">
                            <li>
                                <a href="#"></a>
                            </li>
                            <li>
                                <a class="active" href="#"></a>
                            </li>
                        </ul>
                    </div>
                </div>

                <ul class="box-info">
                    <li>
                        <i class='bx bxs-calendar-check'></i>
                        <span class="text">
                            <h3>${order}</h3>
                            <p>Order</p>
                        </span>
                    </li>
                    <li>
                        <i class='bx bxs-group'></i>
                        <span class="text">
                            <h3>${user}</h3>
                            <p>Footfall</p>
                        </span>
                    </li>
                    <li>
                        <i class='bx bxs-dollar-circle'></i>
                        <span class="text">
                            <h3>$${amount}</h3>
                            <p>revenue</p>
                        </span>
                    </li>
                </ul>

                <div class="table-data">
                    <div id="chartContainer" style="height: 370px; width: 100%;"></div>
                    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
                </div>
            </main>
            <!-- MAIN -->
        </section>
    </body>
</html>
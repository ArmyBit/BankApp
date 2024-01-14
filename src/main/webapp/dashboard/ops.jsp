<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank App Operations</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #222;
            color: #fff;
        }

        header {
            background-color: #333;
            padding: 1em;
            text-align: center;
        }

        main {
            padding: 20px;
        }

        .operations-list {
            list-style-type: none;
            padding: 0;
            margin-top: 20px;
        }

        .operation-card {
            border: 1px solid #444;
            border-radius: 8px;
            margin: 10px 0;
            padding: 15px;
            background-color: #333;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
        }

        .operation-description {
            margin-bottom: 10px;
        }

        .operation-amount {
            color: #007bff;
            font-weight: bold;
        }

        canvas {
            max-width: 600px;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<header>
    <h1>Bank App Operations</h1>
</header>

<main>
    <ul class="operations-list">
        <c:forEach var="operation" items="${listofallops}">
            <li>
                <div class="operation-card">
                    <div class="operation-description">${operation.getTypeOperation()} on ${operation.getDateOperation()}</div>
                    <div class="operation-amount">${operation.getMontant()} Dh</div>
                </div>
            </li>
        </c:forEach>
    </ul>

    <!-- Chart container -->
    <div>
        <canvas id="balanceChart"></canvas>
    </div>
</main>

<script>
    // Example data for the chart
    const chartData = {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
        datasets: [{
            label: 'Balance History',
            data: [5000, 5500, 6000, 5500, 7000, 8000],
            backgroundColor: 'rgba(0, 123, 255, 0.5)',
            borderColor: 'rgba(0, 123, 255, 1)',
            borderWidth: 2
        }]
    };

    // Function to create a balance chart
    function createChart() {
        const ctx = document.getElementById('balanceChart').getContext('2d');
        const balanceChart = new Chart(ctx, {
            type: 'line',
            data: chartData,
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    x: {
                        grid: {
                            display: false
                        }
                    },
                    y: {
                        beginAtZero: true,
                        ticks: {
                            callback: value => `$${value.toFixed(2)}`
                        }
                    }
                }
            }
        });
    }

    // Call the function to create the balance chart
    createChart();
</script>

</body>
</html>

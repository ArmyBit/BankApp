<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank App Operations</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">



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

</body>
</html>

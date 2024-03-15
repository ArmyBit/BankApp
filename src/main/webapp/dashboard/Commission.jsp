<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Commission</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">



    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #222;
            color: #ffffff;
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
    <h1 onclick="window.location.href='../dashboard'">Bank Commissions</h1>
</header>

<main>
    <div class="operation-card">
    </div>
    <div class="operation-card" style="text-align: center ; color: #6474e0;  font-weight: bold;">
       The Total Amount of Bank Commission :  <%=request.getAttribute("SUM")%>  DH
    </div>
    <div class="operation-card">
    </div>
    <ul class="operations-list">
        <c:choose>
            <c:when test="${not empty ListOfCommission}">
                <c:forEach var="Commission" items="${ListOfCommission}">
                    <li>
                        <div class="operation-card">
                            <div class="operation-description">Commission Id: ${Commission.getIdCommission()}</div>
                            <div class="operation-description">Operation Id : ${Commission.getId_Op()}</div>
                            <div class="operation-amount">Commission Value: ${Commission.getVal()} Dh </div>


                        </div>
                    </li>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p>No Commission Available</p>
            </c:otherwise>
        </c:choose>
    </ul>

    <!-- Chart container -->
    <div>
        <canvas id="balanceChart"></canvas>
    </div>
</main>

</body>
</html>

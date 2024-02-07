<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Main Page -->
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


        canvas {
            max-width: 600px;
            margin-top: 20px;
        }

        .operations-form {
            margin-top: 20px;
            padding: 20px;
            border: 1px solid #444;
            border-radius: 8px;
            background-color: #333;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }
    </style>

</head>
<body>

<header>
    <h1>Bank App Operations</h1>
</header>

<main>
    <div class="operations-form">
        <h2>Operations Form</h2>
        <form id="operationsForm" action="OpsI" method="post">
            <input type="hidden" name="numAcc"  id="accNumsender" >


            <div class="form-group">
                <label for="operationType">Recipient Account number :</label>
                <input type="number" id="operationType" name="RCAcc" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="operationAmount">Operation Amount:</label>
                <input type="number" id="operationAmount" name="operationAmount" class="form-control" required>
            </div>
            <button class="btn btn-primary" type="submit">Submit</button>
            <button type="reset" class="btn btn-danger" >Delete</button>
        </form>
    </div>

<script >


        let a =window.location.search;
        a=a.split('=');
        a=a[1];
        var elem=document.getElementById("accNumsender");
        elem.value=a;


</script>
</main>

</body>
</html>

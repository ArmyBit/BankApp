<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bank App Dashboard</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
    }

    header {
      background-color: #333;
      color: #fff;
      padding: 1em;
      text-align: center;
    }

    main {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-around;
      padding: 20px;
    }

    .account-card {
      width: 300px;
      margin: 20px;
      padding: 15px;
      border: 1px solid #ddd;
      border-radius: 8px;
      background-color: #fff;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s;
      cursor: pointer;
    }

    .account-card:hover {
      transform: scale(1.05);
    }

    .account-number {
      font-size: 18px;
      font-weight: bold;
      margin-bottom: 10px;
    }

    .balance {
      color: #007bff;
      font-size: 16px;
    }

    .operations-list {
      list-style-type: none;
      padding: 0;
      margin-top: 10px;
    }

    .operation-card {
      border: 1px solid #ddd;
      border-radius: 8px;
      margin: 5px;
      padding: 10px;
      background-color: #f9f9f9;
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
  </style>
  <script>
    function redirectToDashboard(accountNum) {
      var form = document.createElement('form');
      form.setAttribute('method', 'post');
      form.setAttribute('action', 'dashboard'); // Replace with your actual servlet URL

      var input = document.createElement('input');
      input.setAttribute('type', 'hidden');
      input.setAttribute('name', 'accountNum');
      input.setAttribute('value', accountNum);

      form.appendChild(input);
      document.body.appendChild(form);

      form.submit();
    }
  </script>
</head>
<body>

<header>
  <h1>Bank App Dashboard</h1>
</header>

<main>
  <jsp:useBean id="listofaccounts" scope="request" type="java.util.List"/>
  <c:forEach var="element" items="${listofaccounts}">
    <div class="account-card" onclick="redirectToDashboard('${element.getAccountNum()}')" >
      <div class="account-number">Account # ${element.getAccountNum()}</div>
      <div class="balance">Balance:  ${element.getSolde()} Dh </div>
    </div>
  </c:forEach>
<jsp:useBean id="listofallops" scope="request" type="java.util.List"/>
<c:forEach var="element" items="${listofallops}">
  <p>${element}</p>
</c:forEach>

</main>

</body>
</html>

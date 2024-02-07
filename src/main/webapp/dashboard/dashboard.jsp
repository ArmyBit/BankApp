<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <title>Dark Bank Dashboard</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #222;
      color: #59619c;
    ;
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
      height: 150px;
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
    .button {
      padding: 8px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
  </style>
  <script>

    function redirecttoops(accountNum) {
      var form = document.createElement('form');
      form.setAttribute('method', 'post');
      form.setAttribute('action', 'dashboard');

      var input = document.createElement('input');
      input.setAttribute('type', 'hidden');
      input.setAttribute('name', 'accountNum');
      input.setAttribute('value', accountNum);

      form.appendChild(input);
      document.body.appendChild(form);


      form.submit();
    }
    function redirectopsinter(accountNum) {
      var form = document.createElement('form');
      form.setAttribute('method', 'get');
      form.setAttribute('action', 'dashboard/OpsI');

      var input = document.createElement('input');
      input.setAttribute('type', 'hidden');
      input.setAttribute('name', 'accountNum');
      input.setAttribute('value', accountNum);

      form.appendChild(input);
      document.body.appendChild(form);


      form.submit();
    }

    function redirectopsExterne(accountNum) {
      var form = document.createElement('form');
      form.setAttribute('method', 'get');
      form.setAttribute('action', 'dashboard/OpsE');

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
  <h1>Welcome <%=session.getAttribute("username")%></h1>
</header>

<main>
  <jsp:useBean id="listofaccounts" scope="request" type="java.util.List"/>
  <c:forEach var="element" items="${listofaccounts}">
    <div class="account-card" >
      <div class="account-number">Account # ${element.getAccountNum()}</div>
      <div class="balance">Balance:  ${element.getSolde()} Dh </div>
      <div class="buttons-container">
        <button class="button" onclick="redirecttoops('${element.getAccountNum()}')">View Operations</button>
        <button class="button" onclick="redirectopsinter('${element.getAccountNum()}')">Virement Interne </button>
        <button class="button" onclick="redirectopsExterne('${element.getAccountNum()}')">Virement Externe</button>
      </div>

    </div>
  </c:forEach>
<jsp:useBean id="listofallops" scope="request" type="java.util.List"/>
  <ul class="operations-list">
    <h1>List of All operations </h1>
    <c:forEach var="operation" items="${listofallops}">
      <li>
        <div class="operation-card">
          <div class="operation-amount">${operation.getAccountNum()}</div>
          <div class="operation-description">${operation.getTypeOperation()} on ${operation.getDateOperation()}</div>
          <div class="operation-amount">${operation.getMontant()}</div>
        </div>
      </li>
    </c:forEach>
  </ul>
<script>
  const queryString = window.location.search;
  const urlParams = new URLSearchParams(queryString);
  const statuserror = urlParams.get('OpsResp')
  console.log(statuserror)

  if (statuserror){
    if ( statuserror.includes("Error")) {
    Swal.fire({
      icon: "error",
      title: "Oops...",
      text: statuserror,
    });
  } else {
    Swal.fire({
      icon: "success",
      title: "Operation Info",
      text: statuserror,
    });
  }}
</script>


</main>



</body>
</html>

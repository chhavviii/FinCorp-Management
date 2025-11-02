<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Transaction</title>
<style>
  body {
  font-family: Arail, sans-serif;
  background-color:#f9f9f9
  margin:20px;
  }
  
  h2{
  color:#4CAF50;
  }
  
  form {
  margin-bottom: 15px;
  padding: 10px;
  background-color:#fff;
  border: 1px solid #ccc;
  width: 300px;
  
  }
  
  input[type="text"], input [type="date"] {
  width: 95%;
  padding:5px;
  margin:5px 0 10px 0;
  border:1px solid #ccc;
  border-radius:3px;
  
  }
  
  input[type="submit""]{
  background-color:#4CAF50;
  /*color:white;*/
  padding:7px 15px;
  border:none;
  border-radius:3px;
  cursor:pointer;
  margin-right:5px;
  
  }
  
  .back-btn{
  background-color:#2196F3;
  }
  
  .back-btn:hover{
  background-color:#0b7dda;
  }

</style>
</head>
<body>
<h2>Create Transaction</h2>
<form action="FincorpServlet" method="post">
    <input type="hidden" name="action" value="create">

    Branch ID: <input type="text" name="branchId"><br>
    Branch Name: <input type="text" name="branchName"><br>
    Location: <input type="text" name="location"><br>
    Number of Transactions: <input type="text" name="NumOftransactions"><br>
    Date of Transaction: <input type="date" name="dateOfTransaction"><br>

    <input type="submit" value="Create">
</form>

<!-- Back to Menu -->
<form action="menu.jsp">
   <input type="submit" value="Back to Menu">
</form>
<form action="dashboard.jsp">
    <input type="submit" class="back-btn" value="Back to Dashboard">
</form>
</body>
</html>
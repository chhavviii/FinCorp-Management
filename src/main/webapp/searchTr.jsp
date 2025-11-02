<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Transaction</title>
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
<h2>Search Transaction</h2>

<!-- Search Form -->
<form action="FincorpServlet" method="post">
    Enter Branch ID: 
    <input type="text" name="branchId" required>
    <input type="hidden" name="action" value="search">
    <input type="submit" value="Search">
</form>




<% 
   String error = (String) request.getAttribute("error");
   Object branchId = request.getAttribute("branchId");

   if (error != null) {
%>
   <h3 style="color:red;"><%= error %></h3>
<% 
   } else if (branchId != null) {
%>
   Branch ID: <%= branchId %><br>
   Branch Name: <%= request.getAttribute("branchName") %><br>
   Location: <%= request.getAttribute("location") %><br>
   Number of Transactions: <%= request.getAttribute("numTr") %><br>
   Date: <%= request.getAttribute("date") %><br>
<% } %>

<!-- Back to Menu -->
<form action="menu.jsp">
   <input type="submit" value="Back to Menu">
</form>

<form action="dashboard.jsp">
    <input type="submit" class="back-btn" value="Back to Dashboard">
</form>
</body>
</html>
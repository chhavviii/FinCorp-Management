<%@page import="com.example.utils.Bank"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Six Month Statement</title>
<link rel="stylesheet" type="text/css" href="TableStyle.css">
</head>
<body>
 <h2 style="color: #2c3e50">Six Month Statement</h2>
 <form action="sixmonthsdata" method="get">
  <label>Start Date:</label> <input type="date" name="startDate"
   value="<%=request.getParameter("startDate") != null ? request.getParameter("startDate") : ""%>">

  <label>End Date:</label> <input type="date" name="endDate"
   value="<%=request.getParameter("endDate") != null ? request.getParameter("endDate") : ""%>">

  <input type="submit" value="Get Statement"> <input
   type="reset" value="Reset Dates" onclick="resetDates()">
 </form>


 <hr>


 <h3 style="color: #2c3e50; display: inline; margin: 0;">Transactions:</h3>
 <button style="margin-left: 10px;" onclick="downloadTableAsCSV()">
  Download CSV</button>



 <table id="sixMonthTable" border="1" cellpadding="5" cellspacing="0">
  <tr>
   <th>Branch ID</th>
   <th>Branch Name</th>
   <th>Location</th>
   <th>Number of Transactions</th>
   <th>Date</th>
  </tr>
  <%
  List<Bank> bankData = (List<Bank>) request.getAttribute("bank");

  if (bankData != null) {
   for (Bank t : bankData) {
  %>
  <tr>
   <td><%=t.getBranchId()%></td>
   <td><%=t.getBranchName()%></td>
   <td><%=t.getLocation()%></td>
   <td><%=t.getNumOfTransactions()%></td>
   <td><%=t.getDateOfTransaction()%></td>
  </tr>
  <%
  }
  }
  %>
 </table>

 <%
 Bank minTransaction = null, maxTransaction = null;
 %>

 <!-- Min Transaction Section -->
 <%
 minTransaction = (Bank) request.getAttribute("minTransaction");
 if (minTransaction != null) {
 %>
 <h3>Branch with Minimum Transactions</h3>

 <table border="1" cellpadding="5" cellspacing="0">
  <tr>
   <th>Branch ID</th>
   <th>Branch Name</th>
   <th>Location</th>
   <th>Number of Transactions</th>
   <th>Date</th>
  </tr>
  <tr>
   <td><%=minTransaction.getBranchId()%></td>
   <td><%=minTransaction.getBranchName()%></td>
   <td><%=minTransaction.getLocation()%></td>
   <td><%=minTransaction.getNumOfTransactions()%></td>
   <td><%=minTransaction.getDateOfTransaction()%></td>
  </tr>
 </table>
 <%
 }
 %>

 <br>

 <!-- Max Transaction Section -->
 <%
 maxTransaction = (Bank) request.getAttribute("maxTransaction");
 if (maxTransaction != null) {
 %>

 <h3>Branch with Maximum Transactions</h3>

 <table border="1" cellpadding="5" cellspacing="0">
  <tr>
   <th>Branch ID</th>
   <th>Branch Name</th>
   <th>Location</th>
   <th>Number of Transactions</th>
   <th>Date</th>
  </tr>
  <tr>
   <td><%=maxTransaction.getBranchId()%></td>
   <td><%=maxTransaction.getBranchName()%></td>
   <td><%=maxTransaction.getLocation()%></td>
   <td><%=maxTransaction.getNumOfTransactions()%></td>
   <td><%=maxTransaction.getDateOfTransaction()%></td>
  </tr>
 </table>
 <%
 }
 %>


</body>
<script>
function downloadTableAsCSV(filename = 'statement.csv') {
 let csv = [];
 const rows = document.querySelectorAll("#sixMonthTable tr");
 for (let row of rows) {
  const cols = row.querySelectorAll("td, th");
  let rowData = [];
  for (let col of cols) {
   rowData.push('"' + col.innerText.replace(/"/g, '""') + '"');
  }
  csv.push(rowData.join(","));
 }
 const csvFile = new Blob([csv.join("\n")], { type: "text/csv" });
 const link = document.createElement("a");
 link.href = URL.createObjectURL(csvFile);
 link.download = filename;
 link.click();
}
 function resetDates() {
  document.querySelector("input[name='startDate']").value = "";
  document.querySelector("input[name='endDate']").value = "";
  document.forms[0].submit();
 }
</script>
</html>


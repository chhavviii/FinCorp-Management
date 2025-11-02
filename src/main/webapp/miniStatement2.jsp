<%@page import="com.example.utils.Bank"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Mini Statement</title>
    <link rel="stylesheet" type="text/css" href="TableStyle.css">
</head>
<body>
<h2>Mini Statement (Last 10 Branch Transactions)</h2>
<table border="1" cellpadding="8">
    <tr>
        <th>Branch ID</th>
        <th>Branch Name</th>
        <th>Location</th>
        <th>Transactions</th>
        <th>Date of Transaction</th>
    </tr>

    <c:forEach var="row" items="${transactions}">
        <tr>
            <td>${row.branchId}</td>
            <td>${row.branchName}</td>
            <td>${row.location}</td>
            <td>${row.transactions}</td>
            <td>${row.dateOfTransaction}</td>
        </tr>
    </c:forEach>
</table>

<br/><br/>

<!-- Minimum Transaction Branch -->
<h3>Branch with Minimum Transactions (from last 10)</h3>
<c:if test="${not empty minTransaction}">
    <table border="1" cellpadding="8">
        <tr>
            <th>Branch ID</th>
            <th>Branch Name</th>
            <th>Location</th>
            <th>Transactions</th>
            <th>Date of Transaction</th>
        </tr>
        <tr>
            <td>${minTransaction.branchId}</td>
            <td>${minTransaction.branchName}</td>
            <td>${minTransaction.location}</td>
            <td>${minTransaction.transactions}</td>
            <td>${minTransaction.dateOfTransaction}</td>
        </tr>
    </table>
</c:if>

<br/>

<!-- Maximum Transaction Branch -->
<h3>Branch with Maximum Transactions (from last 10)</h3>
<c:if test="${not empty maxTransaction}">
    <table border="1" cellpadding="8">
        <tr>
            <th>Branch ID</th>
            <th>Branch Name</th>
            <th>Location</th>
            <th>Transactions</th>
            <th>Date of Transaction</th>
        </tr>
        <tr>
            <td>${maxTransaction.branchId}</td>
            <td>${maxTransaction.branchName}</td>
            <td>${maxTransaction.location}</td>
            <td>${maxTransaction.transactions}</td>
            <td>${maxTransaction.dateOfTransaction}</td>
        </tr>
    </table>
</c:if>

</body>
</html>
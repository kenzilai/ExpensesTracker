<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Expense</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1>Expense Details</h1>
		<a href="/expenses">Go Back</a>
		<table>
			<tr>
				<td>Expense Name:</td>
				<td>${detail.expenseName}</td>
			</tr>
			<tr>
				<td>Expense Description:</td>
				<td>${detail.description}</td>
			</tr>
			<tr>
				<td>Vendor:</td>
				<td>${detail.vendor}</td>
			</tr>
			<tr>
				<td>Amount Spent:</td>
				<td>$${detail.amount}</td>
			</tr>
		</table>
	</div>
</body>
</html>
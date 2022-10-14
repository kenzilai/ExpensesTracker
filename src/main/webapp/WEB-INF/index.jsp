<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Read Share</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1>Expenses Tracker</h1>
		<table class="table table-striped table-hover table-responsive table-responsive">
			<thead>
			    <tr>
			      <th scope="col">Expense Name</th>
			      <th scope="col">Vendor</th>
			      <th scope="col">Amount</th>
			      <th scope="col">Actions</th>
			    </tr>
			  </thead>
			  <tbody>
				<c:forEach items="${allExpenses}" var="expenseObj">
			    <tr>
			      <td><a href="/expenses/${expenseObj.id}">${expenseObj.expenseName}</a></td>
			      <td>${expenseObj.vendor}</td>
			      <td>${expenseObj.amount}</td>
   			      <td class="d-flex">
   			      	<a href="/expenses/${expenseObj.id}/edit">Edit</a>
   			      	<form action="/expenses/${expenseObj.id}/delete" method="post">
				    	<input type="hidden" name="_method" value="delete">
				    	<button type="submit" class="btn btn-danger btn-sm ms-3">Delete</button>
					</form>
   			      </td>
			    </tr>
			    </c:forEach>
			  </tbody>
		</table>
	</div>
	
	<div class="container">
		<h2>Add an expense</h2>
		<form:form action="/expenses/add" method="post" modelAttribute="expense">
		    <p>
		        <form:label path="expenseName">Expense Name</form:label>
		        <form:errors path="expenseName" class="text-danger"/>
		        <form:input path="expenseName" type="text" class="form-control"/>
		    </p>
		    <p>
		        <form:label path="vendor">Vendor</form:label>
		        <form:errors path="vendor" class="text-danger"/>
		        <form:input path="vendor" class="form-control"/>
		    </p>
		    <p>
		        <form:label path="amount">Amount</form:label>
		        <form:errors path="amount" class="text-danger"/>
		        <form:input path="amount" type="number" step="0.01" class="form-control"/>
		    </p>
		    <p>
		        <form:label path="description">Description</form:label>
		        <form:errors path="description" class="text-danger"/>
		        <form:textarea path="description" class="form-control"/>
		    </p>    
		    <input type="submit" value="Submit" class="btn btn-primary"/>
		</form:form>
	</div>    
</body>
</html>
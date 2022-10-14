<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit My Task</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1>Edit Expense</h1>
		<a href="/expenses">Go Back</a>
		<form:form action="/expenses/${edit.id}/update" method="post" modelAttribute="edit">
		    <input type="hidden" name="_method" value="put">
		    <p>
		        <form:label path="expenseName">Expense:</form:label>
		        <form:errors path="expenseName" class="text-danger"/>
		        <form:input path="expenseName" type="text" class="form-control"/>
		    </p>
		    <p>
		        <form:label path="vendor">Vendor:</form:label>
		        <form:errors path="vendor" class="text-danger"/>
		        <form:input path="vendor" class="form-control"/>
		    </p>
		    <p>
		        <form:label path="amount">Amount:</form:label>
		        <form:errors path="amount" class="text-danger"/>
		        <form:input path="amount" type="number" step="0.01" class="form-control"/>
		    </p>
		    <p>
		        <form:label path="description">Description:</form:label>
		        <form:errors path="description" class="text-danger"/>
		        <form:textarea path="description" class="form-control"/>
		    </p>    
		    <input type="submit" value="Submit" class="btn btn-primary"/>
		</form:form>
	</div>
</body>
</html>
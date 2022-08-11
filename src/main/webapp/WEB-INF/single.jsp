<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
    
<meta charset="UTF-8">
<title>Show Expense</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	   
	<div class="container">
		<div class="row">
			<div class="col">
				<h1>Expense Details</h1>
				<a href="/">Go Back</a>
			</div>
		</div>
		<div class="row">
			<div class="col">
			<table class="table">
				<tbody>
					<tr>
						<td>Expense Name</td>
						<td>${thisExpense.expense}</td>
					</tr>
					<tr>
						<td>Expense Description</td>
						<td>${thisExpense.description}</td>
					</tr>
					<tr>
						<td>Vendor Name</td>
						<td>${thisExpense.vendor}</td>
					</tr>
					<tr>
						<td>Amount</td>
						<td>${thisExpense.amount}</td>
					</tr>
				</tbody>
			</table>
			</div>
		</div>
	</div>
</body>
</html>


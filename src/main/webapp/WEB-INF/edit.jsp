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
<title>Edit My Task</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="container">
	<div class="row">
		<div class="col d-flex justify-content-between align-items-center">
			<h1>
				Edit Expense:
				<c:out value="${thisExpense.expense }" />
			</h1>
			<a href="/">Go Back</a>
		</div>
	</div>


	<form:form action="/expenses/edit/${thisExpense.id}" model="post"
		modelAttribute="thisExpense">
		<div class="container">
			<form:errors style="color: red" path="*" />
		</div>
		<input type="hidden" name="_method" value="put">
		<p>
			<form:label path="expense">Expense Name:</form:label>
			<form:input path="expense" />
		</p>
		<p>
			<form:label path="vendor">Vendor:</form:label>
			<form:input path="vendor" />
		</p>
		<p>
			<form:label path="amount">Amount:</form:label>
			<form:input type="number" path="amount" />
		</p>
		<p>
			<form:label path="description">Description:</form:label>
			<form:textarea path="description" />
		</p>
		<input type="submit" value="Submit" />
	</form:form>
</body>
</html>


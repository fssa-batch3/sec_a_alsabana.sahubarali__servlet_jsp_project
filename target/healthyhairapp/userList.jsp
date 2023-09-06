<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>User List</title>
</head>
<body>
	<h1>Display All accounts</h1>

	<table class="table table-bordered">
		<thead>
			<tr>
			<th>S.NO</th>
				<th>User ID</th>
				<th>NAME</th>
				<th>EMAIL</th>
				<th>PASSWORD</th>
				<th>NUMBER</th>
				<th>USER CATEGORY</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="account" items="${user}" varStatus="loop">
				<tr>
					<td><c:out value="${loop.index + 1}" /></td>
					<td><c:out value="${account.userId}" /></td>
					<td><c:out value="${account.username}" /></td>
					<td><c:out value="${account.email}" /></td>
					<td><c:out value="${account.password}" /></td>
					<td><c:out value="${account.number}" /></td>
					<td><c:out value="${account.type}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>
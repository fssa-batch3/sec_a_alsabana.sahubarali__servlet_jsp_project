<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.healthyhair.model.User"%>
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
<title>Insert title here</title>
</head>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	background-color: #f2f2f2;
}

.container {
	width: 400px;
	margin-top: 10%;
	margin-left: 35%;
	padding: 23px;
	background-color: #fff;
	border-radius: 5px;
}

.container h1 {
	text-align: center;
	margin-bottom: 20px;
}

.container label {
	display: block;
	margin-bottom: 5px;
}

.container input[type="text"], .container input[type="password"],
	.container input[type="email"] {
	width: 95%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 3px;
	transition: border-color 0.3s ease;
}

.container input[type="text"]:focus, .container input[type="password"]:focus,
	.container input[type="email"]:focus {
	border-color: #04AA6D;
}

p {
	text-align: center;
	color: red;
}

.container a {
	color: #04AA6D;
	text-decoration: none;
}

.registerbtn {
	background-color: #04AA6D;
	color: #fff;
	padding: 12px 20px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
	width: 100%;
	opacity: 0.9;
}

.container input[type="submit"]:hover {
	opacity: 1;
}

form {
	margin-top: 100px;
}

h6 {
	color: red;
	text-align: center;
}
</style>
<body>
	<%
	User user1 = (User) session.getAttribute("User");
	String errorMessage = (String) request.getParameter("errorMessage");
	%>
	<jsp:include page="navbar.jsp"></jsp:include>
	<form action="EditUserServlet?userId=<%=user1.getUserId()%>"
		method="post">
		<div class="container">
			<%
			if (errorMessage != null)
				out.println("<p>" + errorMessage + "</p>");
			%>
			<h4>Edit details</h4>
			<input type="text" style="display: none" name="userId"
				value="<%=user1.getUserId()%>" /> <label for="email"><b>Name
					:</b></label> <input type="text" placeholder="Enter name" name="name"
				value="<%=user1.getUsername()%>" id="name" required> <label><b>Email:</b></label>
			<input type="email" value="<%=user1.getEmail()%>"
				placeholder="Enter your email" name="email" id="email" required>
			<label><b>Mobile No:</b></label> <input type="text"
				value="<%=user1.getNumber()%>" placeholder="Mobile no" name="number"
				required>
			<button type="submit" class="registerbtn">SAVE</button>
		</div>
	</form>

</body>
</html>
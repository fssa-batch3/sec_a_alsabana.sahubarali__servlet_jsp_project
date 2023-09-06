<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
.container {
	width: 300px;
	margin-top: 15%;
	margin-left: 35%;
	padding: 20px;
	background-color: #f2f2f2;
	border-radius: 5px;
}

h1 {
	text-align: center;
}

form {
	margin-top: 20px;
}

label {
	display: block;
	margin-bottom: 5px;
}

input[type="email"], input[type="password"] {
	width: 95%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 3px;
	margin-bottom: 10px;
}

input[type="submit"] {
	width: 100%;
	padding: 8px;
	background-color: #4caf50;
	color: white;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

.forgot-password {
	display: block;
	margin-top: 10px;
	text-align: right;
	color: blue;
}
</style>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
		<h1>Login</h1>
		<%
		String error = request.getParameter("errorMessage");

		if (error != null)
			out.println("<p>" + error + "</p>");
		%>
		<form action="LoginServlet" method="post">
			<label>Email:</label> <input type="email" id="username"
				placeholder="Enter email" name="email" required /> <label
				for="password">Password:</label> <input type="password"
				id="password" placeholder="Enter password" name="password" required />
			<label for="forgot-password" class="forgot-password">Forgot
				Password?</label>
			<button type="submit">Submit</button>
		</form>
	</div>
</body>
</html>
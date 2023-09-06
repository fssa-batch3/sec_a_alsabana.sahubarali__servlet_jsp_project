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
<meta charset="ISO-8859-1">
<title>Registration</title>
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

.container p {
	text-align: center;
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
	margin-top: -100px;
}

h6 {
	color: red;
	text-align: center;
}
</style>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>


	<form action="RegistrationServlet" method="post">

		<div class="container">
			<h1>Registration</h1>
			<hr>
			<%
			String error = request.getParameter("errorMessage");
			if (error != null)
				out.println("<h6>" + error + "</h6>");
			%>
			<label for="email"><b>Name :</b></label> <input type="text"
				placeholder="Enter name" name="name" id="name" required> <label><b>Email:</b></label>
			<input type="email" placeholder="Enter your email" name="email"
				id="email" required> <label><b>Mobile No:</b></label> <input
				type="text" placeholder="Mobile no" name="number" required>

			<label for="psw"><b>Password:</b></label> <input type="password"
				placeholder="Enter Password" name="password" required> 
				<label><b>Registration
					type:</b></label> <input type="text" placeholder="Buyer / Seller" name="type"
				required>

			<p>
				By creating an account you agree to our <a href="#">Terms &
					Privacy</a>.
			</p>

			<button type="submit" class="registerbtn">Register</button>
		</div>
	</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>

<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

header {
	background-color: #333;
	color: #fff;
	padding: 30px 0;
}

nav {
	display: flex;
	justify-content: center;
}

nav a {
	color: #fff;
	text-decoration: none;
	margin: 0 20px;
}

nav a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<header>
		<nav>

			<a href="ListUserServlet">User List</a> <a href="ListProductServlet">Product
				List</a>
		</nav>
	</header>
	<h3>Welcome to healthy hair admin Dashboard</h3>
</body>
</html>
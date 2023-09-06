<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.healthyhair.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Header</title>
</head>
<style>
.navbar {
	background-color: #343a40; /* Dark background color */
	color: #ffffff; /* Text color */
}

.navbar-brand {
	font-size: 24px;
	font-weight: bold;
	color: #ffffff;
}

.navbar-toggler {
	background-color: #ffffff;
}

.nav-link {
	color: #ffffff;
	text-decoration: none;
	margin-right: 20px;
}

.nav-link:hover {
	color: #ffffff;
	text-decoration: underline;
}
</style>
<body>
	<nav class="navbar bg-dark navbar-expand-lg bg-body-tertiary"
		data-bs-theme="dark">
		<div class="container-fluid">
			<a class="navbar-brand">Healthy Hair</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp">Home</a></li>

					<%
					User user = (User) session.getAttribute("User");
					if (user == null) {
					%>
					<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
					<li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
					<%
					} else {
					%>
					<li class="nav-item"><a class="nav-link" href="account.jsp">Account</a></li>
					<li class="nav-item"><a class="nav-link" href="LogOutServlet">Logout</a></li>
					<%
					}
					%>
					<%
					if (user == null || user.getType().equals("buyer")) {
					%>
					<li class="nav-item"><a class="nav-link"
						href="ListProductServlet">Products</a></li>
					<%
					} else {
					%>
					<li class="nav-item"><a class="nav-link"
						href="createProduct.jsp">Add Products</a></li>
					<li class="nav-item"><a class="nav-link"
						href="ListProductServlet">Products</a></li>
					
					<%
					}
					%>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>
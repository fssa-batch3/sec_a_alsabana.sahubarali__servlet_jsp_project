<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.healthyhair.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Seller Account</title>
</head>
<style>
/* Reset default margin and padding */
body, h1, h2, ul, li, p, button {
	margin: 0;
	padding: 0;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
}

.container {
	margin: 20px auto;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

.profile-pic {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	margin-bottom: 10px;
}

.profile h1 {
	margin: 5px 0;
	font-size: 24px;
	color: #333;
}

.profile p {
	margin: 0;
	font-size: 16px;
	color: #777;
}

.edit-btn {
	background-color: #333;
	color: #fff;
	border: none;
	padding: 8px 16px;
	border-radius: 5px;
	cursor: pointer;
}

.details h2 {
	font-size: 20px;
	color: #333;
}

ul {
	list-style: none;
	padding: 0;
}

ul li {
	margin-bottom: 10px;
	font-size: 16px;
	color: #555;
}

.actions {
	text-align: center;
	margin-top: 20px;
}

.add-product-btn {
	background-color: #333;
	color: #fff;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
}
</style>
<body>
	<%
	User user = (User) session.getAttribute("User");
	%>
	<div class="container">
		<div class="profile">
			<img
				src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhG_cZjxXIlwfsjseD7-LMSMzWI7txguoSLjCbwM85&s"
				alt="Profile Picture" class="profile-pic" />
			<h1><%=user.getUsername()%></h1>
			<p><%=user.getEmail()%></p>
			<p>company name</p>
			<button class="edit-btn">Edit Profile</button>
		</div>

		<a href="ListUserServlet">All User List</a>

		<div class="actions">
			<a href="createProduct.jsp">
				<button class="add-product-btn">Add Product</button>
			</a>
		</div>
		<div>
			<h2>
				<a href="ListEditServlet">Product Lists</a>
			</h2>



		</div>
	</div>
</body>
</html>
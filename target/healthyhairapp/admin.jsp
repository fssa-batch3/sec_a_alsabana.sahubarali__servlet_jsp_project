<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

<title>Admin</title>
</head>
<style>
/* Sidebar Styles */
nav {
	background-color: #333; 
	color: #fff; 
	width: 230px;
	position: fixed;
	top: 0;
	left: 0;
	height: 100%; 
	overflow-x: hidden; 
	padding-top: 20px; 
	cursor: pointer; 

/* Logo and Brand Name Styles */
.nav_logo {
	display: flex;
	justify-content: center; /* Center align items horizontally */
	align-items: center; /* Center align items vertically */
	margin-bottom: 30px; /* Space below the logo and brand name */
}

.nav_logo img {
	border-radius: 50%; /* Rounded corners for the logo */
	width: 50px;
	height: 50px;
}

.nav_logo h2 {
	margin-left: 10px; /* Space between logo and brand name */
}

/* Navigation Link Styles */
nav a {
	text-decoration: none;
	font-size: 18px; /* Font size for links */
	color: #fff; /* Text color for links */
	display: block; /* Display as block to occupy full width */
	padding: 10px 20px; /* Padding for each link */
	transition: background-color 0.3s;
	/* Smooth background color transition on hover */
}

nav a:hover {
	background-color: #555; /* Background color on hover */
	color: #f1f1f1; /* Text color on hover */
}

/* Icon Styles */
nav i {
	margin-right: 10px; /* Space between icon and link text */
}

/* Logout Link Styles */
.help_div {
	border-top: 1px solid #555; /* Separator line above logout link */
	margin-top: 30px; /* Space above the logout link */
}

.help_div a {
	text-decoration: none;
	font-size: 18px;
	color: #fff;
	display: block;
	padding: 10px 20px;
	transition: background-color 0.3s;
}

.help_div a:hover {
	background-color: #555;
	color: #f1f1f1;
}
</style>
<body>
	<nav>
		<div class="nav_logo">
			<div>
				<img src="./assets/images/new logo.png" alt="logo" width="50"
					height="60" />
			</div>
			<div>
				<h2>Healthy Hair</h2>
			</div>
		</div>
		<div class="dashboard">
			<a href="../Pages/adPanel.html">
				<h3>
					<i class="fa fa-dashboard"></i> Dashboard
				</h3>
			</a>
		</div>
		<div>
			<a href="./admin.html">
				<h3 id="dash">
					<i class="fa fa-product-hunt"></i> Products
				</h3>
			</a>
		</div>
		<div>
			<a href="../Pages/customer.html"><h3>
					<i class="fa fa-users"></i> Customers
				</h3></a>
		</div>
		<div>
			<a href="../Pages/seller.html"><h3>
					<i class="fa fa-users"></i> Seller
				</h3></a>
		</div>
		<div class="help_div">
			<div>
				<a href="/index.html">
					<h3>
						<i class="fa fa-sign-out"></i>Log out
					</h3>
				</a>
			</div>
		</div>
	</nav>
</body>
</html>

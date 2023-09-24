<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.healthyhair.model.User"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./assets/CSS/navbar.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
<link rel="stylesheet"
	href="https://fontawesome.com/icons/filter-list?f=sharp&s=regular&pc=%230d0d0d">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.css" />

<meta charset="ISO-8859-1">
<title>Nav bar</title>
</head>
<style>
/* Style for the dropdown menu container */
.dropdown-menu {
	margin-top: 5%;
	margin-left: 58%;
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 200px; /* Adjust the width as needed */
	z-index: 1;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
}

.dropdown-container {
	position: relative;
	display: inline-block;
	cursor: pointer; /* Add a pointer cursor to indicate interactivity */
}
/* Style for the list items in the dropdown menu */
.dropdown-menu ul {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

.dropdown-menu li {
	padding: 15px;
	text-align: center;
}

.dropdown-menu a {
	text-decoration: none;
	color: #333;
	display: block;
	transition: background-color 0.3s;
}

/* Hover effect for dropdown menu items */
.dropdown-menu a:hover {
	background-color: #ddd;
	font-size: 19px;
}

/* Show the dropdown menu on hover */
.dropdown-container:hover .dropdown-menu {
	display: block;
}
</style>
<body>
	<div class="navbar">
		<img class="image-1" src="./assets/images/new logo.png" width="100"
			height="100" alt="image" />
		<button class="navbar-btn">
			<span></span> <span></span> <span></span>
		</button>
		<%
		User user = (User) session.getAttribute("User");
		if (user == null) {
		%>
		<nav class="navbar-item hide">
			<ul class="menu-items">
				<li><a href="index.jsp">Home</a></li>
				<li><a href="ListProductServlet?category=all"
					class="dropdown-container"> Product</a></li>

				<li><a href="#"><i class="fas fa-shopping-cart"
						style="font-size: 20px"></i>Cart </a></li>
				<li><a href="#"><i class="fa fa-filter"></i> Filter</a></li>
				<li id="login_btn"><a href="#">Login </a></li>

			</ul>
		</nav>
		<%
		} else {
		%>

		<nav class="navbar-item hide">
			<ul class="menu-items">
				<li><a href="index.jsp">Home</a></li>
				<li><a href="ListProductServlet?category=all">Product</a></li>
				<li><a href="#"><i class="fas fa-shopping-cart"
						style="font-size: 20px;"></i>Cart </a></li>
				<li><a href="ListOrderServlet"> <i class="fas fa-user"
						style="font-size: 22px;"></i> Account
				</a></li>

			</ul>
		</nav>
		<%
		}
		%>

	</div>
	<div>
		<div class="dropdown-menu">
			<ul>
				<li><a href="ListProductServlet?category=sample">Sample
						Products</a></li>
				<li><a href="ListProductServlet?category=ayurvedic">Ayurvedic
						Range</a></li>

				<li><a href="#">Caffeine Range</a></li>
				<li><a href="ListProductServlet?category=avacado">Avocado,Biotin
						range</a></li>
			</ul>
		</div>
	</div>
	<script src="https://smtpjs.com/v3/smtp.js"></script>
	<script src="assets/js/loginPop.js"></script>


	<script>
		const dropdowncontainer = document.querySelector(".dropdown-container");

		const dropdownMenu = document.querySelector(".dropdown-menu");
		let timeoutId;
		dropdowncontainer.addEventListener("mouseover", function() {
			clearTimeout(timeoutId);
			dropdownMenu.style.display = "block";
		});

		dropdownMenu.addEventListener("mouseover", function() {
			clearTimeout(timeoutId);
			dropdownMenu.style.display = "block";
		});
		dropdowncontainer.addEventListener("mouseout", function() {
			timeoutId = setTimeout(function() {
				dropdownMenu.style.display = "none";
			}, 500); // Set a 500ms (half-second) delay before hiding the dropdown
		});
		dropdownMenu.addEventListener("mouseout", function() {
			dropdownMenu.style.display = "none";
		});
	</script>
</body>
</html>
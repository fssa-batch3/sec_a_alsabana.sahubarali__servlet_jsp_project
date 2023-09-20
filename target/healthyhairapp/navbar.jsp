<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="com.fssa.healthyhair.model.User"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./assets/CSS/style.css" />
 <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.css"
    />
    
<meta charset="ISO-8859-1">
<title>Nav bar</title>
</head>
<body>
	<div class="navbar" >
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
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a>Hair analysis</a></li>
				<li class="box" id="product_drop" onclick="dropdown()"><a
					href="ListProductServlet">Products</a></li>
				<li id="login_btn"><a href="">Login</a></li>
				<li class="profile"><a href="./Pages/acc.html"> <img
						src="./assets/images/account profile.jpg" id="show_profile"
						class="pro_img" width="40" height="40" alt="account logo" /></a></li>
			</ul>
		</nav>
		<%} else { %>

		<nav class="navbar-item hide">
			<ul>
				<li><a href="index.jsp">Home</a></li>
					<li><a>Hair analysis</a></li>
				<li class="dropdown"><a href="ListProductServlet">Products</a></li>
				<li class="box count"><span
					class="bi bi-cart4"></span>Cart</li>
				<li><a href="ListOrderServlet" class="bi bi-person-circle">
						Account </a></li>
			</ul>
	</nav>
	<%} %>

	</div>

	 <script src="https://smtpjs.com/v3/smtp.js"></script>
    <script src="assets/js/loginPop.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/suryaumapathy2812/notify__js/notify.js"></script>
</body>
</html>
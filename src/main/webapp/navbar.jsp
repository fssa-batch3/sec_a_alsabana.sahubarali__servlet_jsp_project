<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./assets/CSS/style.css" />

<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="navbar">
		<img class="image-1" src="./assets/images/new logo.png" width="100"
			height="100" alt="image" />
		<button class="navbar-btn">
			<span></span> <span></span> <span></span>
		</button>

		<nav class="navbar-item hide">
			<ul>
				<li><a href="./index.html">Home</a></li>
				<li class="box" id="product_drop" onclick="dropdown()"><a
					href="ListProductServlet">Products</a></li>
				<li id="login_btn" onclick="openpopup()"><a>Login</a></li>
				<li class="profile"><a href="./Pages/acc.html"> <img
						src="./assets/images/account profile.jpg" id="show_profile"
						class="pro_img" width="40" height="40" alt="account logo" /></a></li>
			</ul>
		</nav>
	</div>
	<script>
	<%
	User user = (User) session.getAttribute("User");
	if (user == null) {
	%>
	let before_login = `<nav class="navbar-item hide">
		<ul>
		<input type="text" id="search_input" name="search" placeholder="Search..">

		  <li><a href="../index.html">Home</a></li>
		  <li><a href="../Pages/analysis.html">Hair Analysis</a></li>
		  <li class="dropdown"><a href="../Pages/Product.html">Products</a></li>
		  <li class="box count" onclick="open_popup()">
		     <span class="bi bi-cart4"></span>Cart
		  </li>
		</ul>
		</div>
		</nav>`;

		let after_login = `<nav class="navbar-item hide">
		<ul>
		<input type="text" id="search_input" name="search" placeholder="Search..">

		  <li><a href="../index.html">Home</a></li>
		  <li><a href="../Pages/analysis.html">Hair Analysis</a></li>
		  <li class="dropdown"><a href="../Pages/Product.html">Products</a></li>
		  <li class="box count" onclick="open_popup()">
		     <span class="bi bi-cart4"></span>Cart
		  </li>
		  <li>
		    <a href="../Pages/acc.html"
		     class="bi bi-person-circle" >
		  Account  </a>
		  </li>
		</ul>
		</div>
		</nav>`;

		let header = document.getElementById("js_header");
		let login_id = JSON.parse(localStorage.getItem("login"));
		if (login_id == null) {
		  header.innerHTML = before_login;
		} else {
		  header.innerHTML = after_login;
		}

		const searchbar = document.getElementById("search_input");
		const cards = document.getElementsByClassName("listing-1");
		searchbar.addEventListener("input", () => {
		  for (const element of cards) {
		    if (
		      element.innerHTML.toLowerCase().includes(searchbar.value.toLowerCase())
		    ) {
		      element.style.display = "flex";
		    } else {
		      element.style.display = "none";
		    }
		  }
		});

	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.healthyhair.model.User"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="assets/CSS/acc.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<script src="https://kit.fontawesome.com/bba3432f3f.js"
	crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<%
	User user = (User) session.getAttribute("User");
	%>

	<div class="whole">
		<div class="personal-info">
			<div class="fst-container">
				<div>
					<div class="profile">
						<img src="./assets/images/account profile.jpg" alt="user_image"
							id="user_img">
					</div>
					<p>
						Hello,
						<%=user.getUsername()%></p>
					<h3 id="user_name"></h3>
				</div>
			</div>
			<!-- personal info -->
			<div class="first-container">
				<div class="personal-container">
					<h3>Personal information:</h3>
					<form class="form edit" id="proform">
						<label>Image Url: <input class="url" id="image"
							type="text" placeholder="upload image" />
						</label> <label>Name :<input type="text" id="username"
							value=<%=user.getUsername()%> placeholder="your name">
						</label> <label>Email: <input type="email"
							value=<%=user.getEmail()%> id="email"
							placeholder="alsabana@gmail.com">
						</label> <label>Number: <input type="text"
							value=<%=user.getNumber()%> id="phNo" placeholder="8090177736">
						</label> <label> Address: <textarea type="text" id="country"><%=user.getAddress()%></textarea>
						</label>
						<button type="submit">SAVE</button>
						<button id="delete">Account delete</button>

					</form>
					<div class="customer_details">
						<h4>
							Name : <span id="detail_name"><%=user.getUsername()%></span>
						</h4>
						<h4>
							Number : <span id="detail_no"><%=user.getNumber()%></span>
						</h4>
						<h4>
							Email : <span id="detail_email"><%=user.getEmail()%></span>
						</h4>
						<h4>
							Address : <span id="detail_address"><%=user.getAddress()%></span>
						</h4>
						<button onclick="change()" id="click_edit">Edit</button>
						<div>
							<h3 id="logOut">
								<i class="fa-solid fa-sign-out-alt"></i><a href="LogOutServlet">Log
									out</a>
							</h3>
						</div>
					</div>
				</div>






				<div class="scnd-container">
					<div>
						<h3> <i class="fa fa-list"></i> Your Order Details</h3>
					</div>

					<!-- Order Card -->
					<div class="order-card">
						<img src="./assets/images/Almond-2.png" alt="Product Image"
							class="product-image" />
						<div class="order-details">
							<h2 class="product-name">Product Name</h2>
							<p class="order-id">Order ID: 12345</p>
							<p class="order-date">Order Date: September 15, 2023</p>
							<p class="order-total">Total: Rs. 999.99</p>
							<button class="cancel-button">Cancel Order</button>
						</div>
					</div>

					<!--  
					<div class="no-order">
						<h3>You haven't ordered yet</h3>
						<button>Explore now!</button>
					</div>
					-->
				</div>
			</div>
		</div>
	</div>
</body>

<script src="assets/js/payment.js"></script>
<script src="assets/js/acc.js"></script>
<script src="assets/js/cart.js"></script>
</body>
</html>
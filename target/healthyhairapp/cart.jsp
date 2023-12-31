<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.healthyhair.model.Cart"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Shopping Cart</title>
</head>
<style>
/* Reset some default styles */
body, h1, h2, p, ul, li {
	margin: 0;
	padding: 0;
}

/* Style the header */
header {
	background-color: white;
	color: black;
	padding: 10px;
	text-align: center;
	margin-top: 9%;
}

/* Style the main container */
main {
	display: flex;
	justify-content: space-between;
	padding: 20px;
}

/* Style the cart container on the left */
.cart {
	flex: 1;
	background-color: #f9f9f9;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
	margin-right: 10px;
}

/* Style the product card */
.product-card {
	display: flex;
	border: 1px solid #ccc;
	padding: 10px;
	margin-bottom: 10px;
	background-color: #fff;
	border-radius: 5px;
}

.product-image img {
	width: 160px;
	height: 160px;
	height: auto;
	margin-right: 10px;
}

.product-details {
	flex: 1;
	padding-left: 35px;
}

.product-title {
	font-size: 18px;
	font-weight: bold;
	text-decoration: none;
	color: #333;
}

.product-price .discounted-price {
	font-size: 20px;
	color: #e53935;
	font-weight: bold;
}

/* Style the quantity control container */
.quantity-control {
	display: flex;
	align-items: center;
	justify-content: space-between;
	max-width: 120px;
	border: 1px solid #ccc;
	padding: 5px;
	border-radius: 5px;
}

.decrement-button, .increment-button {
	width: 30px;
	height: 30px;
	background-color: #090909;
	color: #fff;
	border: none;
	cursor: pointer;
	font-size: 18px;
	font-weight: bold;
	display: flex;
	align-items: center;
	justify-content: center;
}

.quantity-input {
	flex: 1;
	text-align: center;
}

.quantity-value {
	width: 100%;
	border: none;
	outline: none;
	font-size: 16px;
	padding: 5px;
}

div {
	padding: 10px;
}

.increment-button {
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
}

/* Style the subtotal container on the right */
.subtotal {
	flex: 0 0 30%;
	background-color: #fff;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.subtotal h2 {
	font-size: 18px;
	margin-bottom: 10px;
}

.subtotal p {
	font-size: 16px;
	color: #333;
}

.checkout-button {
	background-color: #0c0c0c;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
}

/* Style the Remove button */
.product-details>div p {
	cursor: pointer;
	color: #e53935;
	text-align: right;
}

.product-details>div p:hover {
	text-decoration: underline;
}

.price-details {
	background-color: #f9f9f9;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.price-details .title {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 10px;
	color: black;
}

.item {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
}

.label {
	flex: 1;
	font-size: 16px;
}

.value {
	font-size: 16px;
	font-weight: bold;
}

.total {
	margin-top: 10px;
	display: flex;
	justify-content: flex-end;
}

.placeOrder {
	display: flex;
	justify-content: flex-end;
}

.placeOrder button {
	width: 200px;
	height: 40px;
	background-color: #090909;
	color: white;
	border-radius: 10px;
}

.removeItem a {
	color: red;
	text-style: none;
}

.emptycart {
	display: flex;
	justify-content: center;
}
</style>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<%
	List<Cart> cartList = (List<Cart>) session.getAttribute("cartProduct");
	%>
	<header>
		<h1>Your Cart Items</h1>
	</header>
	<%
	if (cartList != null) {
	%>
	<main>
		<section class="cart">
			<%
			int count = 0;
			int cost = 0;
			int costQuan = 0;
			int total = 0;
			for (Cart cart : cartList) {
				count++;

				int cost1 = cart.getCartProduct().getCost();
				int quantity = cart.getQuantity();
				total = cost1 * quantity;
				cost += total;
			%>
			<div class="product-card">
				<div class="product-image">
					<a href="#"> <img
						src=<%=cart.getCartProduct().getProductImg()%> />
					</a>
				</div>

				<div class="product-details">
					<a class="product-title" href="#"><%=cart.getCartProduct().getProductName()%></a>

					<div class="product-price">
						<span class="discounted-price">Rs. <%=total%></span>
					</div>
					<div class="quantity-control">
						<input type="text" disabled class="quantity-value"
							value=<%=cart.getQuantity()%> />

					</div>
					<div class="removeItem">
						<p>
							<a href="DeleteCartItemServlet?cartId=<%=cart.getCartId()%>">
								Remove</a>
						</p>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</section>
		<section class="subtotal">
			<div class="price-details">
				<span class="title">Price details</span>
				<div class="item">
					<div class="label">
						Price (<%=count%>
						items)
					</div>
					<div class="value">
						Rs.<%=total%></div>
				</div>

				<div class="total">
					<div class="label">Total Amount</div>
					<div class="value">
						Rs.<%=total%></div>
				</div>

				<button class="checkout-button">Proceed to Checkout</button>

			</div>
		</section>
	</main>
	<%
	}
	%>
	<%
	if (cartList == null) {
	%>
	<div class="emptycart">
		<img
			src="https://www.99fashionbrands.com/wp-content/uploads/2020/12/empty_cart.png "
			width="650" height="600">
	</div>
	<%
	}
	%>
</body>
</html>

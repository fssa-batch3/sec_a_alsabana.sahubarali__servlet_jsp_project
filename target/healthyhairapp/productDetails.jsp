<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Product details</title>
</head>
<style>
.card {
	display: flex;
	margin-top: 8%;
	margin-left: 8%;
}

.left {
	margin-left: 50px;
}

.left img {
	width: 366px;
	height: 80%;
	margin-inline: 32px;
	margin-top: 30px;
}

.card .img img {
	width: 74px;
	margin-left: 15px;
	cursor: pointer;
}

.card .right {
	margin-top: 11px;
}

.right h3 {
	margin-top: 11px;
	color: gray;
}

.right h1 {
	margin-top: 11px;
}

.right i {
	margin-top: 11px;
	color: green;
}

.right h4 {
	margin-top: 11px;
}

.right p {
	margin-top: 11px;
	width: 800px;
}

.right button {
	width: 200px;
	height: 50px;
	background-color: rgb(255, 106, 0);
	color: white;
	font-size: 25px;
	border: none;
	margin-top: 22px;
	margin-inline: 22px;
	font-weight: 600;
	margin-left: 1px;
}

.right button:hover {
	background-color: rgb(255, 136, 0);
	cursor: pointer;
}
</style>
<body>
	<%
	String sellerId = request.getParameter("sellerId");
	%>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="card">
		<div class="left">
			<img src=${sessionScope.product.productImg } id="imgs" alt="image" />
		</div>
		<div class="right">
			<h3 id="range">${sessionScope.product.category}product</h3>
			<h1 id="pro_name">${sessionScope.product.productName}</h1>
			<h1 id="pro_cost">Rs.${sessionScope.product.cost}</h1>
			<i class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i> <i
				class="fa-solid fa-star"></i> <i class="fa-solid fa-star"></i> <i
				class="fa-solid fa-star-half-stroke"></i>
			<h3>Product Description :</h3>
			<p id="description">${sessionScope.product.productDetail}</p>

			<h4>Available Offer's</h4>
			<p>: Special PriceGet extra 11% off (price inclusive of
				cashback/coupon)</p>
			<p>: Partner OfferPurchase now & get a surprise cashback coupon
				for May / June 2023</p>
			<p>: Partner OfferSign up for healthy hair Pay Later and get
				Healthy hair Gift Card worth up to ₹1000*</p>
			<p>: Bank Offer5% Cashback on healthy hair Axis Bank</p>
			<a
				href="orderDetails.jsp?productId=${sessionScope.product.productId}&sellerId=<%=sellerId %>"
				id="buy">
				<button>Buy Now</button>
			</a>

		</div>
	</div>
</body>
</html>
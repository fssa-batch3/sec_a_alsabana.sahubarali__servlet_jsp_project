<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fssa.healthyhair.model.Product"%>
<%@ page import="com.fssa.healthyhair.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List Product</title>
</head>
<style>
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	margin-top: 50px;
	text-align: center;
	font-family: arial;
	font-size: 18px;
	width: 350px;
	height: 420px;
}

.parent_div img {
	width: 350px;
	height: 280px;
}

.parent_div {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
}

.price {
	color: black;
	font-size: 22px;
}

.card button {
	border: none;
	outline: 0;
	padding: 10px;
	color: white;
	background-color: #000;
	text-align: center;
	cursor: pointer;
	font-size: 18px;
	color: white;
	background-color: #000;
	text-align: center;
	cursor: pointer;
	height: 50px;
}

.product_list {
	text-align: center;
	margin-top: 10%;
}
</style>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>

	<%
	@SuppressWarnings("unchecked")

	List<Product> productList = (List<Product>) request.getAttribute("products");

	User user = (User) request.getSession().getAttribute("User");
	%>
	<div class="product_list">
		<h1>Product Lists</h1>
	</div>

	<div class="parent_div">
		<%
		for (Product product : productList) {
		%>
		<div class="card">
			<a
				href="ProductDetailServlet?productId=<%=product.getProductId()%>&sellerId=<%=product.getCreatedUser().getUserId()%>">
				<img src="<%=product.getProductImg()%>"
				alt="<%=product.getProductName()%>">
			</a>

			<h3><%=product.getProductName()%></h3>
			<p class="price">
				RS.
				<%=product.getCost()%></p>
			<p>
				<button>
					<i class="fas fa-shopping-cart"></i> Add to cart
				</button>
			</p>
		</div>
		<%
		}
		%>

	</div>
</body>
</html>
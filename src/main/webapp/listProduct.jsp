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
	height: 450px;
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
	width: 350px;
}

.product_list {
	text-align: center;
}

.long {
	margin-top: 73px;
}

.head-4 {
	margin-top: 6%;
}
</style>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<br>
	<br>
	<%
	@SuppressWarnings("unchecked")

	List<Product> productList = (List<Product>) request.getAttribute("products");

	User user = (User) request.getSession().getAttribute("User");
	String category = (String) request.getAttribute("category");
	%>
	<%
	if (category.equalsIgnoreCase("ayurvedic")) {
	%>
	<div style="margin-top: 70px;" class="long">
		<img src="./assets/images/3 gif.webp" width=1500 alt="image"
			class="long-img" />
	</div>
	<div class="product_list">
		<h2>Ayurvedic Range</h2>
	</div>
	<%
	} else if (category.equalsIgnoreCase("avocado")) {
	%>
	<div class="head-4">
		<img src="./assets/images/long3.webp" width="1500px" height="350px"
			alt="image" class="lng-img" />
	</div>
	<div class="product_list">
		<h2>Macadamia Nut, Avocado, Biotin Range</h2>
	</div>
	<%
	} else if (category.equalsIgnoreCase("all")) {
	%>

	<div class=head-4>
		<img src="./assets/images/big images1.jpg" width="1500px" alt="image"
			class="lng-img" />
	</div>
	<div class="product_list">
		<h2>List of all our products</h2>
	</div>

	<%
	} else if (category.equalsIgnoreCase("sample")) {
	%>

	<div class=head-4>
		<img
			src="./assets/images/Beige and Brown Aesthetic Minimalist Batik Skincare Products Presentations.jpg"
			width="1500px" height="600px" alt="image" class="lng-img" />
	</div>
	<div class="product_list">
		<h2>our sample products</h2>
	</div>
	<%
	}
	%>

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
				<a href="CreateCartServlet?productId=<%=product.getProductId()%>">
					<button>
						<i class="fas fa-shopping-cart"></i> Add to cart
					</button>
				</a>
			</p>
		</div>
		<%
		}
		%>

	</div>
</body>
</html>
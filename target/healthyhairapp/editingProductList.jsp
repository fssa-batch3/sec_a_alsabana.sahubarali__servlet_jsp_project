<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fssa.healthyhair.model.Product"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	margin-top: 50px;
	text-align: center;
	font-family: arial;
	font-size: 18px;
	width: 300px;
	height: 350px;
}

img {
	width: 300px;
	height: 200px;
}

.parent_div {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
}

.price {
	color: grey;
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
}

.product_list {
	text-align: center;
}

.card button:hover {
	opacity: 0.7;
}
</style>
<body>
	
	<%
	@SuppressWarnings("unchecked")

	List<Product> productList = (List<Product>) request.getAttribute("products");
	%>
	<div class="product_list">
		<h1>Product Lists</h1>
	</div>

	<div class="parent_div">
		<%
		for (Product product : productList) {
		%>
		<div class="card">
			<a href="ProductDetailServlet?productId=<%=product.getProductId()%>">
				<img src="<%=product.getProductImg()%>"
				alt="<%=product.getProductName()%>">
			</a>

			<h2><%=product.getProductName()%></h2>
			<p class="price">
				RS.
				<%=product.getCost()%></p>
			<p>
				<button>Edit</button>
				<a href="DeleteProductServlet?productId=<%=product.getProductId()%>">
					<button>Delete</button>
				</a>
			</p>
		</div>
		<%
		}
		%>

	</div>
</body>
</html>
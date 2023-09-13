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
	color: white;
	background-color: #000;
	text-align: center;
	cursor: pointer;
}

.product_list {
	text-align: center;
}

.card button:hover {
	opacity: 0.7;
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
			<a href="ProductDetailServlet?productId=<%=product.getProductId()%>">
				<img src="<%=product.getProductImg()%>"
				alt="<%=product.getProductName()%>">
			</a>

			<h5><%=product.getProductName()%></h5>
			<p class="price">
				RS.
				<%=product.getCost()%></p>

			<%
			if (user == null) {
			%>

			<p>
				<button>Buy Now</button>
				<button>Sample</button>
			</p>
			<%
			} else if ("buyer".equals(user.getType())) {
			%>
			<p>

				<button>Add to cart</button>
				
			</p>
			<%
			} else if ("seller".equalsIgnoreCase(user.getType())) {
			%>
			<%
			if (product.getCreatedUser().getUserId() == user.getUserId()) {
			%>
			<p>
				<a href="EditProductServlet?productId=<%=product.getProductId()%>"><button>Edit</button></a>
				<a href="DeleteProductServlet?productId=<%=product.getProductId()%>">
					<button>Delete</button>
				</a>
			</p>

			<%
			}
			}
			%>

		</div>
		<%
		}
		%>

	</div>
</body>
</html>
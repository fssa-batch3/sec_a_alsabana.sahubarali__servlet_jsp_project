<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.healthyhair.model.Product"%>
<%@ page import="com.fssa.healthyhair.model.User"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
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
	margin-left: 20%;
}

.price {
	color: grey;
	font-size: 22px;
	padding: 10px;
}

.card button {
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
	width: 90px;
	margin-left: 10px;
	border-radius: 20px;
}

.product_list {
	text-align: center;
	margin-top: 20px;
}

.card button:hover {
	opacity: 0.7;
}
</style>
<body>
	<jsp:include page="sellerNav.jsp"></jsp:include>
	<%
	@SuppressWarnings("unchecked")
	List<Product> productList = (List<Product>) request.getAttribute("matchedProduct");
	%>
	<div class="product_list">
		<h1>Product List</h1>

		<%
		if (productList == null || productList.isEmpty()) {
		%>
		<div class="error">
		<img src="https://cdni.iconscout.com/illustration/premium/thumb/product-is-empty-8044872-6430781.png?f=webp">
		<h2>Your list is empty please add products</h2>
		</div>
		<%
		}
		%>
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

			<h3><%=product.getProductName()%></h3>
			<p class="price">
				RS.
				<%=product.getCost()%></p>
			<p>
				<a href="EditProductServlet?productId=<%=product.getProductId()%>"><button>Edit</button></a>
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
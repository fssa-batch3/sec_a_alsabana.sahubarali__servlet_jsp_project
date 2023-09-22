<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.healthyhair.model.Product"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Product</title>
</head>
<style>
body {
	font-family: "Poppins", sans-serif;
	background-color: #f4f4f4;
}

.container {
	position: absolute;
	width: 700px;
	margin-left: 35%;
	margin-top: 90px;
	padding: 20px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-heading {
	text-align: center;
	font-size: 28px;
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	font-size: 18px;
	margin-bottom: 10px;
}

input[type="text"], input[type="number"], textarea, select {
	width: 100%;
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

select {
	height: 40px;
}

button[type="submit"] {
	width: 100%;
	padding: 15px;
	font-size: 18px;
	color: black;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	background-color: grey;
}

button[type="submit"]:hover {
	background-color: black;
	color: white;
}

error {
	color: red;
	font-size: 16px;
	margin-top: 10px;
	margin-left:10%;
}
.required{
color:red;
}
]</style>
<body>
	<jsp:include page="sellerNav.jsp"></jsp:include>
	<%
	String errorMessage = (String) request.getAttribute("errorMessage");
	Product product = (Product) request.getAttribute("updateProduct");
	%>

	<div class="container">

		
		<div class="form-heading">Update Product</div>
		<%
		if (errorMessage != null) {
		%>
		<error><%=errorMessage%></error>

		<%
		}
		if (product != null) {
		%>
		<form id="update-form" action="EditProductServlet" method="post">
			<div>
				<input type="text" style="display: none"
					value=<%=product.getProductId()%> name="productId" />
			</div>
			<div class="form-group">
				<label for="pName">Product name<span class="required">*</span>:</label>
				<textarea id="pName" name="productName" required
					placeholder="Enter product name"><%=product.getProductName()%></textarea>
			</div>
			<div class="form-group">
				<label for="pPrice">Product price<span class="required">*</span>:</label> <input type="number"
					min="1" id="pPrice" name="productCost" value=<%=product.getCost()%>
					required placeholder="Enter price of the product" />
			</div>
			<div class="form-group">
				<label for="pImage">Image URL<span class="required">*</span>:</label> <input type="text"
					id="pImage" name="productURL" value=<%=product.getProductImg()%>
					required placeholder="Paste your product URL" />
			</div>
			<div class="form-group">
				<label for="product_detail">Product Details<span class="required">*</span>:</label>
				<textarea id="product_detail" name="productDetail" required
					placeholder="Enter more details about the product"><%=product.getProductDetail()%></textarea>
			</div>
			<div class="form-group">
				<label for="product_type">Category<span class="required">*</span>:</label> <select
					id="product_type" name="category">
					<option value="Ayurvedic Range">Ayurvedic Range</option>
					<option value="Caffeine Range">Caffeine Range</option>
					<option value="Samples">Our Samples</option>
					<option value="Avocado Range">Avocado, Biotin Range</option>
					<option value="Capsules">Hair serum and capsules</option>
				</select>
			</div>
			<button type="submit">SAVE</button>

		</form>



		<%
		}
		%>


	</div>
</body>
</html>
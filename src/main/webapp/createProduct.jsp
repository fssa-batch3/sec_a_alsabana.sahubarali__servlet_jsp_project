<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

.error-message {
	color: red;
	font-size: 16px;
	margin-top: 10px;
	text-align:center;
}
.required {
	color: red;
}

</style>
<body>
	<div class="container">
		<jsp:include page="sellerNav.jsp"></jsp:include>
		<%
		String errorMessage = (String) request.getParameter("errorMessage");
		%>

		<div class="form-heading">ADD A NEW PRODUCT</div>
		<%
		if (errorMessage != null) {
		%>
		<div class="error-message"><%=errorMessage%></div>
		<%
		}
		%>
		<form id="update-form" action="CreateProductServlet" method="post">
			<div class="form-group">
				<label for="pName">Product name<span class="required">*</span>:</label> <input type="text" value="${productName}"
					id="pName" name="productName" required
					placeholder="Enter product name" />
			</div>
			<div class="form-group">
				<label for="pPrice">Product price<span class="required">*</span>:</label> <input type="number"
					min="1" id="pPrice" name="productCost" required value="${productCost}"
					placeholder="Enter price of the product" />
			</div>
			<div class="form-group">
				<label for="pImage">Image URL<span class="required">*</span>:</label> <input type="text"
					id="pImage" name="productURL" required  value="${productImage}"
					placeholder="Paste your product URL" />
			</div>
			<div class="form-group">
				<label for="product_detail">Product Details<span class="required">*</span>:</label>
				<textarea id="product_detail" name="productDetail" required
					placeholder="Enter more details about the product">${productDetail}</textarea>
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
			<button type="submit">ADD PRODUCT</button>

		</form>
	</div>
</body>
</html>
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
	font-size: 23px;
	font-family: "Poppins", sans-serif;
	background-color: rgb(41, 37, 37);
	color: white;
}

.parent-div {
	justify-content: center;
	display: flex;
	font-size: larger;
}

.parent {
	margin-top: 20px;
	padding: 10%;
	border-radius: 5px;
	justify-content: center;
}

.whole {
	display: flex;
	justify-content: center;
	font-size: 20px;
}

form {
	margin-top: 50px;
}

form input, textarea {
	width: 450px;
	height: 30px;
	display: flex;
	padding: 10px;
	flex-direction: column;
	border-radius: 10px;
}

select {
	width: 470px;
	height: 50px;
	display: flex;
	padding: 10px;
	flex-direction: column;
	border-radius: 10px;
	margin-top: 10px;
}

button {
	width: 250px;
	height: 50px;
	margin-top: 30px;
	margin-left: 25%;
	border-radius: 20px;
	/* background-color: black;
  color: white; */
}

p {
	text-align: center;
	color: red;
}
</style>
<body>
	<%
	String errorMessage = (String) request.getAttribute("errorMessage");
	Product product = (Product) request.getAttribute("updateProduct");
	%>
	<div class="parent">

		<div class="parent-div">UPDATE PRODUCT</div>
		<%
		if (errorMessage != null)
			out.println("<p>" + errorMessage + "</p>");
		%>
		<div class="whole">
			<form id="update-form"
				action="EditProductServlet?productId=<%=product.getProductId()%>"
				method="post">
				<input type="text" style="display: none"
					value=<%=product.getProductId()%> name="productId" required /> 
					
					<label>Product
					name : </label> 
					
					<input type="textarea" id="pName" name="productName"
					value=<%=product.getProductName()%> required
					title="Please enter product name" /> 
					
					
					<label>Product price : </label>
					
					<input type="number" id="pPrice" value=<%=product.getCost()%>
					name="productCost" required title="Enter price of the product" />
					
					
				 <label>Image :<input type="text" id="pImage"
					value=<%=product.getProductImg()%> name="productURL" required
					title="please paste your product url" /></label> <label>product_details
					: <textarea type="text" id="product_detail"
						title="Please enter more detail about product"
						name="productDetail" required><%=product.getProductDetail()%></textarea>
				</label> <label>Category : <select id="product_type" name="category">
						<option value="Ayurvedic Range">Ayurvedic Range</option>
						<option value="Caffeine Range">Caffeine Range</option>
						<option value="Samples">Our Samples</option>
						<option value="Avocado Range">Avocado, Biotin Range</option>
						<option value="Capsules">Hair serum and capsules</option>
				</select>
				</label>
				<button type="submit">Update</button>

			</form>
		</div>
	</div>
</body>
</html>
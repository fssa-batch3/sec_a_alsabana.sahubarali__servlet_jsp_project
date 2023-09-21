<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.healthyhair.model.Order"%>
<%@  page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>HTML TABLE-7</title>
</head>
<style>
.order {
	margin-top: 20px;
	margin-left: 20%;
}

.text {
	margin-left: 40%;
}

th, td {
	padding: 10px;
}
</style>
<body>
	<%
	List<Order> order = (List<Order>) session.getAttribute("Salesorder");
	%>
	<jsp:include page="sellerNav.jsp"></jsp:include>
	<h1 class="text">Customer Order Details</h1>
	<div class="order">

		<table border="1" cellpadding="8" style="border-collapse: collapse">
			<tr>
				<th rowspan="11">HHO</th>
				<th>Order no:</th>
				<td colspan="3">#ABC001</td>
			</tr>
			<tr>
				<th>Order Date:</th>
				<td colspan="3">23-Mar-2016</td>
			</tr>
			<tr>
				<th colspan="4">Customer</th>
			</tr>
			<tr>
				<th>Name:</th>
				<td colspan="3">John Papas</td>
			</tr>
			<tr>
				<th>Address:</th>
				<td colspan="3">Independence Day 5th str,1151</td>
			</tr>
			<tr>
				<th colspan="4">Order Details</th>
			</tr>
			<tr>
				<td>ProductId</td>
				<td>Product Name</td>
				<td>Quantity</td>
				<td>Price</td>
			</tr>
			<tr>
				<td>23</td>
				<td>ayurveda Name</td>
				<td>4</td>
				<td>Rs.432</td>
			</tr>

			<tr>
				<th colspan="3">Total:</th>
				<td>$272</td>
			</tr>
		</table>
	</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Order Form</title>
<style>
/* Basic CSS for styling the form */
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
}

.container {
	max-width: 600px;
	padding: 20px;
	background-color: #ffffff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-top: 150px;
	margin-left: 30%;
}

.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	font-weight: bold;
}

input[type="text"], input[type="email"], input[type="number"], select {
	width: 95%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.btn-submit {
	background-color: #101010;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.payment, .quantity {
	display: flex;
}

.price {
	margin-left: 50px;
	margin-top: 5px;
}

.details {
	text-align: center;
}

#card_detail {
	display: none;
}

</style>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="container">
		<img id="closeSign" src="./assets/images/exits image.png" width="35"
			height="35" />
		<h2 class="details">Order Details</h2>
		<form action="createOrder" method="POST">

			<!-- Order Details -->
			<div class="quantity">
				<div class="form-group">
					<label for="quantity">Quantity:</label> <input type="number"
						id="quantity" min="1" name="quantity" onKeyUp="multiply()" required />
				</div>
				<div class="price">
					<p>Total Amount : Rs.<span id="amount">${sessionScope.product.cost}</span></p>
				</div>
			</div>
			<!-- Address Details -->
			<div class="form-group">
				<label for="address">Address:</label> <input type="text"
					id="address" name="address" required />
			</div>
			<div class="form-group">
				<label for="address">Pincode:</label> <input type="text"
					id="address" name="pincode" required />
			</div>
			<div class="form-group">
				<label for="city">City:</label> <input type="text" id="city"
					name="city" required />
			</div>
			<div class="form-group">
				<label for="zipcode">Mobile number:</label> <input type="text"
					id="zipcode" name="mobile" required />
			</div>

			<!-- Payment Details -->
			<div class="payment">
				<div>
					<label id="cash_on_delivery"> <input type="radio"
						name="payment" value="cash-on-delivery" /> Cash on Delivery
					</label><br />
				</div>
				<div>
					<label id="click_payment"> <input type="radio"
						name="payment" value="online-payment" /> Online Payment
					</label><br />
				</div>
			</div>
			<div id="card_detail">
				<div class="form-group">
					<label for="cardnumber">Credit Card Number:</label> <input
						type="text" id="cardnumber" name="cardnumber" required />
				</div>
				<div class="form-group">
					<label for="expiration">Expiration Date:</label> <input type="text"
						id="expiration" name="expiration" placeholder="MM/YY" required />
				</div>
			</div>

			<button type="submit" class="btn-submit">Submit Order</button>
		</form>
	</div>
	<script>

	const click_payment = document.getElementById("click_payment");
	const payment = document.getElementById("card_detail");
	const cash_on_delivery = document.getElementById("cash_on_delivery");
	click_payment.addEventListener("click", (event) => {
			payment.style.display="block";
		
		 });
	cash_on_delivery.addEventListener("click", (event) => {
		   payment.style.display="none";
		 });
	
	function multiply(){
		let qty = Number(document.getElementById("quantity").value);
		let amt = Number(document.getElementById("amount").value);
		
		const total = qty*amt;
		 document.getElementById('amount').value=total;
	}
	</script>
</body>
</html>

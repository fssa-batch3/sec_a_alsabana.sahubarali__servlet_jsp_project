<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../assets/CSS/ts.scss" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
	crossorigin="anonymous" />
<title>Checkout</title>
</head>
<style>
@import url("https://fonts.googleapis.com/css?family=Arimo");

body {
	display: flex;
	justify-content: center;
}

.wrapper {
	margin-top: 10%;
	width: 60%;
	display: flex;
	justify-content: center;
	font-family: "Arimo";
	background-color: #b5b2b1;
	box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px,
		rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px
		-2px 6px 0px inset;
	-webkit-box-shadow: 9px 13px 25px 0px rgba(0, 0, 0, 0.18);
	-moz-box-shadow: 9px 13px 25px 0px rgba(0, 0, 0, 0.18);
	animation: slideUp 2000ms ease;
}

.container {
	width: 65%;
	padding: 5% 10%;
}

h1 {
	align-self: center;
}

form input {
	width: 100%;
	min-height: 35px;
	border: 0;
	font-size: 1rem;
	margin-top: 5px;
	margin-bottom: 5px;
	border-radius: 4px; label { text-transform : uppercase;
	font-size: 12px;
	letter-spacing: 2px;
}

}
.name {
	justify-content: space-between;
	display: flex;
	width: 100%;
	height: 40%;
}

.address-info {
	display: flex;
	justify-content: space-between;
}

.cc-info {
	display: flex;
	justify-content: space-between;
}

.btns button {
	width: 200px;
	height: 40px;
	margin-top: 20px;
	font-size: 18px;
	background-color: #161616;
	color: white;
	padding: 5px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

label {
	padding-bottom: 10px;
	padding-top: 10px;
}

.radio-group label {
	display: flex;
	align-items: center;
	cursor: pointer;
	margin-top: 5px;
	font-size: 20px;
	color: #161616;
}

.radio-group i {
	margin-right: 0px;
}

.radio-group input[type="radio"] {
	width: 20px;
}

#card_detail {
	display: none;
}

.price {
	text-align: end;
	font-size: 23px;
}

.error p {
	color: brown;
	font-size: 23px;
	text-align: center;
}
</style>
<body>
	<%
	String error = request.getParameter("errorMessage");
	String sellerId = request.getParameter("sellerId");
	%>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="wrapper">
		<div class="container">
			<form action="createOrderServlet" method="POST">
				<h2>
					<i class="fas fa-shipping-fast"></i> Shipping Details
				</h2>
				<div class="form-group" style="display: none">
					<label for="id">id:</label> <input type="number"
						value="${sessionScope.product.productId}" min="1" name="productId"
						required />
				</div>
				<div class="form-group" style="display: none">
					<label for="id">id:</label> <input type="number"
						value="<%=sellerId%>" min="1" name="sellerId" required />
				</div>
				<%
				if (error != null) {
				%>
				<div class="error">
					<p><%=error%></p>
				</div>
				<%
				}
				%>

				<div class="name">

					<div>
						<label for="f-name">Name:</label> <input type="text" name="name"
							placeholder="Enter your name" pattern="[A-Za-z]{4,30}"
							title="Username cannot contains spaces and numbers less than 4 characters maximum 30."
							value="${name}" required />
					</div>
					<div>
						<label>Quantity:</label> <input type="number" id="quantityInput"
							min="1" value="1" name="quantity" required />
					</div>
				</div>
				<div class="street">
					<label for="name">Street :</label> <input type="text"
						name="address" value="${address}"
						title="Street name not be in null"
						placeholder="Enter your delivered Street" required />
				</div>
				<div class="address-info">
					<div>
						<label for="city">City :</label> <input type="text"
							title="City name not be in null" placeholder="Enter your city"
							value="${city}" name="city" required />
					</div>

					<div>
						<label for="zip">Pincode:</label> <input type="text"
							title="Pincode should be in 6 digits and start with 6."
							value="${pincode}" name="pincode" 
							placeholder="Enter your pincode" required />
					</div>
				</div>
				<div>
					<label>Mobile number:</label> <input type="text" value="${number}"
						title="Mobile number contains 10 digits only" autocomplete="off"
						placeholder="Enter your mobile number" pattern="[0-9]{1,10}"
						name="mobile" required />
				</div>
				<!-- Payment Method -->
				<div class="payment-method">
					<h2>
						<i class="far fa-credit-card"></i> Payment Method
					</h2>
					<div class="radio-group">

						<label required id="cash_on_delivery" for="cash-on-delivery"> <input
							type="radio" id="cash-on-delivery" name="payment" value="false" />
							<i class="fas fa-money-bill"></i> Cash on Delivery
						</label> 
						


					</div>
				</div>
				<div id="card_detail">
					<h2>
						<i class="far fa-credit-card"></i> Payment Information
					</h2>
					<div class="cc-num">
						<label for="card-num">Card Number:</label> <input
							placeholder="Enter your Credit\Debit card number" maxlength=12
							type="text" maxlength="3" name="card-num" />
					</div>
					<div class="cc-info">
						<div>
							<label for="card-num">Expired Date :</label> <input type="text"
								placeholder="MM/YY" name="expire" />
						</div>
						<div>
							<label for="card-num">CVV :</label> <input type="password"
								maxlength="3" placeholder="Enter your cvv" name="security" />
						</div>
					</div>
				</div>
				<div class="price">
					<p>
						Total Amount : Rs.<span id="amount">${sessionScope.product.cost}</span>
					</p>
				</div>
				<div class="btns">
					<button type="submit" class="btn-submit">Submit Order</button>
				</div>
			</form>
		</div>
	</div>

	<script>
      const click_payment = document.getElementById("click_payment");
      const payment = document.getElementById("card_detail");
      const cash_on_delivery = document.getElementById("cash_on_delivery");
      click_payment.addEventListener("click", (event) => {
        payment.style.display = "block";
      });
      cash_on_delivery.addEventListener("click", (event) => {
        payment.style.display = "none";
      });

    
     
      const quantityInput = document.getElementById('quantityInput');
      const amountSpan = document.getElementById('amount');

      const initialProductCost = parseFloat("${sessionScope.product.cost}");

    
      function updateTotalAmount() {
   
        const quantity = parseInt(quantityInput.value);

      
        const totalAmount = initialProductCost * quantity;

     
        amountSpan.textContent = totalAmount.toFixed(2); 
      }

      quantityInput.addEventListener('input', updateTotalAmount);

      updateTotalAmount();
      
      
      
    </script>
</body>
</html>

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
<title>Document</title>
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
	background-color: #9a9594;
	-webkit-box-shadow: 9px 13px 25px 0px rgba(0, 0, 0, 0.18);
	-moz-box-shadow: 9px 13px 25px 0px rgba(0, 0, 0, 0.18);
	box-shadow: 9px 13px 25px 0px rgba(0, 0, 0, 0.18);
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
	letter-spacing: 0.15rem;
	font-family: "Arimo";
	margin-top: 5px;
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
	width: 30px;
}

#card_detail {
	display: none;
}

.price {
	text-align: end;
	font-size: 23px;
}
</style>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="wrapper">
		<div class="container">
			<form action="createOrderServlet" method="POST">
				<h1>
					<i class="fas fa-shipping-fast"></i> Shipping Details
				</h1>
				<div class="form-group" style="display: none">
					<label for="id">id:</label> <input type="number"
						value="${sessionScope.product.productId}" min="1" name="productId"
						required />
				</div>
				<div class="name">
					<div>
						<label for="f-name">Name:</label> <input type="text" name="name"
							placeholder="Enter your name" required />
					</div>
					<div>
						<label>Quantity:</label> <input type="number" id="quantityInput"
							min="1" value="1" name="quantity" required />
					</div>
				</div>
				<div class="street">
					<label for="name">Street :</label> <input type="text"
						name="address" placeholder="Enter your delivered Street" required />
				</div>
				<div class="address-info">
					<div>
						<label for="city">City :</label> <input type="text"
							placeholder="Enter your city" name="city" required />
					</div>

					<div>
						<label for="zip">Pincode:</label> <input type="text"
							name="pincode" placeholder="Enter your pincode" required />
					</div>
				</div>
				<div>
					<label>Mobile number:</label> <input type="number"
						placeholder="Enter your number" name="mobile" required />
				</div>
				<!-- Payment Method -->
				<div class="payment-method">
					<h1>
						<i class="far fa-credit-card"></i> Payment Method
					</h1>
					<div class="radio-group">
						<label id="cash_on_delivery" for="cash-on-delivery"> <input
							type="radio"  id="cash-on-delivery" value="cash" />
							<i class="fas fa-money-bill"></i> Cash on Delivery
						</label> <label id="click_payment" for="online-payment"> <input
							type="radio" name="payment" id="online-payment" value="true" />
							<i class="fas fa-credit-card"></i> Online Payment
						</label>
					</div>
				</div>
				<div id="card_detail">
					<h1>
						<i class="far fa-credit-card"></i> Payment Information
					</h1>
					<div class="cc-num">
						<label for="card-num">Card Number:</label> <input placeholder="Enter your Credit\Debit card number"
							type="text" name="card-num" />
					</div>
					<div class="cc-info">
						<div>
							<label for="card-num">Expired Date :</label> <input type="text" placeholder="MM/YY"
								name="expire" />
						</div>
						<div>
							<label for="card-num">CVV :</label> <input type="password" placeholder="Enter your cvv"
								name="security" />
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

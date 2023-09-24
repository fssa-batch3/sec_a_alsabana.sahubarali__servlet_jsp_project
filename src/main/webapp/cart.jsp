<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Shopping Cart</title>
  </head>
  <style>
    /* Reset some default styles */
    body,
    h1,
    h2,
    p,
    ul,
    li {
      margin: 0;
      padding: 0;
    }

    /* Style the header */
    header {
      background-color:white;
      color:black;
      padding: 10px;
      text-align: center;
      margin-top:8%;
    }

    /* Style the main container */
    main {
      display: flex;
      justify-content: space-between;
      padding: 20px;
    }

    /* Style the cart container on the left */
    .cart {
      flex: 1;
      background-color: #f9f9f9;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 5px;
      margin-right: 10px;
    }

    /* Style the product card */
    .product-card {
      display: flex;
      border: 1px solid #ccc;
      padding: 10px;
      margin-bottom: 10px;
      background-color: #fff;
      border-radius: 5px;
    }

    .product-image img {
      width: 160px;
      height: 160px;
      height: auto;
      margin-right: 10px;
    }

    .product-details {
      flex: 1;
      padding-left: 35px;
    }

    .product-title {
      font-size: 18px;
      font-weight: bold;
      text-decoration: none;
      color: #333;
    }

    .product-price .discounted-price {
      font-size: 20px;
      color: #e53935;
      font-weight: bold;
    }

    /* Style the quantity control container */
    .quantity-control {
      display: flex;
      align-items: center;
      justify-content: space-between;
      max-width: 120px;
      border: 1px solid #ccc;
      padding: 5px;
      border-radius: 5px;
    }

    .decrement-button,
    .increment-button {
      width: 30px;
      height: 30px;
      background-color: #090909;
      color: #fff;
      border: none;
      cursor: pointer;
      font-size: 18px;
      font-weight: bold;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    .decrement-button[disabled] {
      background-color: #ccc;
      cursor: not-allowed;
    }

    .quantity-input {
      flex: 1;
      text-align: center;
    }

    .quantity-value {
      width: 100%;
      border: none;
      outline: none;
      font-size: 16px;
      padding: 5px;
    }
    div {
      padding: 10px;
    }
    .increment-button {
      border-top-right-radius: 5px;
      border-bottom-right-radius: 5px;
    }

    /* Style the subtotal container on the right */
    .subtotal {
      flex: 0 0 30%;
      background-color: #fff;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 5px;
    }

    .subtotal h2 {
      font-size: 18px;
      margin-bottom: 10px;
    }

    .subtotal p {
      font-size: 16px;
      color: #333;
    }

    .checkout-button {
      background-color: #0c0c0c;
      color: #fff;
      border: none;
      padding: 10px 20px;
      cursor: pointer;
    }

    /* Style the Remove button */
    .product-details > div p {
      cursor: pointer;
      color: #e53935;
      text-align: right;
    }

    .product-details > div p:hover {
      text-decoration: underline;
    }
    .price-details {
      background-color: #f9f9f9;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 5px;
    }

    .price-details .title {
      font-size: 18px;
      font-weight: bold;
      margin-bottom: 10px;
      color:black;
    }

    .item {
      display: flex;
      justify-content: space-between;
      margin-bottom: 10px;
    }

    .label {
      flex: 1;
      font-size: 16px;
    }

    .value {
      font-size: 16px;
      font-weight: bold;
    }

    .total {
      margin-top: 10px;
      display: flex;
      justify-content: flex-end;
    }
    .placeOrder {
      display: flex;
      justify-content: flex-end;
    }
    .placeOrder button {
      width: 200px;
      height: 40px;
      background-color: #090909;
      color: white;
      border-radius: 10px;
    }
    
  </style>
  <body>
  	<jsp:include page="navbar.jsp"></jsp:include>
    <header>
      <h1>Your Shopping Cart</h1>
    </header>
    <main>
      <section class="cart">
        <div class="product-card">
          <div class="product-image">
            <a href="#">
              <img src="./assets/images/caffeine4.webp" alt="Product Image" />
            </a>
          </div>

          <div class="product-details">
            <a
              class="product-title"
              href="#"
              >Ayurvedic product 50-ml</a
            >

            <div class="product-price">
              <span class="discounted-price">Rs.789</span>
            </div>
            <div class="quantity-control">
                 <input type="number" class="quantity-value" value="1" />
            
            </div>
            <div>
              <p>Remove</p>
            </div>
          </div>
        </div>

        <div class="placeOrder">
          <button>Place order</button>
        </div>
      </section>
      <section class="subtotal">
        <div class="price-details">
          <span class="title">Price details</span>
          <div class="item">
            <div class="label">Price (2 items)</div>
            <div class="value">Rs.6,390</div>
          </div>

          <div class="total">
            <div class="label">Total Amount</div>
            <div class="value">Rs.2,031</div>
          </div>
          <button class="checkout-button">Proceed to Checkout</button>
        </div>
      </section>
    </main>
  </body>
</html>

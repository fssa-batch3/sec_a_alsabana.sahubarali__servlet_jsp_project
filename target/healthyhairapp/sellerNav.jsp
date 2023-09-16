<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <title>side navigation bar</title>
    <script
      src="https://kit.fontawesome.com/bba3432f3f.js"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="./assets/CSS/sellerNav.css" />
  </head>

  <body>
    <div class="header">
      <div class="side-nav">
        <a href="#" class="logo">
          <img src="./assets/images/new logo.png" class="logo-img" />
        </a>
        <ul class="nav-links">
          <li >
            <a href="#">
              <i class="fa-solid fa-house-user"></i>
              <p>Dashboard</p>
            </a>
          </li>
          <li>
            <a href="SellerProductList">
              <i class="fa-solid fa-box"></i>
              <p>Products</p>
            </a>
          </li>
          <li>
            <a href="sellerAccount.jsp">
              <i class="fa-solid fa-user"></i>
              <p>Account</p>
            </a>
          </li>
          <li>
            <a href="createProduct.jsp">
              <i class="fa-solid fa-plus"></i>
              <p>Add Product</p>
            </a>
          </li>
          <li>
            <a href="contactUs.jsp">
              <i class="fa-solid fa-phone-alt"></i>
              <p>Contact us</p>
            </a>
          </li>
          <li>
            <a href="LogOutServlet">
              <i class="fa-solid fa-sign-out-alt"></i>
              <p>Logout</p>
            </a>
          </li>
          <div class="active"></div>
        </ul>
      </div>
    </div>
  </body>
</html>

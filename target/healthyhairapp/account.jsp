<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.healthyhair.model.User"%>
<%@ page import="com.fssa.healthyhair.model.Order"%>
<%@  page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="assets/CSS/acc.css" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<script src="https://kit.fontawesome.com/bba3432f3f.js"
	crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<%
	User user = (User) session.getAttribute("User");
	List<Order> order = (List<Order>) session.getAttribute("order");
	%>

	<div class="whole">
		<div class="personal-info">
			<div class="fst-container">
				<div>
					<div class="profile">
						<img src="./assets/images/account profile.jpg" alt="user_image"
							id="user_img">
					</div>
					<p>
						Hello,
						<%=user.getUsername()%></p>
					<h3 id="user_name"></h3>
				</div>
			</div>

			<!-- personal info -->
			<div class="first-container">
				<div class="personal-container">
					<h3>Personal information:</h3>
					<form class="form edit"
						action="EditBuyerServlet?userId=<%=user.getUserId()%>" method="post"
						id="proform">
						<label>Image Url: <input class="url" id="image"
							type="text" placeholder="upload image" />
						</label> <label>Name :<input type="text" id="username" name="name"
							value=<%=user.getUsername()%> placeholder="your name">
						</label> <label>Email: <input name="email" type="email"
							value=<%=user.getEmail()%> id="email"
							placeholder="alsabana@gmail.com">
						</label> <label>Number: <input type="text" name="number"
							value=<%=user.getNumber()%> id="phNo" placeholder="8090177736">
						</label>
						<button type="submit">SAVE</button>
						<button id="delete">Account delete</button>

					</form>
					<div class="customer_details">
						<h4>
							Name : <span id="detail_name"><%=user.getUsername()%></span>
						</h4>
						<h4>
							Number : <span id="detail_no"><%=user.getNumber()%></span>
						</h4>
						<h4>
							Email : <span id="detail_email"><%=user.getEmail()%></span>
						</h4>

						<button onclick="change()" id="click_edit">Edit</button>

						<div>
							<h3 id="logOut">
								<i class="fa-solid fa-sign-out-alt"></i><a href="LogOutServlet">Log
									out</a>
							</h3>
						</div>
					</div>
				</div>




				<%
				if (order != null) {
				%>

				<div class="scnd-container">
					<div>
						<h3>
							<i class="fa fa-list"></i> Your Order Details
						</h3>
					</div>

					<%
					for (Order i : order) {
					%>
					<div class="order-card">
						<img src=<%=i.getOrderedProduct().getProductImg()%>
							alt="Product Image" class="product-image" height=200px; />
						<div class="order-details">
							<h2 class="product-name"><%=i.getOrderedProduct().getProductName()%></h2>
							<p>
								Rs.<%=i.getOrderedProduct().getCost()%></p>
							<p>
								Qty :
								<%=i.getQuantity()%></p>
							<p class="order-date">
								Order Date :
								<%=i.getDate()%></p>

						</div>
						<div class="details">
							<p>
								Expected delivery :
								<%=i.getDeliveryDate()%></p>
							<p><%=i.getAddress()%>,<%=i.getCity()%>
							</p>
							<p><%=i.getNumber()%></p>
							<p class="order-total">
								Total: Rs.
								<%=i.getOrderedProduct().getCost() * i.getQuantity()%></p>
							<a id="cancelLink"
								href="CancelOrderServlet?orderId=<%=i.getOrderId()%><%session.setAttribute("orderId", i.getOrderId());%>"><button
									id="cancel" class="cancel-button">Cancel Order</button></a>
						</div>
					</div>
					<%
					}
					%>

				</div>
				<%
				} else {
				%>
				<div class="no-order">
					<h3>You haven't ordered yet</h3>
					<button>Purchase now!</button>
				</div>

				<%
				}
				%>
			</div>
		</div>
	</div>
	<script>
	// your-script.js

	// your-script.js


  const cancelLink = document.getElementById("cancelLink");

  cancelLink.addEventListener("click", function (event) {
    event.preventDefault(); // Prevent the default link behavior

    swal({
      title: "Are you sure?",
      text: "Do you want to cancel the order?",
      icon: "warning",
      buttons: ["No", "Yes"],
    }).then((confirm) => {
      if (confirm) {
      
        fetch(`/healthyhairapp/CancelOrderServlet`, {
          method: "GET",
        })
          .then((response) => {
            if (response.ok) {
              swal("Order cancelled!", { icon: "success" });
             setTimeout(() => {
            	 location.reload();
			}, 700); 
            } else {
           
              swal("Error cancelling order", { icon: "error" });
            }
          })
          .catch((error) => {
            // Handle network errors here
            swal("Network error", { icon: "error" });
          });
      } else {
        // User clicked "No," do nothing or handle accordingly
      }
    });
  });

	</script>

</body>

<script src="assets/js/payment.js"></script>
<script src="assets/js/acc.js"></script>
<script src="assets/js/cart.js"></script>
</body>
</html>
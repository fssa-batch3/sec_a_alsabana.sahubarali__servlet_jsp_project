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
		<div class="container">
			<div class="row gutters">
				<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
					<div class="card h-100">
						<div class="card-body">
							<div class="account-settings">
								<div class="user-profile">
									<div class="user-avatar">
										<img src="https://bootdey.com/img/Content/avatar/avatar7.png"
											alt="Maxwell Admin">
									</div>
									<h5 class="user-name">Yuki Hayashi</h5>

								</div>
								<div class="about">

									<h6 class="user-email">
										<span>Username : </span>Alsabana
									</h6>
									<h6 class="user-email">
										<span>email : </span>sabana@gmail.com
									</h6>
									<h6 class="user-email">
										<span>Number : </span>6789789078
									</h6>
									<h6 class="user-email">
										<span>Address : </span>s12/8palliba
									</h6>

									<div class="edit-btns">
										<div>
											<button id="edit">
												<i class="fa-solid fa-pen"></i> Edit profile
											</button>
										</div>
										<div>
											<button>
												<i class="fa-solid fa-sign-out-alt"></i> Logout
											</button>
										</div>

									</div>
									<br>

									<div class="form">
										<h5 class="user-name">
											<i class="fa-regular fa-pen-to-square"></i> Edit your account
										</h5>
										<div class="form-group">
											<label for="username">Profile:</label> <input type="text"
												id="username">
										</div>
										<div class="form-group">
											<label for="username">Username:</label> <input type="text"
												id="username">
										</div>
										<div class="form-group">
											<label for="email">Email:</label> <input type="text"
												id="email">
										</div>
										<div class="form-group">
											<label for="number">Number:</label> <input type="text"
												id="number">
										</div>
										<div class="form-group">
											<label for="address">Address:</label> <input type="text"
												id="address">
										</div>
										<div class="delete-account">
											<div>
												<a id="delete"><i id="delete" class="fas fa-trash-alt"></i>
													Delete my account</a>
											</div>
											<div class="save-btn">
												<button class="save">
													<i class="fa-regular fa-floppy-disk"></i> Save
												</button>
											</div>
										</div>
									</div>


								</div>
							</div>
						</div>
					</div>
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

	<script>
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

  
  const edit = document.getElementById("edit");
  const editBtns = document.querySelector(".edit-btns");
  const form = document.querySelector(".form");
  const save = document.querySelector(".save");
  edit.addEventListener("click", function(e) {
    editBtns.style.display = "none";
    form.style.display = "block";
  });

	</script>
</body>

<script src="assets/js/payment.js"></script>
<script src="assets/js/acc.js"></script>
<script src="assets/js/cart.js"></script>
</body>
</html>
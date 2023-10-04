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
<style>
error {
	color: red;
}
</style>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<%
	User user = (User) session.getAttribute("User");
	List<Order> order = (List<Order>) session.getAttribute("order");
    String button =(String) session.getAttribute("button");
	if (order == null) {

	}
	%>

	<div class="whole">
		<div class="container">
			<h3>My Account</h3>
			<div class="row gutters">
				<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
					<div class="card h-100">
						<div class="card-body">
							<div class="account-settings">
								<div class="user-profile">
									<%
									if (user.getProfileUrl() == null) {
									%>
									<div class="user-avatar">
										<img src="https://bootdey.com/img/Content/avatar/avatar7.png"
											alt="Maxwell Admin">
									</div>
									<%
									} else {
									%>
									<div class="user-avatar">
										<img src=<%=user.getProfileUrl()%> alt="Maxwell Admin">
									</div>
									<%
									}
									%>
									<h5 class="user-name">
										Hello!<%=user.getUsername()%></h5>

								</div>
								<div class="about">

									<h6 class="user-email">
										<span>Username : </span><%=user.getUsername()%>
									</h6>
									<h6 class="user-email">
										<span>email : </span><%=user.getEmail()%>
									</h6>
									<h6 class="user-email">
										<span>Number : </span><%=user.getNumber()%>
									</h6>


									<div class="edit-btns">
										<div>
											<button id="edit">
												<i class="fa-solid fa-pen"></i> Edit profile
											</button>
										</div>
										<div>
											<a href="LogOutServlet">
												<button>
													<i class="fa-solid fa-sign-out-alt"></i> Logout
												</button>
											</a>
										</div>

									</div>
									<br>

									<div class="form">
										<form action="EditBuyerServlet?userId=<%=user.getUserId()%>"
											method="post">
											<%
											String error = request.getParameter("errorMessage");
											if (error != null) {
												out.println("<error>" + error + "</error>");
											%>
											<script> 
				                      const form1 = document.querySelector('.form');
		                         		form1.style.display="block";
		                     		</script>
											<%
											}
											%>
											<h5 class="user-name">
												<i class="fa-regular fa-pen-to-square"></i> Edit your
												account
											</h5>
											<div class="form-group">
												<label for="username">Profile:</label> <input type="text"
													name="image" value=<%=user.getProfileUrl()%> id="username">
											</div>
											<div class="form-group">
												<label for="username">Username:</label> <input type="text"
													name="name" value=<%=user.getUsername()%> id="username">
											</div>
											<div class="form-group">
												<label for="email">Email:</label> <input type="text"
													readonly value=<%=user.getEmail()%> name="email" id="email">
											</div>
											<div class="form-group">
												<label for="number">Number:</label> <input type="text"
													value=<%=user.getNumber()%> name="number" id="number">
											</div>

											<div class="delete-account">
												<div>
													<a href="DeleteUserAccountServlet" id="delete"><i
														id="delete" class="fas fa-trash-alt"></i> Delete my
														account</a>
												</div>
												<div class="save-btn">
													<button class="save">
														<i class="fa-regular fa-floppy-disk"></i> Save
													</button>
												</div>
											</div>
										</form>
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
				<%
				if (order == null || order.isEmpty()) {
				%>
				<div class="error">
					<img
						src="https://cdni.iconscout.com/illustration/premium/thumb/product-is-empty-8044872-6430781.png?f=webp">
					<h2>Your Order list is empty please purchase now!</h2>
					
				</div>
				<%
				}
				%>
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
					<% if(button==null){ %>
					<a id="cancelLink"
						href="CancelOrderServlet?orderId=<%=i.getOrderId()%><%session.setAttribute("orderId", i.getOrderId());%>"><button
							id="cancel" class="cancel-button">Cancel Order</button></a>
							<%} else{ %>
							<a 
						href="#"><button
							id="cancel" class="cancel-button">Cancelled</button></a>
							<%} %>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<%
		} 
		%>
	
	</div>

	<script>
	const editBtns = document.querySelector(".edit-btns");
	  const form = document.querySelector(".form");
	  const save = document.querySelector(".save");
	  const edit = document.querySelector("#edit");
		 edit.addEventListener("click", function(e) {
			 console.log("click");
			    editBtns.style.display = "none";
			    form.style.display = "block";
			  });
	  save.addEventListener("click", function(e) {
		    editBtns.style.display = "block";
		    form.style.display = "none";
		    location.reload();
		  });
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


</body>
</html>
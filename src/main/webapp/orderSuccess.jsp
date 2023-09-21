<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.fssa.healthyhair.model.Order"%>
<%@ page import="com.fssa.healthyhair.model.Product"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

</head>
<style>
.continue_shopping {
	margin-right: 23%;
	margin-left: 25%;
}

.continue_shopping button {
	background-color: #62cbab;
	color: black;
	height: 50px;
	border: none;
	border-radius: 10px;
}
.continue_shopping button:hover{
     background-color:black;
     color:white;
}
.card-stepper {
	z-index: 0;
	background-color: #f3fefc;
	 box-shadow: 0px 0px 15px  #62cbab;}
</style>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>
	<br>
	<br>
	<br>
	<%
	Order order = (Order) session.getAttribute("order");
	Product orderProduct = (Product) session.getAttribute("orderProduct");
	Timestamp orderDate = new Timestamp(System.currentTimeMillis());
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String formattedDate = dateFormat.format(orderDate);

	Calendar calendar = Calendar.getInstance();
	calendar.add(Calendar.DAY_OF_MONTH, 7);

	String after7 = dateFormat.format(calendar.getTime());
	%>

	<section class="vh-100 gradient-custom-2">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-md-10 col-lg-8 col-xl-6">
					<div class="card card-stepper" style="border-radius: 16px">
						<br>
						<div class="mb-4 text-center">
							<svg xmlns="http://www.w3.org/2000/svg" class="text-success"
								width="75" height="75" fill="currentColor"
								class="bi bi-check-circle-fill" viewBox="0 0 16 16">
                    <path
									d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
                </svg>
						</div>
						<div class="text-center">
							<h1>Thank You !</h1>
							<p>Your Order has been successfully placed!</p>
						</div>
						<div class="card-header p-4">

							<div class="d-flex justify-content-between align-items-center">

								<div>
									<div>
										<h4 class="bold">Order Details</h4>
										<p class="text-muted mb-2">
											Order ID : <span class="fw-bold text-body">6543</span>
										</p>

									</div>
									<p class="text-muted mb-0">
										Place On : <span class="fw-bold text-body"><%=formattedDate%></span>
									</p>

								</div>
								<div>
									<p class="text-muted mb-0">
										Name :<span class="fw-bold text-body">alsabana</span>
									</p>
									<p class="text-muted mb-0">
										Mobile no: <span class="fw-bold text-body"><%=order.getNumber()%></span>
									</p>
									<p class="text-muted mb-0">
										Address:<span class="fw-bold text-body"><%=order.getAddress()%>,<br>
											<%=order.getPincode()%>.</span>
									</p>
								</div>
							</div>
						</div>
						<div class="card-body p-4">
							<div class="d-flex flex-row mb-4 pb-2">
								<div class="flex-fill">
									<h6 class="bold">
										<span class="text-muted">Product Name : </span><%=orderProduct.getProductName()%></h6>
									<p class="text-muted">
										Quantity&nbsp;:&nbsp;<%=order.getQuantity()%>&nbsp;item
									</p>
									<p class="mb-3">
										<span class="text-muted">Cost : </span>Rs.<%=orderProduct.getCost() * order.getQuantity()%>
									</p>
								</div>
								<div>
									<img class="align-self-center img-fluid"
										src=<%=orderProduct.getProductImg()%> width="150" height="150" />
								</div>
							</div>
							<div class="continue_shopping">
								<a href="ListProductServlet"><button>Continue
										shopping&#128525;</button></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>

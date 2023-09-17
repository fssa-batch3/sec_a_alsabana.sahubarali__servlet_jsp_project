<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	background-color: black;
	color: white;
	height: 50px;
	border: none;
	border-radius: 10px;
}

.card-stepper {
      z-index: 0;
     background-color: #f3fefc;
    }
</style>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>
	<br>
	<br>
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
							<p>Your details has been successfully submitted.Thanks!
							</p>
						</div>
						<div class="card-header p-4">

							<div class="d-flex justify-content-between align-items-center">

								<div>
									<p class="text-muted mb-2">
										Order ID <span class="fw-bold text-body">1222528743</span>
									</p>
									<p class="text-muted mb-0">
										Place On <span class="fw-bold text-body">12,March 2019</span>
									</p>
								</div>
								<div class="text-muted mb-0">
									<p>
										Delivered by <span class="fw-bold text-body">12,March
											2019</span>
									</p>
								</div>
							</div>
						</div>
						<div class="card-body p-4">
							<div class="d-flex flex-row mb-4 pb-2">
								<div class="flex-fill">
									<h5 class="bold">Headphones Bose 35 II</h5>
									<p class="text-muted">Qt: 1 item</p>
									<h4 class="mb-3">Rs. 299</h4>
									<div>
										<h4 class="bold">Order Details</h4>
										<p class="text-muted mb-0">
											Name :<span class="fw-bold text-body">alsabana</span>
										</p>
										<p class="text-muted mb-0">
											Mobile no: <span class="fw-bold text-body">8015059760</span>
										</p>
										<p class="text-muted mb-0">
											Address:<span class="fw-bold text-body">chennai,12/3
												chinmayanagar,623525</span>
										</p>
									</div>
								</div>
								<div>
									<img class="align-self-center img-fluid"
										src="./assets/images/caffeine2.webp" width="250" />
								</div>
							</div>
							<div class="continue_shopping">
								<button>Continue shopping&#128525;</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</section>
</body>
</html>

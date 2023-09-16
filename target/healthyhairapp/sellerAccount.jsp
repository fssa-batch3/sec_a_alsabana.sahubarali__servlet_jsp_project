<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.healthyhair.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" />
<title>Seller Profile</title>
<style>
body {
	font-family: "Poppins", sans-serif;
	background-color: #f4f4f4;
}

.container {
	position: absolute;
	width: 700px;
	margin-left: 35%;
	margin-top: 90px;
	padding: 20px;
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	display: none;
}

.form-heading {
	text-align: center;
	font-size: 28px;
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	font-size: 18px;
	margin-bottom: 10px;
}

input[type="text"], input[type="email"], textarea, select {
	width: 100%;
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

select {
	height: 40px;
}

button[type="submit"] {
	width: 100%;
	padding: 15px;
	font-size: 18px;
	color: black;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	background-color: grey;
}

button[type="submit"]:hover {
	background-color: black;
	color: white;
}

.required {
	color: red;
}

.error-message {
	color: red;
	font-size: 16px;
	margin-top: 10px;
}

/* Style the seller info section */
.seller-profile {
	text-align: left;
	margin-left: 40%;
}

.seller-info {
	margin-top: 30px;
}

.seller-info img {
	max-width: 200px;
	border: 2px solid #333;
	border-radius: 50%;
}

section {
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	display: flex;
	justify-content: center;
	margin-top: 14%;
	margin-right: 23%;
	padding: 20px;
	;
}

section h2 {
	margin-top: 5%;
}

section div {
	padding: 10px;
}

section p {
	font-size: 22px;
}

button {
	width: 100px;
	height: 40px;
	background-color: grey;
	color: black;
	border: none;
	border-radius: 5px;
}

button:hover {
	background-color: black;
	color: white;
}

.name_div {
	margin-left: -20%;
	text-align: center;
}

.name_div h2 {
	margin-right: -150%;
}
.error{
color:red;
text-align:center;
font-size:23px;
}
</style>
</head>
<body>
	<%
	User user = (User) session.getAttribute("User");
	String errorMessage = (String) request.getParameter("errorMessage");
	%>
	<jsp:include page="sellerNav.jsp"></jsp:include>
	<section class="seller-profile">
		<div class="name_div">
			<h2>
				Hello ,
				<%=user.getUsername()%>
				!
			</h2>

		</div>

		<div class="seller-info">

			<div>
				<div>
					<p>
						Name :
						<%=user.getUsername()%></p>
				</div>
				<div>
					<p>
						Email:
						<%=user.getEmail()%></p>
				</div>
				<div>
					<p>
						Phone Number:
						<%=user.getNumber()%></p>
				</div>
				<div>
					<p>Company Name:</p>
				</div>
				<div>
					<p>Company Address:</p>
				</div>
				<%
				String error = request.getParameter("errorMessage");
				if (error != null)
					out.println("<error>" + error + "</error>");
				%>

			</div>
			<button id="edit">Edit</button>

			<a href="DeleteUserAccountServlet?userId=<%=user.getUserId()%>"><button>Delete
					Account</button></a>
		</div>
	</section>
	<div class="container">
		<div class="exit">
			<img id="closeSign" src="./assets/images/exits image.png" width="35"
				height="35" />
		</div>
		<div class="form-heading">Edit Account</div>
		<%
		if (errorMessage != null) {

			out.println("<p>" + errorMessage + "</p>");
		%>
		<script> 
		const div = document.querySelector('.seller-profile');
		div.style.display="none";
		const divElement = document.querySelector('.container');
		divElement.style.display="block";
		</script>
		<%
		}
		%>

		<form id="update-form"
			action="EditUserServlet?userId=<%=user.getUserId()%>" method="post">
			<div class="form-group">
				<label for="sellerName">Seller Name<span class="required">*</span>:
				</label> <input type="text" id="sellerName" value=<%=user.getUsername()%>
					name="name" required placeholder="Enter seller name" />
			</div>
			<div class="form-group">
				<label for="sellerEmail">Email<span class="required">*</span>:
				</label> <input type="email" id="sellerEmail" name="email"
					value=<%=user.getEmail()%> required placeholder="Enter email" />
			</div>
			<div class="form-group">
				<label for="sellerPhone">Phone Number<span class="required">*</span>:
				</label> <input type="text" id="sellerPhone" value=<%=user.getNumber()%>
					name="number" required placeholder="Enter phone number" />
			</div>
			<div class="form-group">
				<label for="sellerCompany">Company Name<span
					class="required">*</span>:
				</label> <input type="text" id="sellerCompany" name="companyName" required
					placeholder="Enter company name" />
			</div>
			<div class="form-group">
				<label for="sellerAddress">Company Address<span
					class="required">*</span>:
				</label>
				<textarea id="sellerAddress" name="companyAddress" required
					placeholder="Enter company address"><%=user.getAddress()%></textarea>
			</div>
			<div class="form-group">
				<label for="licenseImage">Company License Image<span
					class="required">*</span>:
				</label> <input type="text" id="licenseImage" name="licenseImage"
					accept="image/*" placeholder="Enter your licence url" required />
			</div>

			<button type="submit">SAVE</button>
		</form>
	</div>
	<script>
	 
	let edit_button = document.getElementById("edit");
	edit_button.addEventListener("click", (event) => {
		   
		   event.preventDefault();
		   let section = document.querySelector(".seller-profile");
		   section.style.display ="none";
		   let container = document.querySelector(".container");
		   container.style.display = "block";
		 });
	let closeSign = document.getElementById("closeSign");
	closeSign.addEventListener("click",(e)=>{
		 let container = document.querySelector(".container");
		   container.style.display = "none";
		   
		   let section = document.querySelector(".seller-profile");
		   section.style.display ="block";
		   let name_div = document.querySelector(".name_div");
		   name_div.style.marginRight ="70%";
	})
	</script>
</body>
</html>

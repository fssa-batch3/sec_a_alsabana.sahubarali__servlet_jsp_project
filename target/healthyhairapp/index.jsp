<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="./assets/CSS/style.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<title>Home</title>
<style>
error{
	color:red;
	margin-left:30%;
	margin-top:-50%;
}</style>
</head>
<body class="container">
	<jsp:include page="navbar.jsp"></jsp:include>
	<!-- sign up -->
       	<div class="signup-pop" id="popup">
		<div class="top">
			<h4 class="title">Sign Up</h4>
		</div>
		<div class="exit">
			<img id="closeSign" src="./assets/images/exits image.png" width="35" height="35" />
		</div>
		<div class="form" id="pop_up">
		   <%
				String error = request.getParameter("registerError");   
				if (error != null){
					out.println("<error>" + error + "</error>");
				%>
				<script> 
				const divElement = document.querySelector('.signup-pop');
				divElement.classList.add('sign-block');
				</script>
				<% }%>
			<form id="signUp" action="RegistrationServlet" method="post">
				<div class="form-input">
					<input type="text" name="name" id="username" autocomplete="off"
						pattern="[A-Za-z]{4,30}" title="Username cannot contains spaces"
						placeholder="Username" value="${username}" required="true" />
				</div>
				<div class="form-input">
					<input type="email" id="email" name="email" placeholder="Email" value="${email}"
						 required />
				</div>
				<div class="form-input">
					<input type="text" id="phone-no" name="number" value="${number}"
						placeholder="Phone No" pattern="[0-9]{1,10}" required />
				</div>
				<div class="form-input">
					<input type="password" value="${password}" id="password" placeholder="Password"
						required />
				</div>
				<div class="form-input">
					<input type="password" name="password" id="confirm-password"
					value="${password}"
						placeholder="Confirm Password" required />
				</div>
				<select class="form-input" value="${type}"name="type" id="input_type">
					<option value="">CHOOSE</option>
					<option value="buyer">Buyer</option>
					<option value="seller">Seller</option>
				</select>
				<div class="form-input">
					<button type="submit" onclick="sign()">Sign In</button>
				</div>
			</form>

		</div>
	</div>
	<!-- login page -->
	<div class="overall" id="pop">

		<div class="form">
			<div>
				<img id="close" src="./assets/images/exits image.png" width="40"
					height="40" />
			</div>

			<div class="circle">
				<img class="image" src="./assets/images/new logo.png " width="100"
					height="100" />
			</div>
			<h4 class="title">Login to Your Account</h4>
				<%
				String error1 = request.getParameter("loginError");
				if (error1 != null){
					out.println("<error>" + error1 + "</error>");
				%>
				<script> 
				const signElement = document.querySelector('.overall');
				signElement.classList.add('open-popup');
				</script>
				<%} %>
			<form id="login_form" action="LoginServlet" method="post">
			
				<div class="form-input">
					<input type="email" name="email" id="loginEmail" value="${email}"
						placeholder="Email" required />
				</div>
				<div class="form-input">
					<input type="password" id="loginPassword" name="password" value="${password}"
						placeholder="Password" required />
				</div>
				<div class="form-input">
					<button type="submit" onclick="login()">Login</button>
				</div>
			</form>
			<div class="signup">
				Don't have an account? <a id="signupOp">Sign up</a>
			</div>
		</div>
	</div>


	<div class="one">
		<img src="./assets/images/Screenshot 2022-12-02 140508.png"
			alt="image" width="1500" />
	</div>
	<div class="two">
		<div>
			<h2>Shop Our Range of Clean, Effective, and Natural Products</h2>
		</div>
		<div class="two-2">
			<h3>Good Hair is proven in providing products with haircare
				solutions for various hair concerns like growth, dandruff, hair
				fall, dryness, frizz, thin, weak, and damaged hair.</h3>
		</div>
	</div>
	<div class="three">
		<div class="three-1">
			<h2>Effective & Natural Remedy</h2>
			<p>We use no mineral-oil, silicones, parabens, or sulphates in
				our products.</p>
			<a href="./Pages/Product.html" class="btn"><button>SHOP
					NOW</button></a>
		</div>
		<div>
			<img class="three-2" src="./assets/images/image.png" width="600"
				height="700" alt="image" />
		</div>
	</div>
	<div class="four">
		<div>
			<img src="./assets/images/image1.png" height="300" alt="image"
				width="285" />
		</div>
		<div>
			<img src="./assets/images/image3.png" height="300" alt="image"
				width="285" />
		</div>
		<div>
			<img src="./assets/images/image2.png" height="300" width="285"
				alt="image" />
		</div>
	</div>
	<div class="five">
		<h2>We promise that every product is made from natural
			ingredients to address all your hair care needs.</h2>
	</div>
	<div class="six">
		<div>
			<img src="./assets/images/3 gif.webp" width="1470" alt="image" />
		</div>
	</div>
	<div class="seven">
		<div>
			<img src="./assets/images/reduces.avif" height="130 " width="130"
				alt="image" />
			<p>Reduces premature pigment loss or greying of hair</p>
		</div>
		<div>
			<img src="./assets/images/Stimulates.avif" height="130" alt="image"
				width="130" />
			<p>Stimulate hair growth</p>
		</div>
		<div>
			<img src="./assets/images/reduces hair loss.avif" height="130"
				alt="image" width="130" />
			<p>Reduces hair loss and increases hair shine</p>
		</div>
		<div>
			<img src="./assets/images/natural therapy.avif" height="130"
				width="130" alt="image" />
			<p>Natural therapy for dandruff & dry scalp</p>
		</div>
		<div>
			<img src="./assets/images/Prevents_split-end.avif" height="130"
				alt="image" width="130" />
			<p>Prevents split ends</p>
		</div>
		<div>
			<img src="./assets/images/Effective.avif" height="130" alt="image"
				width="130" />
			<p>Effective in the treatment of parasitic hair and scalp
				infection</p>
		</div>
	</div>
	<div class="eight">
		<h2>Testimonials</h2>
	</div>
	<div class="nine">
		<div>
			<p>This product comes in an attractive packaging. The price is
				very reasonable for a chemical free herbal ayurvedic blend. Has a
				very nice aroma. Best thing is it's non greasy. A scalp massage with
				this oil after a strenuous day's work is very soothing. I felt
				relief in itchiness and hair fall too. Highly recommend Good Hair
				Ayurvedic Oil.</p>
			<h5>-Prabha</h5>
		</div>
		<div>
			<p>Due to weather change I start having huge hair fall, which
				made my hair very thin. I could not do any hairstyle and would keep
				my hair tied up all the time. I started using Good Hair Ayurvedic
				Hair Oil and I must say that my hair fall has reduced by 60% within
				10 days of regular use. I can see a volume in my hairs, will
				continue using it. Highly recommended!</p>
			<h5>-Kiruba</h5>
		</div>
		<div>
			<p>Best products of hair problems. It's been a week since i am
				using Good Hair ayurvedic hair oil and shampoo and my hair fall has
				reduced drastically. Have never a product work so quickly for me, i
				am their customer for life. Thank you for giving me the perfect
				solution. Thank you Good Hair!</p>
			<h5>-Sabin</h5>
		</div>
	</div>
	<div class="about">
		<div class="ten">
			<h2>
				<button>About Us:</button>
			</h2>
		</div>
		<div class="eleven">
			<h2>Transforming Passion To Perfection</h2>
		</div>
		<div class="twelve">
			<p>Our company Pharma Culture Healths Ltd. came into existence
				out of our passion for creating safe and effective products that are
				scientifically proven to provide solutions for all common hair
				problems.</p>
		</div>
		<div class="thirdeen">
			<div>
				<img class="thirdeen-1" src="./assets/images/philosophy images.gif"
					height="350" alt="image" width="350" />
			</div>
			<div>
				<p>
					<strong>Our philosophy</strong> towards haircare is focused around
					using all-natural solutions and traditional ways to combat the
					modern lifestyle issues like unhealthy food habits, exposure to
					pollution and use of harsh products.
				</p>
				<p>With consumers becoming highly conscious about ingredients,
					we have ensured that we do not use any mineral-oil, silicones,
					parabens, or sulphates in our hair care products making them 100%
					safe for usage to all age groups.</p>
			</div>
		</div>
		<div class="fourteen">
			<h1 class="fourteen-1">Our Promises</h1>
		</div>
		<div class="fifteen">
			<p>At Healthy Hair, our vision is to produce, manufacture and
				sell effective, honest, affordable, and safe products. We have
				amalgamated the Ancient Ayurveda Methods & Natural Ingredients for
				deriving our intended goal. We are committed to develop wide range
				of chemical free products that are suitable for all hair types and
				age groups. Our proficiency lies in inventing new and powerful
				formulas that enable us to introduce innovative mixtures of herbs
				and oils that are not found in any of the products available in the
				market.</p>
		</div>
	</div>
	<div class="delivery">
		<div class="deli">
			<img src="assets/images/24 image.png" alt="image" />
			<h3>Shipping within 24 Hrs</h3>
		</div>
		<div class="deli">
			<img src="assets/images/free-delivery-1.png" alt="image" />
			<h3>Free delivery</h3>
		</div>

		<div class="deli">
			<img src="assets/images/sanitized-1.png" alt="image" />
			<h3>Sanitised Products</h3>
		</div>
	</div>

	<footer>
		<div class="fif">
			<div class="fifteen-1">
				<h2>Follow us</h2>
			</div>
			<div class="sixteen">
				<div>
					<a href="#"><img src="assets/images/new insta logo.gif"
						alt="image" height="60" width="60" /></a>
				</div>
				<div>
					<img src="assets/images/facebook new.gif" alt="image" height="60"
						width="60" />
				</div>
				<div>
					<img src="assets/images/youtube new.gif" alt="image" height="60"
						width="60" />
				</div>
			</div>
		</div>
		<div class="seventeen">
			<h2>Also Available On</h2>
		</div>

		<div class="eighteen">
			<div>
				<img src="assets/images/amazon new1.jpg" alt="image" width="60"
					height="60" />
				<p>Amazon</p>
			</div>
			<div>
				<img class="flip" src="assets/images/new flip.gif" width="60"
					height="60" alt="image" />
				<p>Flipkart</p>
			</div>
			<div>
				<img src="./assets/images/shopify new.gif" alt="image" width="60"
					height="60" />
				<p>Shopify</p>
			</div>
		</div>
		<div class="fif">
			<div class="nineteen">
				<h2>Certification</h2>
			</div>
			<div class="twenty">
				<div>
					<img src="assets/images/certi2.jpg" alt="image" height="50"
						width="50" />
				</div>
				<div>
					<img src="./assets/images/certi3.webp" alt="image" height="50"
						width="50" />
				</div>
			</div>
		</div>
		<div class="twentyone">
			<h3>Healthy hair 2022 © All rights reserved</h3>
		</div>
	</footer>


	<script src="./assets/js/login.js"></script>

</body>
</html>

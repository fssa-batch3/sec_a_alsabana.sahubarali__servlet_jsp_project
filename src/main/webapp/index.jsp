<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Healthy hair</title>
</head>
<style>
.image-1 {
	margin-top: -12px;
	border-radius: 50%;
}

.image-2 {
	border-radius: 50%;
}

.heroImage {
	width: 100%;
	height: 600px;
	margin-top: -50px;
}

.two {
	display: flex;
	margin-left: 50px;
	font-size: 15px;
	padding: 25px;
}

.two-2 h3 {
	width: 850px;
	border-left: 5px solid rgb(24, 24, 24);
	border-left-style: double;
	padding-left: 15px;
	font-size: 17px;
}

.three {
	display: flex;
	margin-left: 200px;
	font-family: "Poppins", sans-serif;
}

.three-1 {
	padding: 40px;
	font-size: 25px;
	margin-right: 100px;
	margin-bottom: 250px;
}

.three-1 button {
	width: 150px;
	height: 50px;
	background-color: black;
	color: white;
	border-radius: 10px;
	margin-bottom: 10px;
}

.three-2 {
	border-radius: 20px;
}

.four {
	display: flex;
	margin-top: -300px;
	margin-left: 15px;
}

.five h2 {
	padding: 30px;
	width: 800px;
	margin-left: 300px;
	text-align: center;
	font-size: clamp(15px, 5vw, 30px);
	font-family: "Poppins", sans-serif;
}

.seven {
	display: flex;
	background-color: #f5ebe0;
	font-size: 15px;
	font-family: "Poppins", sans-serif;
	font-weight: bold;
	color: rgba(148, 108, 56, 0.664);
	width: 1390px;
	margin-top: 20px;
	margin-left: 30px;
	margin-right: 10px;
	height: 300px;
	border-radius: 40px;
	border-style: double;
}

.seven div {
	padding: 50px;
}

.eight {
	font-size: 20px;
	font-family: "Poppins", sans-serif;
	padding: 10px;
	margin-left: 10px;
}

.nine {
	display: flex;
	margin-left: 10px;
	margin-right: 10px;
}

.nine div {
	padding: 15px;
	font-size: 15px;
	font-family: "Poppins", sans-serif;
	font-weight: bold;
	border-left: 2px solid rgb(57, 56, 56);
	border-left-style: double;
	background-color: #faf4ef;
	box-shadow: 20px 20px 15px gray;
}

.nine h5 {
	text-align: end;
	margin-right: 50px;
}

.ten {
	padding: 10px;
	margin-left: 30px;
}

.ten button {
	width: 150px;
	height: 50px;
	background-color: black;
	color: white;
	font-size: 20px;
	border-radius: 20px;
}

.about {
	font-size: 20px;
	font-family: "Poppins", sans-serif;
}

.eleven {
	text-align: center;
	font-family: "Poppins", sans-serif;
}

.twelve {
	text-align: center;
	margin-left: 400px;
	font-size: 20px;
	font-family: "Poppins", sans-serif;
	border-bottom-style: dotted;
	border-bottom-width: 600;
	margin-right: 400px;
}

.twelve p {
	width: 600px;
}

.box {
	font-size: 25px;
}

.overall {
	width: 450px;
	margin: 0 auto;
	padding: 30px 0;
	margin-bottom: 13%;
	height: 500px;
	position: absolute;
	top: 0;
	right: 5%;
	left: 50%;
	z-index: 20;
	visibility: hidden;
	transform: translate(-50%, -50%) scale(0.1);
	transition: transform 0.4s, top 0.4s;
	cursor: pointer;
}

.open-popup {
	visibility: visible;
	top: 7%;
	margin-left: 30%;
	transform: translate(-50%, -50%) scale(1);
}

.form {
	color: #434343;
	border-radius: 1px;
	margin-bottom: 15px;
	background: #fff;
	border: 1px solid #f3f3f3;
	box-shadow: 0px 2px 2px rgb(0 0 0/ 30%);
	padding: 30px;
}

.circle {
	color: #fff;
	margin: 0 auto;
	width: 100px;
	height: 100px;
	border-radius: 50%;
	background-color: white;
	padding: 10px;
	box-shadow: 0px 2px 2px rgb(0 0 0/ 10%);
}

.image {
	border-radius: 50%;
	margin-right: 10px;
}

.title {
	text-align: center;
	font-size: 20px;
}

.form-input input {
	min-height: 40px;
	border-radius: 2px;
	width: 100%;
	font-size: 1rem;
	border: 1px solid #ced4da;
	margin-bottom: 20px;
	padding: 5px;
}

button {
	background-color: #000;
	border: none;
	min-height: 40px;
	border-radius: 2px;
	padding: 0.5rem 1rem;
	font-size: 20px;
	text-align: center;
	color: #fff;
	width: 100%;
	box-shadow: 0px 2px 2px rgb(0 0 0/ 10%);
}

.signup {
	font-size: 18px;
	color: #000;
	text-align: center;
}

.signup a {
	text-decoration: none;
	color: #f278a0;
}

a {
	text-decoration: none;
}

.shopNow_btn {
	position: absolute;
	margin-left: 63%;
	margin-top: -14%;
}

.shopNow_btn a {
	color: white;
}

.shopNow_btn button {
	width: 235px;
	height: 73px;
	border-radius: 15px;
	font-weight: bold;
	font-size: 24px;
	letter-spacing: 2px;
	font-family: Arial, Helvetica, sans-serif;
}

body {
	font-family: "Poppins", sans-serif;
	overflow-x: hidden;
	margin: 0;
	padding: 0;
	user-select: none;
}

.show {
	display: flex;
	flex-direction: column;
	width: 30%;
	font-size: 22px;
	position: absolute;
	top: 115%;
	right: 20%;
	background-color: #fefefe;
}
</style>
<body>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<div class="one">
				<img
					src="https://www.keralaayurveda.biz/images/revampimages/KA-Banner.jpg"
					alt="image" width="1500" class="heroImage" />
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
					<img class="three-2"
						src="https://india.indewild.com/cdn/shop/files/CopyofIW_Webcontent_3.0_Product_MSS_03_700x700_2c3baf92-4ca8-4ca2-878d-95d21173e711.jpg?v=1692786669"
						width="600" height="400" alt="image" />
				</div>
			</div>
			<!--  <div class="four">
				<div>
					<img
						src="https://cdn.shopify.com/s/files/1/0562/8759/2623/products/6_5e982e3a-62fd-4123-a507-7c987fe265d1_x614@2x.jpg?v=1642163660"
						height="300" alt="image" width="285" />
				</div>
				<div>
					<img
						src="https://cdn11.bigcommerce.com/s-5h8rqg02f8/images/stencil/original/products/530/3806/ECOM_Hair_Care_Juice_1_1_11zon__74516.1663840956.jpg"
						height="300" alt="image" width="285" />
				</div>
				<div>
					<img
						src="https://cdn11.bigcommerce.com/s-5h8rqg02f8/images/stencil/650w/products/784/4280/2_3__69657.1660128828.jpg"
						height="300" width="285" alt="image" />
				</div>
			</div> 
			<div class="five">
				<h2>We promise that every product is made from natural
					ingredients to address all your hair care needs.</h2>
			</div>
			<div class="six">
				<div>
					<img
						src="https://cdn.shopify.com/s/files/1/0562/8759/2623/products/6_5e982e3a-62fd-4123-a507-7c987fe265d1_x614@2x.jpg?v=1642163660"
						width="1470" height="1000px" alt="image" />
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
			</div> -->
			<div class="eight">
				<h2>Testimonials</h2>
			</div>
			<div class="nine">
				<div>
					<p>This product comes in an attractive packaging. The price is
						very reasonable for a chemical free herbal ayurvedic blend. Has a
						very nice aroma. Best thing is it's non greasy. A scalp massage
						with this oil after a strenuous day's work is very soothing. I
						felt relief in itchiness and hair fall too. Highly recommend Good
						Hair Ayurvedic Oil.</p>
					<h5>-Prabha</h5>
				</div>
				<div>
					<p>Due to weather change I start having huge hair fall, which
						made my hair very thin. I could not do any hairstyle and would
						keep my hair tied up all the time. I started using Good Hair
						Ayurvedic Hair Oil and I must say that my hair fall has reduced by
						60% within 10 days of regular use. I can see a volume in my hairs,
						will continue using it. Highly recommended!</p>
					<h5>-Kiruba</h5>
				</div>
				<div>
					<p>Best products of hair problems. It's been a week since i am
						using Good Hair Ayurvedic hair oil and shampoo and my hair fall
						has reduced drastically. Have never a product work so quickly for
						me, i am their customer for life. Thank you for giving me the
						perfect solution. Thank you Good Hair!</p>
					<h5>-Sabin</h5>
				</div>
			</div>
			<div class="about">
				<div class="ten">
					<h2>About Us:</h2>
				</div>
				<div class="eleven">
					<h2>Transforming Passion To Perfection</h2>
				</div>
				<div class="twelve">
					<p>Our company Culture Health LTD. came into existence out of
						our passion for creating safe and effective products that are
						scientifically proven to provide solutions for all common hair
						problems.</p>
				</div>
				<div class="thirdeen">
					<div>
						<img class="thirdeen-1"
							src="./assets/images/philosophy images.gif" height="350"
							alt="image" width="350" />
					</div>
					<div>
						<p>
							<strong>Our philosophy</strong> towards haircare is focused
							around using all-natural solutions and traditional ways to combat
							the modern lifestyle issues like unhealthy food habits, exposure
							to pollution and use of harsh products.
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
						and oils that are not found in any of the products available in
						the market.</p>
				</div>
			</div>
		</div>
	</div>
</body>



</body>

</html>
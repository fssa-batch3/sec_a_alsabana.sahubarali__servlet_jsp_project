<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.healthyhair.model.User"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="assets/CSS/acc.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://fontawesome.com/icons/trash?f=sharp&s=solid&pc=%23c32222">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
.whole_container{
margin-top:50px;
}
</style>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<%
	User user = (User) session.getAttribute("User");
	%>

<!--  	<div class=whole_container>
		<h3>
			Username :
			<%=user.getUsername()%></h3>
		<h3>
			Email :
			<%=user.getEmail()%></h3>
		<h3>
			Mobile No :
			<%=user.getNumber()%></h3>
		<a href="DeleteUserAccountServlet?userId=<%=user.getUserId()%>">
			<p>Delete account</p>
		</a><a href="updateUser.jsp">
			<p>Edit account</p>
		</a>
	</div> -->
	
	
	
	 <div class="whole">
   <div class="personal-info">
     <div class="fst-container">
       <div class="profile">
          <img src="../assets/images/account profile.jpg" alt="user_image" id="user_img" >
       </div>
       <div>
        <p>Hello, <%=user.getUsername()%></p>
        <h3 id="user_name"></h3>  
      </div>
    </div>
    <!-- personal info -->
  <div class="first-container">
    <div class="personal-container">
      <h3>Personal information:</h3> 
    <form class="form edit" id="proform">
        <label>Image Url: <input class="url" id="image" type="text"  placeholder="upload image" />
        </label>       
         <label>Name :<input type="text" id="username"  placeholder="your name">
         </label>
         <label>Email:
          <input type="email" id="email"  placeholder="alsabana@gmail.com"> 
         </label>
         <label>Number:
          <input type="text" id="phNo"  placeholder="8090177736"> 

         </label>
         <label>
          password:
          <input type="password"  id="pass">
         </label>
         <label>
          Address:
          <textarea  type="text"id="country"></textarea>
         </label>
         <button type="submit"> SUBMIT</button>
         <button id="delete">Delete</button>
         <div class="logout">
        </div>
    </form>  
      <div class="customer_details" >
        <h4>Name : <span id="detail_name"><%=user.getUsername()%></span></h4>
        <h4>Number : <span id="detail_no"><%=user.getNumber()%></span></h4>
        <h4>Email : <span id="detail_email" ><%=user.getEmail()%></span></h4>
        <h4>Address : <span id="detail_address" ><%= user.getAddress() %></span></h4>
        <button type="click" onclick="change()" id="click_edit">Edit</button>
        <div>
          <h3 id="logOut"><i class="fa fa-sign-out"></i><a href="LogOutServlet">Log out</a></h3>
        </div>
     </div>
   </div>
    <div class="scnd-container">
      <div>
        <h3  class="bi bi-caret-right">Your Order details</h3>
      </div>
      <hr>
      <div class="no-order">
        <h3 >You haven't ordered yet</h3>
        <button>Explore now!</button>
      </div>
    </div>
   </div>
    </div>
  </body>
  <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

  <script src="assets/js/payment.js" ></script>
  <script src="assets/js/acc.js" ></script>
  <script src="assets/js/cart.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.healthyhair.model.User"%>
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
<title>Insert title here</title>
</head>
<style>
.whole_container {
	margin-top: 80px;
	text-align: center;
}
</style>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<%
	User user = (User) session.getAttribute("User");
	%>

	<div class=whole_container>
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
			<button>Delete account</button>
		</a><a href="updateUser.jsp">
			<button>Edit account</button>
		</a>
	</div>






</body>
</html>
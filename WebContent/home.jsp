<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	UserDetails user2=(UserDetails)session.getAttribute("userD");
	if(user2==null){
		response.sendRedirect("login.jsp");
		session.setAttribute("login-error","Please login first!");
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home page</title>
<%@include file="all_Links/links.jsp" %>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Niconne&display=swap" rel="stylesheet">
<style>
h1{
font-family: 'Niconne', cursive;
font-size:80px;
}
</style>
</head>
<body>
<div class="container-fluid p-0">
<%@include file="all_Links/navbar.jsp" %>
<div class="card bg-light py-5">
<div class="card-body text-center">
<img alt="" src="images/notebg (2).jpg" class="img-fluid mx-auto mt-5" style="max-width:280px;" >
<h1>Start taking your Recipes!</h1>
<a href="addRecipe.jsp" class="btn btn-outline-primary px-5">Let's Begin!</a>
</div>
</div>
</div>
<%@include file="all_Links/footer.jsp" %>
</body>
</html>
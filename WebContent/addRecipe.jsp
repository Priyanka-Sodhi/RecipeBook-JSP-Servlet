<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	UserDetails user1=(UserDetails)session.getAttribute("userD");
	if(user1==null){
		response.sendRedirect("login.jsp");
		session.setAttribute("login-error","Please login to add recipes!");
	}
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Recipe</title>
<%@include file="all_Links/links.jsp" %>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Charmonman:wght@700&display=swap" rel="stylesheet">
<style>
body{
	background: url("images/im (8).jpg");
    background-repeat: no-repeat;
    background-size:cover;
    width:100%;
    height: 100%;
	}
.myaddform{
	background-image: linear-gradient( 111.1deg,  rgba(0,40,70,0.95) -4.8%, rgba(255,115,115,0.85) 82.7%, rgba(255,175,123,0.8) 97.2% );
	border-radius:10px;
	box-shadow: 0 4px 20px 0 rgba(0, 0, 0, 0.2), 0 10px 20px 0 rgba(0, 0, 0, 0.19);
}
.myaddform h5{
	color:#d7385e;
}
.myaddform h1{
	color:white;
	font-weight:bolder;
	font-family: 'Charmonman', cursive;
	font-size:55px;
}
.myaddbtn{
	background-color:#ffbcbc;
	font-weight:bold;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
.myaddbtn:hover{
	background-color:#d7385e;
	border:1px solid white;
}	
</style>
</head>
<body>
<%@include file="all_Links/navbar.jsp" %>
<div class="container">
<div class="row mt-5 pt-5">
<div class="col-md-10 offset-1">
<form action="AddRecipeServlet" method="post" class="myaddform px-5 py-4 mb-5">
<h1>Add Your Recipes!</h1>
  <div class="form-group text-left">
  <%
  UserDetails us=(UserDetails)session.getAttribute("userD");
  if(us!=null){
  %>
  <input type="hidden" value="<%=us.getId() %>" name="uid">
  <%} %>
  
    <label for="exampleInputEmail1"><h5>ENTER RECIPE TITLE</h5></label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="title" required="required">
  </div>
  <div class="form-group text-left">
    <label for="exampleInputPassword1"><h5>ENTER YOUR RECIPE</h5></label>
   <textarea rows="12" cols="" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="recipe" required="required"></textarea>
  </div>
  <button type="submit" class="btn myaddbtn px-5">ADD</button>
</form>
</div>
</div>
</div>
<%@include file="all_Links/footer.jsp" %>
</body>
</html>

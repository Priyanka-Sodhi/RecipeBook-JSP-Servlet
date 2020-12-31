<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.User.Post" %>
<%@page import="com.DAO.PostDAO" %>
<%@page import="com.Db.DBConnect" %>
<%@page import="java.util.List" %>
<%
	UserDetails user1=(UserDetails)session.getAttribute("userD");
	if(user1==null){
		response.sendRedirect("login.jsp");
		session.setAttribute("login-error","Please login to add notes!");
	}
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Recipe</title>
<%@include file="all_Links/links.jsp" %>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Charmonman:wght@700&display=swap" rel="stylesheet">
<style>
body{
	background: url("images/im (7).jpg");
    background-repeat: no-repeat;
    background-size:cover;
    width:100%;
    height: 100%;
}	
.myeditform{
	background-image: linear-gradient( 111.1deg,  rgba(0,40,70,0.95) -4.8%, rgba(255,115,115,0.85) 82.7%, rgba(255,175,123,0.8) 97.2% );
	border-radius:10px;
	box-shadow: 0 4px 20px 0 rgba(0, 0, 0, 0.2), 0 10px 20px 0 rgba(0, 0, 0, 0.19);
}
.myeditform h5{
	color:#d7385e;
}
.myeditform h1{
	color:white;
	font-weight:bolder;
	font-family: 'Charmonman', cursive;
	font-size:55px;
}
.myeditbtn{
	background-color:#ffbcbc;
	font-weight:bold;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
.myeditbtn:hover{
	background-color:#d7385e;
	border:1px solid white;
}
</style>
</head>
<body>
<%
	Integer recipeid=Integer.parseInt(request.getParameter("recipe_id"));
	PostDAO post=new PostDAO(DBConnect.getConn());
	Post p=post.getDataById(recipeid);
	
%>
<%@include file="all_Links/navbar.jsp" %>
<div class="container">
<div class="row mt-5 pt-5 ">
<div class="col-md-10 offset-1">
<form action="EditRecipeServlet" method="post" class="myeditform px-5 py-4 mb-5">
<h1>Edit Your Recipe!</h1>
<input type="hidden" value="<%=recipeid %>" name="recipeid">
  <div class="form-group text-left">  
    <label for="exampleInputEmail1 "><h5>ENTER RECIPE TITLE</h5></label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="title" required="required" value="<%=p.getTitle() %>">
  </div>
  <div class="form-group text-left">
    <label for="exampleInputPassword1"><h5>ENTER YOUR RECIPE</h5></label>
   <textarea rows="12" cols="" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="recipe" required="required"><%=p.getRecipe() %></textarea>
  </div>
  <button type="submit" class="btn myeditbtn px-5">DONE</button>
</form>
</div>
</div>
</div>
<%@include file="all_Links/footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.User.Post" %>
<%@page import="com.DAO.PostDAO" %>
<%@page import="com.Db.DBConnect" %>
<%@page import="java.util.List" %>
<%
	UserDetails user3=(UserDetails)session.getAttribute("userD");
	if(user3==null){
		response.sendRedirect("login.jsp");
		session.setAttribute("login-error","Please login to view your recipes!");
	}
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Recipe</title>
<%@include file="all_Links/links.jsp" %>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Charmonman:wght@700&display=swap" rel="stylesheet">
<style>
.myalert-success {
	margin-top:-10px;
	margin-bottom:5px;
	padding:3px 15px;
	font-size:13px;
	background-color:rgba(60, 200, 74, 0.35);
	color: darkgreen;
	border-radius:3px;
	border:1px solid rgba(60, 200, 74, 0.5);
}
.myalert-success .alertlink{
	color: darkgreen;
	font-size:13px;
	text-decoration: underline;
}
.myalert-success .alertlink:hover{
	color:blue;
}
.myalert-danger {
	margin-top:-10px;
	margin-bottom:5px;
	padding:3px 15px;
	font-size:13px;
	background-color:rgba(219, 26, 26, 0.3);
	color:maroon;
	border-radius:3px;
	border:1px solid rgba(219, 26, 26, 0.25);
}			
.closebtn-success,.closebtn-danger {
	margin-left: 15px;
	color:green;
	font-weight: bold;
	float: right;
	font-size: 22px;
	line-height: 20px;
	cursor: pointer;
	transition: 0.3s;
}
.closebtn-danger {
 	color:maroon;
}
.closebtn-success:hover,.closebtn-danger:hover {
	color: black;
}
body{
	background: url("images/im (8).jpg");
    background-repeat: no-repeat;
    background-size:cover;
    width:100%;
    height: 100%;
}	
.myshowrecipebg{
	background-image: linear-gradient( 111.1deg,  rgba(0,40,70,0.95) -4.8%, rgba(255,115,115,0.85) 82.7%, rgba(255,175,123,0.8) 97.2% );
	border-radius:10px;
	box-shadow: 0 4px 20px 0 rgba(0, 0, 0, 0.2), 0 10px 20px 0 rgba(0, 0, 0, 0.19);
}
.myshowrecipebg h1{
	color:white;
	font-family:'Charmonman', cursive;
	font-size:55px;
}
.myshowrecipebg .card{
	box-shadow: 0 4px 20px 0 rgba(0, 0, 0, 0.2), 0 10px 20px 0 rgba(0, 0, 0, 0.19);
}
</style>
</head>
<body>
<%@include file="all_Links/navbar.jsp" %>
<div class="container text-left mt-5 pt-5 mb-5">
	<div class="row">
		<div class="col-md-8 offset-2 myshowrecipebg px-5 py-3">
		<h1 class=" text-center text-white pb-3">Your Recipes!</h1>
			<%
			if(user3!=null){
				PostDAO ob=new PostDAO(DBConnect.getConn());
				List<Post> post=ob.getData(user3.getId());
				for(Post po:post){
			%>
			<%
				String updateMsg=(String)session.getAttribute("updateMsg");
				if(updateMsg!=null){
			%>
			<div class="myalert-success">
  			<span class="closebtn-success" onclick="this.parentElement.style.display='none';">&times;</span><%=updateMsg%></div>
			
			<%
			session.removeAttribute("updateMsg");
				}
			%>
			
			<%
				String wrongMsg=(String)session.getAttribute("wrongMsg");
				if(wrongMsg!=null){
			%>
			<div class="myalert-danger">
  			<span class="closebtn-danger" onclick="this.parentElement.style.display='none';">&times;</span><%=wrongMsg%></div>
			
			<%
			session.removeAttribute("wrongMsg");
				}
			%>
			<div class="card bg-light mb-4">
				<img src="images/notebg (2).jpg" class="card-img-top mx-auto mt-2" style="max-width:100px;">
				<div class="card-body p-4">
					<h3 class="card-title"><b><%=po.getTitle()%></b></h3>
					<p><%=po.getRecipe() %></p>
					<p>
					<b class="text-success">Written by: </b><br>
					<span class="text-primary"><%=user3.getName() %></span>
					</p>
					<p>
					<b class="text-success">Written Timestamp: </b><br>
					<span class="text-primary"><%=po.getPdate() %></span>
					</p>
					<div class="container text-center mt-2">
					<a href="deleteServlet?recipe_id=<%=po.getId()%>" class="btn btn-danger">Delete</a>
					<a href="edit.jsp?recipe_id=<%=po.getId()%>" class="btn btn-primary">Edit</a>
					</div>
				</div>
			</div>	
			<%		
				}
			}
			%>	
		
		
		</div>
	</div>
</div>

</body>
</html>
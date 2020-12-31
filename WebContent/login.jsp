<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <%@include file="all_Links/links.jsp" %>
        <style type="text/css">
            .formbg{
            background: url("images/pim (5).jpg");
            background-repeat: no-repeat;
            background-size:cover;
            width:100%;
            height: 100%;
			}
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
        </style>
    </head>
    <body>
        <div class="formbg pt-5">
        <%@include file="all_Links/navbar.jsp" %>
        <div class="panda">
            <div class="ear1"></div>
            <div class="ear2"></div>
            <div class="face">
                <div class="eye-shade1"></div>
                <div class="eye-white1">
                    <div class="eye-ball1"></div>
                </div>
                <div class="eye-shade2"></div>
                <div class="eye-white2">
                    <div class="eye-ball2"></div>
                </div>
<!--                <div class="eye-shade rgt"></div>
                <div class="eye-white rgt">
                    <div class="eye-ball"></div>
                </div>-->
                <div class="nose"></div>
                <div class="mouth"></div>
            </div>
            <div class="pbody"> </div>
            <div class="foot1">
            </div>
            <div class="foot2">
            </div>
        </div>
       
        <form class="myform" action="loginServlet" method="post">
            <div class="hand1"></div>
            <div class="hand2"></div>
            <h1>Login <i class="fa fa-user" aria-hidden="true"></i></h1><hr>
            
            <%
            String invalidMsg=(String) session.getAttribute("login-failed");
            if(invalidMsg!=null){
            %>
            <div class="myalert-danger">
  			<span class="closebtn-danger" onclick="this.parentElement.style.display='none';">&times;</span><%=invalidMsg %></div>
			<%
			session.removeAttribute("login-failed");
			}
			%>
			
			<%
			String withoutLogin=(String)session.getAttribute("login-error");
			if(withoutLogin!=null){
			%>
			<div class="myalert-danger">
  			<span class="closebtn-danger" onclick="this.parentElement.style.display='none';">&times;</span><%=withoutLogin %></div>
			<%
			session.removeAttribute("login-error");
			}
			%>
			
			<%
			String lgMsg=(String)session.getAttribute("logoutMsg");
			if(lgMsg!=null){
			%>
			<div class="myalert-success">
  			<span class="closebtn-success" onclick="this.parentElement.style.display='none';">&times;</span><%=lgMsg%></div>
			<%
			session.removeAttribute("logoutMsg");
			}
			%>
            
            <!-- <div class="myalert">
  			<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  			Login Successful!
			</div>-->
             <div class="form-group">
                <label class="form-label mylabel1">Email Address</label>
                <input required="required" type="email" placeholder="Enter your email" class="form-control" name="uemail"/>
            </div>
            <div class="form-group">
                <label class="form-label mylabel">Password</label>
                <input id="password" type="password" placeholder="Enter your password" required="required" class="form-control" name="upassword"/>    
            </div>
            <button class="myformbtn">LOGIN</button>
          </form>           
        </div>
        <%@include file="all_Links/footer.jsp" %>
        <script src="mycss/myjs.js"></script>
    </body>
</html>    
    
    
    
    
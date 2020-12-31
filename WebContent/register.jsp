<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <%@include file="all_Links/links.jsp" %>
        <style type="text/css">
            .formbg1{
                background: url("images/pim (5).jpg");
                background-repeat: no-repeat;
                background-size:cover;
                width:100%;
                height: auto;
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
        <div class="formbg1 pt-5">
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
                <div class="body1"> </div>
                <div class="foot11">
                </div>
                <div class="foot12">
                </div>
            </div>
            
            <form class="myform1" action="UserServlet" method="post">
                <div class="hand1"></div>
                <div class="hand2"></div>
                <h1>Register Yourself <i class="fa fa-user-plus" aria-hidden="true"></i></h1><hr>
                
                <%
                String regMsg=(String) session.getAttribute("reg-success");
                if(regMsg!=null){
                %>
                <div class="myalert-success">
  				<span class="closebtn-success" onclick="this.parentElement.style.display='none';">&times;</span><%= regMsg %><a href="login.jsp" class="alertlink">Login Here</a></div>
                <%
                session.removeAttribute("reg-success");
                }
                %>
                
                <%
                String failedMsg=(String) session.getAttribute("failed-msg");
                if(failedMsg!=null){
                %>
                <div class="myalert-danger">
  				<span class="closebtn-danger" onclick="this.parentElement.style.display='none';">&times;</span><%= failedMsg %></div>
                <%
                session.removeAttribute("failed-msg");
                }
                %>
                
                
                <!-- <div class="myalert-danger">
  				<span class="closebtn-danger" onclick="this.parentElement.style.display='none';">&times;</span> 
  				Registration Successful! <a href="login.jsp" class="alertlink">Login Here</a>
				</div>-->
                <div class="form-group">
                    <label class="form-label mylabel2">Full Name</label>
                    <input required="required" type="text" placeholder="Enter your full name" class="form-control" name="fname"/>
                </div>
                <div class="form-group">
                    <label class="form-label mylabel1">Email Address</label>
                    <input required="required" type="email" placeholder="Enter your email id" class="form-control" name="uemail"/>
                </div>
                <div class="form-group">
                    <label class="form-label mylabel">Password</label>
                    <input id="password" type="password" placeholder="Create your password" required="required" class="form-control" name="upassword"/>
                    <!-- <p class="alert">Invalid Credentials..!!</p>-->
                </div>
                <button class="myformbtn">REGISTER</button>
            </form>
        </div>
        <%@include file="all_Links/footer.jsp" %>
        <script src="mycss/myjs.js"></script>
    </body>
</html>

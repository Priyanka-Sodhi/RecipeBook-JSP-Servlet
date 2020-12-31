<%@page import="com.User.UserDetails" %>
<nav class="navbar navbar-expand-lg navbar-dark mynavbg navbar-fixed-top navbar-default">
  <a class="navbar-brand" href="#"><i class="fa fa-cutlery" aria-hidden="true"></i> Recipe Book</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active">
        <a class="nav-link" href="home.jsp"><i class="fa fa-home"></i> Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="addRecipe.jsp"><i class="fa fa-plus-circle" aria-hidden="true"></i> Add Recipe</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="showRecipe.jsp"><i class="fa fa-th-list" aria-hidden="true"></i> Show Recipe</a>
      </li>
    </ul>
    
    <%
   	UserDetails user=(UserDetails) session.getAttribute("userD");
    if(user!=null){
    %>
    <a href="" class="btn btn-light my-2 mr-2 ml-3 my-sm-0 mynavbtn" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-user" aria-hidden="true"></i> <%=user.getName() %></a>
    <a href="LogoutServlet" class="btn btn-light my-2 mr-4 my-sm-0 mynavbtn"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>
     
    <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content mymodalbg">
      <div class="modal-header">
        <h5 class="modal-title pl-5 ml-5 text-info" id="exampleModalLabel"><i class="fa fa-user" aria-hidden="true"></i> Welcome, <%=user.getName() %> !</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container text-center">
        <i class="fa fa-info-circle fa-2x" aria-hidden="true"></i><p class="h4 font-weight-bold">Your Details</p>
        <table class="table ">
        <tbody >
        	<tr>
        		<th class="text-left pl-5">User Id</th>
        		<td class="text-left pl-5"><%=user.getId() %></td>
        	</tr>
        	<tr>
        		<th class="text-left pl-5">Full Name</th>
        		<td class="text-left pl-5"><%=user.getName() %></td>
        	</tr>
        	<tr>
        		<th class="text-left pl-5">Email Id</th>
        		<td class="text-left pl-5"><%=user.getEmail() %> </td>
        	</tr>
        </tbody>
        	
        </table>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div> 
      
    <% }else{ %>
    <a href="login.jsp" class="btn btn-light my-2 mr-2 ml-3 my-sm-0 mynavbtn"><i class="fa fa-user" aria-hidden="true"></i> Login</a>
    <a href="register.jsp" class="btn btn-light my-2 mr-4 my-sm-0 mynavbtn"><i class="fa fa-user-plus" aria-hidden="true"></i> Register</a>
 
    <%} %>
       </div>



</nav>
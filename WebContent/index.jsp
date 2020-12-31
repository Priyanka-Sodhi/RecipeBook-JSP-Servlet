<%-- 
    Document   : index
    Created on : Dec 26, 2020, 2:24:13 AM
    Author     : ESS
--%>

<%@page import="com.Db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style type="text/css">
            .mywelcome-img{
            background: url("images/im (2).jpg");
            background-repeat: no-repeat;
            background-size:cover;
            width:100%;
            height:91vh;  
}
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <%@include file="all_Links/links.jsp" %>
    </head>
    <body>
        <%@include file="all_Links/navbar.jsp" %>
        <%/*
        Connection conn=DBConnect.getConn();
        System.out.println(conn);*/
        %>
        <div class="container-fluid mywelcome-img text-center">
            <div class="mytextbox py-5">
            <h1 class="mb-4">Create and Write your own Recipes!</h1>
            <a href="login.jsp" class="btn btn-light my-2 mr-2 my-sm-0 mynavbtn"><i class="fa fa-user" aria-hidden="true"></i> Login</a>
            <a href="register.jsp" class="btn btn-light my-2 mr-5 my-sm-0 mynavbtn"><i class="fa fa-user-plus" aria-hidden="true"></i> Register</a>
            </div>
        </div>
        <%@include file="all_Links/footer.jsp" %>
    </body>
</html>

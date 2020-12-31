package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.Db.DBConnect;
import com.User.UserDetails;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		String name=request.getParameter("fname");
		String email=request.getParameter("uemail");
		String password=request.getParameter("upassword");
		
		UserDetails us=new UserDetails();
		us.setName(name);
		us.setEmail(email);
		us.setPassword(password);
		
		UserDAO dao=new UserDAO(DBConnect.getConn());
		boolean f=dao.addUser(us);
		PrintWriter out=response.getWriter();
		HttpSession session;
		
		if(f) {
			//out.print("User Registered Successfully!");
			session=request.getSession();
			session.setAttribute("reg-success", "Registration Successful!");
			response.sendRedirect("register.jsp");
		}
		else {
			//out.print("Data not inserted!");
			session=request.getSession();
			session.setAttribute("failed-msg", "Oops! Something went wrong!");
			response.sendRedirect("register.jsp");
		}
	}

}

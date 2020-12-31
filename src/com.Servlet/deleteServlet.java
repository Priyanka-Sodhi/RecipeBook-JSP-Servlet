package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PostDAO;
import com.Db.DBConnect;

@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer recipeid=Integer.parseInt(request.getParameter("recipe_id"));
		PostDAO dao=new PostDAO(DBConnect.getConn());
		boolean f=dao.DeleteRecipe(recipeid);
		HttpSession session=null;
		if(f) {
			System.out.println("data deleted successfully");
			session=request.getSession();
			session.setAttribute("updateMsg", "Recipe Deleted Successfully!");
			response.sendRedirect("showRecipe.jsp");
		}
		else {
			System.out.println("data deletion unsuccessful");
			session=request.getSession();
			session.setAttribute("wrongMsg", "Something went wrong!");
			response.sendRedirect("showRecipe.jsp");
		}
	}
}

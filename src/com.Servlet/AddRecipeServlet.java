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

/**
 * Servlet implementation class AddRecipeServlet
 */
@WebServlet("/AddRecipeServlet")
public class AddRecipeServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid=Integer.parseInt(request.getParameter("uid"));
		String title=request.getParameter("title");
		String recipe=request.getParameter("recipe");
		
		PostDAO dao=new PostDAO(DBConnect.getConn());
		boolean f=dao.AddRecipe(title, recipe, uid);
		HttpSession session=null;
		if(f) {
			System.out.println("data inserted successfully");
			session=request.getSession();
			session.setAttribute("updateMsg", "Recipe Added Successfully!");
			response.sendRedirect("showRecipe.jsp");
			}
		else {
			System.out.println("data not inserted");
			session=request.getSession();
			session.setAttribute("wrongMsg", "Something went wrong!");
			response.sendRedirect("showRecipe.jsp");
		}
	}

}

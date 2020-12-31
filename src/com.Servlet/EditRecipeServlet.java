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
 * Servlet implementation class EditRecipeServlet
 */
@WebServlet("/EditRecipeServlet")
public class EditRecipeServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		Integer recipeid=Integer.parseInt(request.getParameter("recipeid"));
		String Title=request.getParameter("title");
		String Recipe=request.getParameter("recipe");
		
		PostDAO dao=new PostDAO(DBConnect.getConn());
		boolean f=dao.PostUpdate(recipeid, Title, Recipe);
		if(f) {
			System.out.println("data updated successfully!");
			HttpSession session=request.getSession();
			session.setAttribute("updateMsg","Recipe Updated Successfully!");
			response.sendRedirect("showRecipe.jsp");
		}
		else {
			System.out.println("data not updated!!");
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}

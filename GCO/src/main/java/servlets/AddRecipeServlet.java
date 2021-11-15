package servlets;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.MultipartConfigElement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import beans.*;



@WebServlet(urlPatterns = {"/addRecipe" })
public class AddRecipeServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public AddRecipeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
		    throws ServletException, IOException{
		

		String nombre= req.getParameter("name");
		String ingredientes= req.getParameter("ingredients");
		String descripcion= req.getParameter("recipe");
		Recipe r = new Recipe(nombre,ingredientes,descripcion);
		int status = RecipeDAO.createRecipe(r);
		//atributo para el modal del jsp
		if (status!=-1) {
			req.setAttribute("correctAddedRecipe", true);
		}
		else {
			req.setAttribute("incorrectAddedRecipe", true);
		}
		req.getRequestDispatcher("index.jsp").forward(req, res);
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
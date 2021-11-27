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
@MultipartConfig
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
		
		req.setCharacterEncoding("UTF-8");
		//procesar la foto enviada por el post request, si no hay foto no hace nada
		Part filePart = req.getPart("photo");
		byte[] data = null;
		if (filePart.getSize()>0) {
		    data = new byte[(int) filePart.getSize()];
		    filePart.getInputStream().read(data, 0, data.length);
		}
				
		String nombre= req.getParameter("name");
		String ingredientes= req.getParameter("ingredients");
		String descripcion= req.getParameter("recipe");
		Recipe r = new Recipe(nombre,ingredientes,descripcion);
		if (data!=null) {
			r.setPhoto(data);
		}
		int status = RecipeDAO.createRecipe(r);
		//atributo para el modal del jsp
		if (status!=-1) {
			req.setAttribute("correctAddedRecipe", true);
		}
		else {
			req.setAttribute("incorrectAddedRecipe", true);
		}
		String URI = req.getParameter("JSP");
		if (URI.equals("index")) {
		req.getRequestDispatcher("index.jsp").forward(req, res);
		}
		else if (URI.equals("recipesAdmin")) {
		req.getRequestDispatcher("recipesAdmin.jsp").forward(req, res);

		}
		else {
			req.getRequestDispatcher("search.jsp").forward(req, res);

		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
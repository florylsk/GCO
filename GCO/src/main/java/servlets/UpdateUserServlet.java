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



@WebServlet(urlPatterns = {"/updateUser" })
public class UpdateUserServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public UpdateUserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
		    throws ServletException, IOException{
		req.setCharacterEncoding("UTF-8");
		String username=req.getParameter("username");
		String firstname= req.getParameter("firstname");
		String lastname= req.getParameter("lastname");
		String password= req.getParameter("password");
		String mail= req.getParameter("mail");
		User u = new User(username,password,firstname,lastname,mail,false);
		int status = userDAO.updateUser(u);
		//atributo para el modal del jsp
		if (status!=-1) {
			req.setAttribute("correctUpdatedUser", true);
		}
		else {
			req.setAttribute("incorrectUpdatedUser", true);
		}
		req.getRequestDispatcher("usersAdmin.jsp").forward(req, res);
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
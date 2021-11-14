package servlets;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import beans.User;
import beans.loginDAO;
import beans.userDAO;



@WebServlet(urlPatterns = {"/userreg" })
public class UserRegisterServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public UserRegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
		    throws ServletException, IOException{
		//coge los parametros del post request
		String uName = req.getParameter("username");
		String pWord = req.getParameter("password");
		String firstname = req.getParameter("firstname");
		String surnames = req.getParameter("surnames");
		String mail = req.getParameter("email");
		//crea un objeto admin temporal y lo valida
		User user = new User(uName,pWord);
		user.setFirstname(firstname);
		user.setLastname(surnames);
		user.setMail(mail);
		int register=userDAO.createUser(user);
		if (register!=-1) {
			req.setAttribute("correctRegister", true);
		}
		else {
			req.setAttribute("incorrectRegister", true);
		}
		req.getRequestDispatcher("access.jsp").forward(req, res);
		
		
	}
}
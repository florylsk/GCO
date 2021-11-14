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



@WebServlet(urlPatterns = {"/userlog" })
public class UserLoginServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public UserLoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
		    throws ServletException, IOException{
		//coge los parametros del post request
		String uName = req.getParameter("username");
		String pWord = req.getParameter("password");
		//crea un objeto admin temporal y lo valida
		User user = new User(uName,pWord);
		boolean login=loginDAO.validate(user);
		
			//si login bueno proporciona los atributos de la sesion para procesarlos en el jsp
			if (login) {	
				HttpSession session = req.getSession();
				session.setAttribute("nombre", user.getFirstname());
				session.setAttribute("apellido", user.getLastname());
				session.setAttribute("username", user.getUsername());
				req.getRequestDispatcher("index.jsp").forward(req, res);
				
				
			} else {
				req.setAttribute("incorrect", true);
				req.getRequestDispatcher("access.jsp").forward(req, res);
				
				
			}
		
		
	}
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		RequestDispatcher reqDis =req.getRequestDispatcher("access.jsp");
		reqDis.forward(req, res);
	}
}
	
	
	
	
	

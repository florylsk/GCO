package servlets;


import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

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
		//password to sha256
		MessageDigest md=null;
		try {
			md = MessageDigest.getInstance("SHA-256");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		byte[] hash=md.digest(pWord.getBytes(StandardCharsets.UTF_8));
		BigInteger number = new BigInteger(1, hash);  
		StringBuilder hexString = new StringBuilder(number.toString(16));  
		while (hexString.length() < 32)  
        {  
            hexString.insert(0, '0');  
        }  
		//password in sha256
		String password=hexString.toString();
		//crea un objeto admin temporal y lo valida
		User user = new User(uName,password);
		int login=loginDAO.validate(user);
		
			//si login bueno proporciona los atributos de la sesion para procesarlos en el jsp
			if (login==1) {	
				HttpSession session = req.getSession();
				session.setAttribute("nombre", user.getFirstname());
				session.setAttribute("apellido", user.getLastname());
				session.setAttribute("username", user.getUsername());
				session.setAttribute("isAdmin", false);
				if(user.getPhoto()!=null) {
				byte[] temp=Base64.getEncoder().encode(user.getPhoto());
				String B64 = new String(temp);
				session.setAttribute("photo", B64);
				System.out.print(B64);
				}
				req.getRequestDispatcher("index.jsp").forward(req, res);
				
				
			}
			else if (login==2) {
				HttpSession session = req.getSession();
				session.setAttribute("nombre", user.getFirstname());
				session.setAttribute("apellido", user.getLastname());
				session.setAttribute("username", user.getUsername());
				session.setAttribute("isAdmin", true);
				req.getRequestDispatcher("admin.jsp").forward(req, res);
			}
			
			else {
				req.setAttribute("incorrect", true);
				req.getRequestDispatcher("access.jsp").forward(req, res);
				
				
			}
		
		
	}
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		RequestDispatcher reqDis =req.getRequestDispatcher("access.jsp");
		reqDis.forward(req, res);
	}
}
	
	
	
	
	

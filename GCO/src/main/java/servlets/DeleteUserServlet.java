package servlets;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.*;





@WebServlet(urlPatterns = {"/deleteUser" })
public class DeleteUserServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	 
    public DeleteUserServlet() {
        super();
    }
 
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
		    throws ServletException, IOException{
		String username=req.getParameter("username");
		int result=userDAO.deleteUser(username);
		
		if(result!=-1) {
			req.setAttribute("correctDeletedUser", true);
		}
		else {
			req.setAttribute("incorrectDeletedUser", true);
		}
		
		req.getRequestDispatcher("usersAdmin.jsp").forward(req, res);
	}
	
    
	 
	

	
	
	
	
}
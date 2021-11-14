package servlets;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.jms.Queue;
import javax.jms.QueueConnection;
import javax.jms.QueueConnectionFactory;
import javax.jms.QueueSender;
import javax.jms.QueueSession;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.naming.InitialContext;




@WebServlet(urlPatterns = {"/userlogout" })
public class UserLogoutServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	 
    public UserLogoutServlet() {
        super();
    }
 
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
    	HttpSession session = req.getSession();
		
		try {
        session.invalidate();
		}catch
			(Exception e){System.out.println(e);
		}
		
		res.sendRedirect("access.jsp");
	
    	
    	
    }
	
    
	 
	

	
	
	
	
}
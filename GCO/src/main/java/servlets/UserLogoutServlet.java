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

import beans.*;

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
		Boolean isAdmin = (boolean)session.getAttribute("isAdmin");
		if (!isAdmin) {
		String username = (String) session.getAttribute("username");
        String name=(String) session.getAttribute("nombre");
        String lastName=(String) session.getAttribute("apellido");
        
        Date _inicio = new Date(session.getCreationTime());
        Date _fin = new Date(System.currentTimeMillis());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String inicio = sdf.format(_inicio);
        String fin = sdf.format(_fin);  
		Record record= new Record(username,name,lastName,inicio,fin);
		int status=RecordDAO.createRecord(record);
		}
		session.invalidate();
		res.sendRedirect("/GCO/access");
	
    	
    	
    }
	
    
	 
	

	
	
	
	
}
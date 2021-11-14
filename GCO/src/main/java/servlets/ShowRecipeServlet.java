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





@WebServlet(urlPatterns = {"/showRecipe" })
public class ShowRecipeServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	 
    public ShowRecipeServlet() {
        super();
    }
 
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
		    throws ServletException, IOException{
		String idReceta= req.getParameter("recipeName");	
		req.setAttribute("recipeToShow", idReceta);
		req.getRequestDispatcher("index.jsp").forward(req, res);
	}
	
    
	 
	

	
	
	
	
}
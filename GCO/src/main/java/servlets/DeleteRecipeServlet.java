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





@WebServlet(urlPatterns = {"/deleteRecipe" })
public class DeleteRecipeServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	 
    public DeleteRecipeServlet() {
        super();
    }
 
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
		    throws ServletException, IOException{
		int idReceta=Integer.parseInt(req.getParameter("id")) ;	
		Recipe receta = null;
		int result=RecipeDAO.deleteRecipe(idReceta);
		
		if(result!=-1) {
			req.setAttribute("correctDeletedRecipe", true);
		}
		else {
			req.setAttribute("incorrectDeletedRecipe", true);
		}
		
		req.getRequestDispatcher("search.jsp").forward(req, res);
	}
	
    
	 
	

	
	
	
	
}
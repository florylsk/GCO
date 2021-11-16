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





@WebServlet(urlPatterns = {"/searchRecipes" })
public class SearchRecipesServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	 
    public SearchRecipesServlet() {
        super();
    }
 
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
		    throws ServletException, IOException{
		String keyword=req.getParameter("keyword");
		List<Recipe> searchRecipes = RecipeDAO.getSearchRecipes(keyword);
		
		req.setAttribute("recipesSearched", searchRecipes);
		req.getRequestDispatcher("search.jsp").forward(req, res);
	}
	
    
	 
	

	
	
	
	
}
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





@WebServlet(urlPatterns = {"/showRecipe" })
public class ShowRecipeServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	 
    public ShowRecipeServlet() {
        super();
    }
 
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
		    throws ServletException, IOException{
		int idReceta=Integer.parseInt(req.getParameter("recipeName")) ;	
		Recipe receta = null;
		List<Recipe> allRecipes = RecipeDAO.getAllRecipes();
		for (Recipe r : allRecipes) {
			if (r.getId()==idReceta) {
				int varId=(r.getId());
				String varNombre=(r.getNombre());
				String varDes=(r.getDescripcion());
				String varIng=(r.getIngredientes());
				byte[] photo = (r.getPhoto());
				receta= new Recipe(varId,varNombre,varIng,varDes,photo);
			}
		}
		
		req.setAttribute("recipeToShow", receta);
		req.getRequestDispatcher("index.jsp").forward(req, res);
	}
	
    
	 
	

	
	
	
	
}
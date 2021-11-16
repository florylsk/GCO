package beans;

import java.sql.*;  
import java.util.ArrayList;  
import java.util.List;  


//clase DAO del estudiante que contiene las funciones para controlarlos en la base de datos
public class RecipeDAO{
	

	

	
	
	
	public static List<Recipe> getAllRecipes(){
		List<Recipe> recetas = new ArrayList<Recipe>();
		try {
			Connection con= connectionDB.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from recetas");
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				Recipe s = new Recipe(rs.getInt("id"),rs.getString("nombre"),rs.getString("ingredientes"),rs.getString("descripcion")); 
				recetas.add(s);
			}
			con.close();
		
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}

		
		return recetas;
	}
	
	
	public static int createRecipe(Recipe recipe) {
		int status=0;
		try {
			Connection con=connectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("insert into recetas(nombre,ingredientes,descripcion) values(?,?,?)");
			ps.setString(1, recipe.getNombre());
			ps.setString(2, recipe.getIngredientes());
			ps.setString(3, recipe.getDescripcion());
			status=ps.executeUpdate();
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public static List<Recipe> getSearchRecipes(String keyword){
		List<Recipe> recetas = new ArrayList<Recipe>();
		String _keyword="%"+keyword+"%";
		try {
			Connection con= connectionDB.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from recetas where nombre LIKE ? or ingredientes LIKE ? or descripcion like ?");
			ps.setString(1, _keyword);
			ps.setString(2, _keyword);
			ps.setString(3, _keyword);
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				Recipe s = new Recipe(rs.getInt("id"),rs.getString("nombre"),rs.getString("ingredientes"),rs.getString("descripcion")); 
				recetas.add(s);
			}
			con.close();
		
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}

		
		return recetas;
	}
	
	public static int updateRecipe(Recipe recipe) {
		int status=0;
		try {
			Connection con=connectionDB.getConnection();
			PreparedStatement ps=con.prepareStatement("update recetas set nombre=?,ingredientes=?,descripcion=? where id=?");
			ps.setString(1, recipe.getNombre());
			ps.setString(2, recipe.getIngredientes());
			ps.setString(3, recipe.getDescripcion());
			ps.setInt(4, recipe.getId());
			status=ps.executeUpdate();
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return status;
	
		
	}
	
	public static int deleteRecipe(int id) {
		int status=0;
		try {
			Connection con=connectionDB.getConnection();
			
			PreparedStatement ps=con.prepareStatement("delete from recetas where id=?");
			ps.setInt(1, id);
			status=ps.executeUpdate();
			con.close();
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}
	
	
	
	

}
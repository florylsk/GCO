package beans;


public class Recipe{
	private int id;
	private String nombre;
	private String ingredientes;
	private String descripcion;

	
	
	
	public Recipe(int id,String nombre, String ingredientes, String descripcion) {
		  this.id=id;
		  this.nombre=nombre;
		  this.ingredientes=ingredientes;
		  this.descripcion=descripcion;
		 }
	
	public Recipe(String nombre, String ingredientes, String descripcion) {
		  this.nombre=nombre;
		  this.ingredientes=ingredientes;
		  this.descripcion=descripcion;
		 }


	public int getId() {
		return id;
	}





	public void setId(int id) {
		this.id = id;
	}





	public String getNombre() {
		return nombre;
	}





	public void setNombre(String nombre) {
		this.nombre = nombre;
	}





	public String getIngredientes() {
		return ingredientes;
	}





	public void setIngredientes(String ingredientes) {
		this.ingredientes = ingredientes;
	}





	public String getDescripcion() {
		return descripcion;
	}





	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	


	

	
}

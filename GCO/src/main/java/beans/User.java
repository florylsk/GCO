package beans;


public class User{
	private String username;
	private String password;
	private String firstname;
	private String lastname;
	private String mail;
	private boolean isAdmin;
	
	
	
	
	public User(String username, String password) {
		  this.username=username;
		  this.password=password;
		 }
	public User(String username, String password, String firstname, String lastname, String mail, boolean isAdmin) {
		this.username=username;
		this.password=password;
		this.firstname=firstname;
		this.lastname=lastname;
		this.mail=mail;
		this.isAdmin=isAdmin;
	}
	
	
	public String getUsername() {
		return this.username;	
	}
	
	public void setUsername (String username) {
		this.username=username;
	}
	
	public String getPassword() {
		return this.password;	
	}
	
	public void setPassword(String password) {
		this.password=password;
	}
	
	public String getFirstname() {
		return this.firstname;	
	}
	
	public void setFirstname (String firstname) {
		this.firstname=firstname;
	}
	
	public String getLastname() {
		return this.lastname;	
	}
	
	public void setLastname(String lastname) {
		this.lastname=lastname;
	}


	public String getMail() {
		return mail;
	}


	public void setMail(String mail) {
		this.mail = mail;
	}


	public boolean isAdmin() {
		return isAdmin;
	}


	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	


	

	
}

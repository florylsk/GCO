package beans;


public class User{
	private String username;
	private String password;
	private String firstname;
	private String lastname;
	private String mail;

	
	
	
	
	public User(String username, String password) {
		  this.username=username;
		  this.password=password;
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
	


	

	
}

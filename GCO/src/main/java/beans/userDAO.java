package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class userDAO{
	
	
	public static int createUser(User user) {
		int status=0;
		try {
			Connection con=connectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("insert into users(username,password,firstname,lastname,mail) values(?,?,?,?,?)");
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getFirstname());
			ps.setString(4, user.getLastname());
			ps.setString(5, user.getMail());  
			status=ps.executeUpdate();
			con.close();
		}
		catch(Exception e) {
			status=-1;
			e.printStackTrace();
		}
		return status;
	}
	
}
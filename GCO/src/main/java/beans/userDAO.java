package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
	public static int updateUser(User user) {
		int status=0;
		try {
			Connection con=connectionDB.getConnection();
			PreparedStatement ps=con.prepareStatement("update users set password=?,firstname=?,lastname=?,mail=? where username=?");
			ps.setString(1, user.getPassword());
			ps.setString(2, user.getFirstname());
			ps.setString(3, user.getLastname());
			ps.setString(4, user.getMail());
			ps.setString(5, user.getUsername());
			status=ps.executeUpdate();
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return status;
	
		
	}
	
	public static int deleteUser(String username) {
		int status=0;
		try {
			Connection con=connectionDB.getConnection();
			
			PreparedStatement ps=con.prepareStatement("delete from records where username=?;");
			ps.setString(1, username);
			status=ps.executeUpdate();
			
			
			ps=con.prepareStatement("delete from users where username=?");
			ps.setString(1, username);
			status=ps.executeUpdate();
			con.close();
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}
	
	public static List<User> getAllUsers(){
		List<User> users = new ArrayList<User>();
		try {
			Connection con= connectionDB.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from users");
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				User u = new User(rs.getString("username"),rs.getString("password"),rs.getString("firstname"),rs.getString("lastname"),rs.getString("mail"),false); 
				users.add(u);
			}
			con.close();
		
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}

		
		return users;
	}
	
	
	public static User getStudentByUsername(String username) {
		User u = null;
		try {
			Connection con=connectionDB.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from students where username=?");
			ps.setString(1, username);
			ResultSet rs=ps.executeQuery();  
			while(rs.next()) {
				u=new User(rs.getString("username"),rs.getString("password"),rs.getString("firstname"),rs.getString("lastname"),rs.getString("mail"),false);
			}	
			con.close();
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}	
		return u;
	
	}
}
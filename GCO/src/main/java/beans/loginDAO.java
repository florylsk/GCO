package beans;

import java.sql.*;



//clase DAO para validar el login
public class loginDAO{
	
	public static int validate(User user) {
		int access=0; //0=invalido,1=user,2=admin
		
		
		try {
			String uName=user.getUsername();
			String pWord=user.getPassword();
			Connection con=connectionDB.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM users where username='"+uName+"' AND password='"+pWord+"'");
			ResultSet rs = ps.executeQuery();		
			boolean status=rs.next();
			if (status) {
				access=1;
				user.setFirstname(rs.getString(3));
				user.setLastname(rs.getString(4));
				user.setAdmin(false);
			}
			else {
				 ps = con.prepareStatement("SELECT * FROM admins where username='"+uName+"' AND password='"+pWord+"'");
				 rs = ps.executeQuery();
				 status=rs.next();
				 if(status) {
					 access=2;
					 user.setFirstname(rs.getString(3));
					 user.setLastname(rs.getString(4));
					 user.setAdmin(true);
				 }
			}
		}
		
		catch(Exception e){
			
			e.printStackTrace();
		}
		return access;
	}
}
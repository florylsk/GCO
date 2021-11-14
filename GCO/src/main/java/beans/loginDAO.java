package beans;

import java.sql.*;



//clase DAO para validar el login
public class loginDAO{
	
	public static boolean validate(User admin) {
		boolean status=false;
		
		
		try {
			String uName=admin.getUsername();
			String pWord=admin.getPassword();
			Connection con=connectionDB.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM users where username='"+uName+"' AND password='"+pWord+"'");
			ResultSet rs = ps.executeQuery();		
			status=rs.next();
			if (status) {
				admin.setFirstname(rs.getString(3));
				admin.setLastname(rs.getString(4));
			}
		}
		
		catch(Exception e){
			
			e.printStackTrace();
		}
		return status;
	}
}
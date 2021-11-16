package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class RecordDAO{
	
	public static int createRecord(Record record) {
		int status=0;
		try {
			Connection con=connectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("insert into records(username,firstname,lastname,fecha_inicio,fecha_salida) values(?,?,?,?,?)");
			ps.setString(1, record.getUsername());
			ps.setString(2, record.getFirstname());
			ps.setString(3, record.getLastname());
			ps.setString(4, record.getStartTime());  
			ps.setString(5, record.getEndTime());  
			status=ps.executeUpdate();
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	public static List<Record> getAllRecords(){
		List<Record> Records= new ArrayList<Record>();
		try {
			Connection con= connectionDB.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from records");
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				Record r = new Record(rs.getString("username"),rs.getString("firstname"),rs.getString("lastname"),rs.getString("fecha_inicio"),rs.getString("fecha_salida")); 
				Records.add(r);
			}
			con.close();
		
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}

		
		return Records;
	}
	
	
}
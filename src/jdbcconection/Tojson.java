package jdbcconection;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.List;

public class Tojson extends Connect{
	
	public Tojson() {
		
	}
	public static String tojson(String sql) throws SQLException{
		Connect connect=new Connect();
		ResultSet rs= connect.sql(sql);
		ResultSetMetaData rsmd=rs.getMetaData();
		int col=rsmd.getColumnCount();
		List iList=connect.toList(rs);
		int len=iList.size();
		for(int i=0;i<len;i++){
			iList.get(i).toString().replaceAll("=",":").replaceAll("{","" ).replaceAll("}","" );
		}
		
		return iList.toString();
		
		
		
	}
	public static void main(String[] args) throws SQLException {
		System.out.println(Tojson.tojson("product"));
	}
}

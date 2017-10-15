package jdbcconection;

import java.sql.*;

import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.List;

public class Connect {
	private Connection con=null;
	private Statement st=null;
	private ResultSet rs=null;
	private String sql=null;
	private String key=null;
    public Connect() {
		
	}
	public ResultSet sql(String sql){
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/ecommerce?useUnicode=true&characterEncoding=utf-8&useSSL=false";
		con=DriverManager.getConnection(url,"root","linjunhao");
		st=con.createStatement();
		rs=st.executeQuery("select * from "+sql);
		}catch(Exception e){
			e.printStackTrace();
		}
	 return rs;
	}
	
	public  List<Map<String, Object>> toList(ResultSet rs)throws SQLException {
		List<Map<String, Object>> results=new ArrayList<Map<String,Object>>();
		ResultSetMetaData rsmd=rs.getMetaData();
		int col=rsmd.getColumnCount();
		List<String> list=new ArrayList<String>();
		for(int i=0;i<col;i++){
			list.add(rsmd.getColumnName(i+1));
		}
		while(rs.next()){
			for(int i=0;i<col;i++){
				Map map=new HashMap<String,Object>();
				
				String key=list.get(i);
				Object value=rs.getString(list.get(i));
				map.put(key,value);
				results.add(map);
			}
		}
		return results;
	}
	public static String getInfo(int i,String product,String key) throws SQLException{
		Connect connect=new Connect();
		ResultSet rs= connect.sql("product");
		String string=connect.toList(rs).get(i).get(key).toString();
		return string;
		
	}
	public static void main(String[] args) throws SQLException {
		Connect connect=new Connect();
		ResultSet rs= connect.sql("product");
		String string=connect.toList(rs).toString();
		String string1=string.replace("=",":");
		String string2=string1.replace("{","" );
		String string3=string2.replace("}","");
		System.out.println(string3);
	}
	
}



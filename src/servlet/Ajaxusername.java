package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;






public class Ajaxusername extends HttpServlet{
	
	
	protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,
	IOException{
		 response.setCharacterEncoding("utf-8");
		//String userName=new String(request.getParameter("username").getBytes("ISO-8859-1"),"utf-8");
		String userName = request.getParameter("username");
		try{
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/ecommerce?useUnicode=true&characterEncoding=utf-8&useSSL=true";
			con=DriverManager.getConnection(url,"root","linjunhao");
			st=con.createStatement();
			String sql="select * from user where username='"+userName+"'";
			rs=st.executeQuery(sql);
			rs.last();
			int k;
			k=rs.getRow();
			if(k>0){
				
				 PrintWriter out = response.getWriter();  

			     String error = "<font color='red'>用户名已被注册</font>"; 
			     out.write(error);
			     
			}
			rs.close();
			st.close();
			con.close();
			
		System.out.println(k);;
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) 
	throws ServletException,IOException{
		doGet(request, response);
	}
}

<%@page import="java.io.PrintWriter"%>
<%@ page language="java" import="java.util.*"  import="java.sql.*" import="java.io.PrintWriter" pageEncoding="utf-8" %>
 
 <%
        response.setCharacterEncoding("utf-8");
        String content=request.getParameter("content");
 		System.out.println(content);
		try{
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/ecommerce?useUnicode=true&characterEncoding=utf-8&useSSL=true";
			con=DriverManager.getConnection(url,"root","linjunhao");
			st=con.createStatement();
			String sql="insert into tb_comments(comments) values('"+content+"')";
			st.executeUpdate(sql);
			
			
			PrintWriter o = response.getWriter();
			String success="发表成功";
		    o.write(success);
		   
			
			o.close();
			rs.close();
			st.close();
			con.close();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
 %>

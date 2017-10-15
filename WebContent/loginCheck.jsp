<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录</title>
</head>
<body>
	<%
		String userName=new String(request.getParameter("userName").getBytes("ISO-8859-1"),"utf-8");
		String passWord=new String(request.getParameter("passWord").getBytes("ISO-8859-1"),"utf-8");
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		if(userName.equals("")){
			response.sendRedirect("login.jsp");
		}
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/gooddetails?useUnicode=true&characterEncoding=gbk";
			con=DriverManager.getConnection(url,"root","linjunhao");
			st=con.createStatement();
			String query="select * from table_user where userName='"+userName+"'";
			rs=st.executeQuery(query);
			if(rs.next()){
				String query2="select * from table_user where password='"+passWord+"'";
				rs=st.executeQuery(query2);
				if(rs.next()){
					response.sendRedirect("success.jsp");
				}else{
					response.sendRedirect("login.jsp");
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	%>
</body>
</html>
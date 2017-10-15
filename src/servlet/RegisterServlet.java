package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;



public class RegisterServlet extends HttpServlet{
	public void wrong1(){
		String msg="用户已存在";
		int type=JOptionPane.YES_NO_CANCEL_OPTION;
		String title="提示";
		JOptionPane.showMessageDialog(null,msg,title,type);
	}
	public void right(){
		String msg="注册成功";
		int type=JOptionPane.YES_NO_CANCEL_OPTION;
		String title="恭喜";
		JOptionPane.showMessageDialog(null,msg,title,type);
	}
	protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,
	IOException{
		
		String userName=new String(request.getParameter("username").getBytes("ISO-8859-1"),"utf-8");
		String email=new String(request.getParameter("email").getBytes("ISO-8859-1"),"utf-8");
		String passWord1=new String(request.getParameter("password1").getBytes("ISO-8859-1"),"utf-8");
		String passWord2=new String(request.getParameter("password2").getBytes("ISO-8859-1"),"utf-8");
		String address=new String(request.getParameter("address").getBytes("ISO-8859-1"),"utf-8");
		String code=new String(request.getParameter("code").getBytes("ISO-8859-1"),"utf-8");
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
				wrong1();
				String data="用户已存在";
				response.getWriter().write(data);
		
			}else{
				String sql2="insert into user"+"(username,password,email,address,code)"+"values("+"'"+userName+"'"+","+"'"+passWord1+"'"+","+"'"+email+"'"+","+"'"+address+"'"+","+"'"+code+"'"+")";
				st.executeUpdate(sql2);
				response.getWriter().write("注册成功");
				response.sendRedirect("http://localhost:8080/dianshang/login.jsp");
			}
			rs.close();
			st.close();
			con.close();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	protected void doPost(HttpServletRequest request,HttpServletResponse response) 
	throws ServletException,IOException{
		doGet(request, response);
	}
}

package servlet;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.LoggingMXBean;

import javax.el.ArrayELResolver;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.swing.JOptionPane;

import com.sun.crypto.provider.RSACipher;

import loginRegister.LoginBean;
public class LoginServlet extends HttpServlet {
	public void noUser(){
		String msg="该用户不存在";
		int type=JOptionPane.YES_NO_CANCEL_OPTION;
		String title="提示";
		JOptionPane.showMessageDialog(null,msg,title,type);
	}
	public void errorPassword(){
		String msg="密码错误";
		int type=JOptionPane.YES_NO_CANCEL_OPTION;
		String title="提示";
		JOptionPane.showMessageDialog(null, msg,title,type);
	}
	protected void doGet(HttpServletRequest request,HttpServletResponse response)
	throws ServletException,IOException{
		String userName=new String(request.getParameter("userName").getBytes("ISO-8859-1"),"utf-8");
		String passWord=new String(request.getParameter("passWord").getBytes("ISO-8859-1"),"utf-8");
		
		try{
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/ecommerce?useUnicode=true&characterEncoding=utf-8&useSSL=false";
			con=DriverManager.getConnection(url,"root","linjunhao");
			st=con.createStatement();
			String sql="select * from user where username='"+userName+"'";
			rs=st.executeQuery(sql);
			int N=0;
			int P=0;
			while(rs.next()){
				if (userName.equals(rs.getString("username"))) {
					N=1001;
					if(passWord.equals(rs.getString("password"))){
						P=1001;
						
						LoginBean nn=new LoginBean();
						nn.setUserName(userName); 
						nn.setPassWord(passWord); 
						
						HttpSession session=request.getSession();
						ArrayList login=new ArrayList();
						login.add(nn);
						
						 session.setAttribute("login", login);
						 response.sendRedirect("http://localhost:8080/dianshang/main.jsp");
					}
				}else{
					N++;
				}
			}
			if(N<1001){
					noUser();
					response.sendRedirect("http://localhost:8080/dianshang/login.jsp");
					
			}else if(P<1001){
					errorPassword();
					response.sendRedirect("http://localhost:8080/dianshang/login.jsp");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	} 
	protected void doPost(HttpServletRequest request,HttpServletResponse response)
	  throws ServletException,IOException{
		doGet(request, response);
	}
}

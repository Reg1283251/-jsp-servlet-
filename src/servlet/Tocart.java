package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import loginRegister.LoginBean;

public class Tocart extends HttpServlet {
	protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,
	IOException{
		try{
			Connection con=null;
			Statement st=null;
			ResultSet rs=null;
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/ecommerce?useUnicode=true&characterEncoding=utf-8";
			con=DriverManager.getConnection(url,"root","linjunhao");
			st=con.createStatement();
			String pid="";
			HttpSession session=request.getSession();
			session.setAttribute("pid", "1");
			String pid2=session.getAttribute("pid").toString();
			String userName=session.getAttribute("userName").toString();
			String sql1="insert into cart(cartname,pid) values("+"'"+userName+"',"+"'"+pid+"')";
			rs=st.executeQuery(sql1);
			st.close();
			con.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	protected  void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}

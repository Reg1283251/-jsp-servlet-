package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commentBean.CommentBean;
import commentDao.CommentDao;

/**
 * Title: FindServlet
 * Description: Servlet实现类commentServlet实现具体的分页
 */

public class commentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public commentServlet() {
        super();
    }

    /**
     * 执行GET请求的方法
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
    	
    	
    	
    	int currPage = 1; // 当前页码
        if (request.getParameter("page") != null) { // 判断传递页码是否有效
            currPage = Integer.parseInt(request.getParameter("page"));// 对当前页码赋值
        }
        CommentDao dao = new CommentDao(); // 实例化CommentDao
        List<CommentBean> list = dao.find(currPage); // 查询所有评论
        request.setAttribute("list", list); // 将list放置到request中
        int pages; // 总页数
        int count = dao.findCount(); // 查询总记录数
        if (count % CommentBean.PAGE_SIZE == 0) { // 计算总页数,总记录数和每页显示的数
            pages = count / CommentBean.PAGE_SIZE; // 对总页数赋值
        } else {
            pages = count / CommentBean.PAGE_SIZE + 1; // 对总页数赋值
        }
        StringBuffer sb = new StringBuffer(); // 实例化StringBuffer
        for (int i = 1; i <= pages; i++) { // 通过循环构建分页导航条
            if (i == currPage) { // 判断是否为当前页
                sb.append("『" + i + "』"); // 构建分页导航条
            } else {
                // 构建分页导航条
                sb.append("<a href='commentServlet?page=" + i + "'>" + i + "</a>");
            }
            sb.append("　"); // 构建分页导航条
        }
        request.setAttribute("bar", sb.toString()); // 将分页导航条的字符串放置到request中
        // 转发到bookList.jsp页面
        request.getRequestDispatcher("details.jsp").forward(request, response);

    }
}

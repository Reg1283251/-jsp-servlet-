<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.*" %>
 
 
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>商品详情</title>
  <style>
    *{margin:0;padding:0}
	a{text-decoration: none;}
	/*box_top 最顶部面的区域*/
    .box_top
	{margin-left:auto;
	 margin-right:auto;width:1000px;
	 height:150px;
	 position:relative;
	 border-bottom:solid 1px rgba(104, 98, 93, 0.25)}
	 /*box_main 中间的主要区域*/
	.box_main
	{margin-top:40px;
	 margin-left:auto;
	 margin-right:auto;
	 width:1000px;
	 height:500px;
	 border-bottom:solid 1px rgba(104, 98, 93, 0.25);;
	 position:relative;
	 }
	 /*main_left 主要区域的左边区域*/
	 .main_left
	 {
	   width:35%;
	   height:100%;
       border-right:solid 1px rgba(104, 98, 93, 0.25);
	   float:left;
	   
	 }
	 /*main_left_top 主要区域的左边区域的下边区域*/
	 .main_left_top
	 {
	   width:100%;
	   height:80%;
	   
	   
	 }
	 /*main_left_bottom 主要区域的左边区域的下边区域*/
	 .main_left_bottom
	 {width:100%;
	  height:20%;
	  border-top:solid 1px rgba(104, 98, 93, 0.25);
	  
	 }
	 /*main_main 主要区域的中间区域*/
	 .main_main
	 {width:50%;
	  height:100%;
	  float:left;
	  border-right:solid 1px rgba(104, 98, 93, 0.25);
	  
	 }
	 /*main_right 主要区域的右边区域*/
	 .main_right
	 {width:14.5%;
	  height:100%;
	  float:left;
	  
	 }
	 /*box_bottom_center 下部区域的中间区域*/
	 .box_bottom_center
	 {
	   
	   width:60%;
	   float:left;
	   border-bottom:solid 1px rgba(104, 98, 93, 0.25);
	   border-right:solid 1px rgba(104, 98, 93, 0.25);
	   margin-top:40px;
	 }
	 /*box_bottom_left 下部区域的左边区域*/
	 .box_bottom_left
	 {
	   
	   width:17.5%;
	  
	   float:left;
	   margin-left:2.5%;
	   margin-top:40px;
	 }
	 /*box_bottom_right 下边区域的右边区域*/
	 .box_bottom_right
	 {
	  
	  width:17.5%;
	  border-bottom:solid 1px rgba(104, 98, 93, 0.25);
	  float:left;
	  margin-top:40px;
	  
	 }

	 #otherphoto li img{float:left;margin-left:12px;margin-top:4px}
	 #wupingxiangqing{background-color:rgba(124, 124, 124, 0.12);padding:15px;}
	 #chuxiaojia{margin-top:10px;}
	 #qian{color:#c40000;font-size:30px;}
	 #buy
	 {
	   width:135px;
	   height:50px;
	   background-color:#ffeded;
	   color:#cc3300;
	  
	 }
	 #tocar{
	   width:135px;
	   height:50px;
	   background-color:#c40000;
	   color:#ffffff}
	  #chuzhi{vertical-align: middle}
	  #morexiangqing.dt{margin-left:1px;}

	 dt{color:gray;margin-left:10px;float:left}
	 dd{margin-left:135px}
	 #yf,#ysfl,#tcxq,#sl{margin-top:25px;margin-left:16px;}
	 .none{list-style:none;margin-top:10px;}
	 <!--comments-->
	 a {
            text-decoration:none;
        }
        li {
            list-style:none;
        }
        .body {
            font-size: 14px;
            font-family: "微软雅黑";
            background:linear-gradient(#ffffff,red);
        }
        .box{
            width:570px;
            margin:0 auto;
            border:10px solid #ededef;
            padding:20px;
        }
        .box .info p{
            text-indent:2em;
            line-height:25px;
        }
        .box .comments {
            margin-top:10px;
        }
        .box .comments .inp{
            height:40px; 
            width:450px; 
            outline:none;
            border:1px solid #ccc;
            padding-left:15px;
        }
        .box .comments .btn{
            padding:12px 24px;
            background:green;
            color:#fff;
            margin-left:5px;
            transition: all 0.1s linear;
            border-radius:4px;
        }
        .box .comments .btn:hover{
            background:#57800a;
            transition:  all 0.1s linear;
            border-radius:4px;

        }
        .box .comments li {
            height:50px;
             width:570px;
             line-height:50px;
             border-bottom:1px dotted #ccc;
        }
  </style>
 </head>
 <body>
  <!--S-box_top-->
  <div class="box_top" id="box_top">
    
	<span style="font-size:12px">
	<i style="width:16px;height:16px;display:inline;float:left"></i><a href="index.jsp" style="float:left;">首页</a><p style="margin-top:1px;margin-left:100px">嗨，欢迎来到购物商城</p>
	</span>
	<div style="width:341px;height:48px;float:left;margin-top:35px"></div>
	<div style="margin-top:46px;margin-left:450px" id="search">
	  <input type="test" placeholder="请输入要商品关键字" style="width:281px;height:30px ;font-size:15px" >
	  <input class="input" type="button" value="搜索本站" style="width:100px;height:35px;color:white;background-color:#cc0000;border:1px solid #800000;border-redius:2px;box-shadow:0px 0px 13px 0px">
	</div>
  </div>
  <!--E-box_top-->
  <!--S-box_main-->
  <div class="box_main" id="box_main">
    <div class="main_left"id="main_left">
	 <div class="main_left_top" id="main_left_top">
	     <img style="width:100%;height:100%;" src="">
	 </div>
	 <div class="main_left_bottom"id="main_left_bottom">
	    <ul id="otherphoto" class="none">
		   <li><img style="width:70px;height:70px;" src=""></li>
		   <li><img style="width:70px;height:70px" src=""></li>
		   <li><img style="width:70px;height:70px" src=""></li>
		   <li><img style="width:70px;height:70px" src=""></li>
		</ul>
	 </div>
	</div>
	<div class="main_main"id="main_main">
	  <div style="margin-left:10px"id="somethingname">
	   <h1 id="somethinghead" style="font-size:16px;font-weight:700">正品神秘商品（网页完成后自动打开神秘商品）</h1>
	   <p id="activity" style="font-size:14px;color:#c40000">优惠活动在网页完成后开启！！！</p>
	   <h4 id="more"style="font-size:14px;color:#204ad7">详细信息尊请期待！！！<h4>
	  </div>
	  <div style="margin-left:10px">
	    <img src=""><p style="font-size:12px;float:right;margin-right:365px;margin-top:8px">全天猫商品通用</p></img>
	  </div>
	  <div id="wupingxiangqing">
	      <dl id="yuanjia">
		    <dt>价格</dt>
		    <%=request.getParameter("price")%>
			<dd>￥<del></del></dd>
		  </dl>
		  <dl id= "chuxiaojia">
			<dt style="padding-top:15px;" >促销价</dt>
			<dd id="qian"><em style=" vertical-align: middle;">￥</em><span style=" vertical-align: middle;">9997.00-9998.00</span></dd>
		  </dl>
		 
	   </div>
	      <div id="morexianqing">
	      <dl id="yf">
			<dt>运费</dt>
			<dd >地址从哪到哪</dd>
		  </dl>
		  <dl id="ysfl">
		    <dt>颜色分类</dt>
			<dd>还没有数据</dd>
		  </dl>
		   <dl id="tcxq">
		    <dt>套餐详情</dt>
			<dd>还没有数据</dd>
		  </dl>
		  <dl id="sl">
		    <dt>数量</dt>
			<dd>0</dd>
		  </dl>
		  <hr style="width:90%;margin-left:auto;margin-right:auto;border:1px color:rgba(104, 98, 93, 0.25);margin-top:20px;"></hr>
		  </div>
	      <div>
		   <input style="margin-left:70px; margin-top:25px"value="立即购买" id="buy"type="button">
		   <input  style="margin-left:80px" value="加入购物车"id="tocar"type="button">
		  </div>
	</div>
	<div class="main_right"id="main_right">
	  <div style="position:relative">
	    <hr style="width:100%;height:0px;border-top:solid 1px rgba(104, 98, 93, 0.25)"></hr>
		<span style="background-color:white;position:absolute;top:-8px;left:47px;font-size:12px;color:grey">看了又看</span>
	  </div>
	  <div>
	    <ul class="none">
		   <li></li>
		   <li></li>
		   <li></li>
		   <li></li>
		</ul>
	  </div>
	</div>
  </div>
  <!--E-box_main-->
  <!--S-box-bottom-->
  <div id="box_bottom">
    <!--S-box_bottom_left-->
    <div class="box_bottom_left" id="box_bottom_left"></div>
    <!--E-box_bottom_left-->
    <!--S-box_bottom_center-->
    <div class="box_bottom_center" id="box_bottom_center">
    	  <div class="box">
        <div class="comments">
            <div class="info">
                <p>
                    请在下面评论
                </p>
            </div>
            <input type="text" class="inp" id="content" placeholder="请输入评论..." /><a class="btn"  href="javascript:void(0)">发表评论</a>
            <ul>
           		<%
           		
        			Connection con=null;
        			Statement st=null;
        			ResultSet rs=null;
        			Class.forName("com.mysql.jdbc.Driver");
        			String url="jdbc:mysql://localhost:3306/ecommerce?useUnicode=true&characterEncoding=utf-8&useSSL=true";
        			con=DriverManager.getConnection(url,"root","linjunhao");
        			st=con.createStatement();
        			String sql="select comments from tb_comments order by id desc";
        			rs=st.executeQuery(sql);
        			while(rs.next()){
      			%>
        			
        		  <li><%=rs.getString("comments") %></li> 
        			
        		<%
        			}
        			rs.close();
        			st.close();
        			con.close();
        			
        		
				%>
            </ul>
        </div>
    </div>
    </div>
    <!--E-box_bottom_center-->
    <!--S-box_bottom_right-->
    <div class="box_bottom_right" id="box_bottom_right"></div>
    <!--E-box_bottom_right-->
  </div>
  <script src="js/jquery-3.2.1.js"></script>
    <script >
    $(document).ready(function(){
    	var contentDom=$("#content");
    	$(".btn").click(function(){
    		var content=$("#content").val();
    		if (content == "" && content.length == 0) {
                alert("请输入评论！");
                contentDom.focus();
                return false;
            }
        	$.ajax({
        		type: "POST",
        		url: "data.jsp",
        		data:{"content":content},
        		datatype:"text",
        		async: true,
        		error: function(request) {
        			alert("Connection error");
        		},
        		success: function(data) {
        			alert(data);
        			window.location.reload();
        		}
        	});
    	});
    });
    
    
    </script>
 </body>
</html>

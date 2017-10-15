<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="jdbcconection.Connect" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script src="js/jquery-3.2.1.js"></script>
    <script>
    	$(document).ready(function(){
    		$('.buy,.addtocart').bind('click',function(){
    			alert("您还未登录");
    			window.location.href="register.jsp";
    		});
    	});
    </script>
    <style>
    	/*默认样式*/
    	*{
    		margin:0; 
    		padding: 0; 
    		font-size;12px; 
    		text-decoration: none; 
    		list-style-type: none;
    		}
    	#top {
    		margin: 0 auto;
    		 width:1000px; 
    		 height: 200px; 
    		 border-bottom: 1px solid gray;
    		 }
    	#sign ul li a{
    		float:right;
    		 }
    	#sign ul li a:first-child{
    		margin-left: 20px;
    		}
    	#sign ul li{
    		display:inline;
    		 color:silver;
    		  }
    	/*主体样式*/
    	#main{
    		margin: 0 auto;
    		 width:1000px; 
    		 height: 1400px; 
    		 border-bottom: 1px solid gainsboro; 
    		 position:relative;
    		 }
    
    	.list{
    		margin: 0 auto;
    		width:1000px; 
    		height:410px;
    		position:relative;
    		top:20px;
    		}
    	.product{
    		height:400px; 
    		width:230px;
    		border:1px dotted grey;
    		border-top:none;
    		}
    	.productphoto{
    		height:250px; 
    		width:220px;
    		margin-left:5px;
    		margin-top:10px;
    		}
    	.price{
    		height:50px;
    		width:230px;
    		}
    	.price a{
    		color:lightgray;
    		font-size: 12px;
    	}
    	.price span{
    		color:#C40000;
    	}
    	.button{
    		position:relative;
    		bottom: -20px;
    		margin-left:3px;
    		width:230px; 
    		height:50px;
    		}
    	.buy{
    		float:left;
    		height: 50px; 
    		width:100px;
    		color:gray;
    		border-radius:5px;
    		margin-left: 7px; 
			padding:10px;
			background-color:#EFEFEF;
    		}
    	.addtocart{
    		margin-left: 7px; 
			padding:10px;
			background-color:#EFEFEF;
			color:gray;
    		height: 50px; 
    		width:100px;
    		border-radius:5px;
  
    	}
    	.button .buy:hover{
    		background-color:gray;
    		color:white;
    	}
    	.button .addtocart:hover{
    		background-color:gray;
    		color:white;
    	}
    	#main div ul li{
    		float:left;
    		margin-left:10px;
    		}
    	/*页脚的样式*/
    	#footer{
    		width:100%;
    		height:200px;
    		max-height: 500px; 
    		max-width: 2000px;
    		position:relative; 
    		background-color: black;
    		color:gainsboro
    		}
    	.describe{
    		width:60%; 
    		height: 90%; 
    		border-right:1px solid ghostwhite;
    		position:absolute;
    		top:5%;
    		}
    	.describe p{
    		position:absolute; 
    		top:80px;
    		}
    	.friendlink{
    		width:30%; 
    		height: 90%;
    		position:absolute; 
    		right:9%;
    		top:10%; 
    		}
    </style>
</head>
<body>
    <!--网页顶部-->
    <div id="top">
        <!--导航栏顶部的区域-->
        <div>
            <!--登陆及注册链接-->
            <div id="sign">
                <ul>
                	<li><span>欢迎来到本购物平台</span></li>
                    <li><a href="register.jsp">注册</a></li>
                    <li><a href="login.jsp">登录</a></li>   
                </ul>
            </div>
        </div>
        <!--导航栏-->
        <div></div>
    </div>
    <!--网页的主体内容部分-->
    <div id="main">
        <!--第一列商品-->
        <div class="list">

            <ul>
            <%--jsp查询数据并导入--%>
    	
                <li>
                    <div class="product">
                        <div class="productphoto"><a href="detail.jsp"><img src=<%=Connect.getInfo(1,"product","src") %>/></a></div>
               
                        <div class="price">
                        	<a href="#">
                        	<%=Connect.getInfo(2,"product","info") %>
                        	</a><br>
                        	<span><%=Connect.getInfo(3,"product","price") %></span>
                        </div>
                        <div class="button">
                            <input class="buy" type="button" value="购买"/>
                            <input class="addtocart" type="button" value="购物车"/>
                        </div>
                    </div>
                 </li>		
                 <li>
                    <div class="product">
                        <div class="productphoto"><a href=""><img src=<%=Connect.getInfo(5,"product","src") %>/></a></div>
                        <div class="price">
                        	<a href="#">
                        	<%=Connect.getInfo(6,"product","info") %>
                        	</a><br>
                        	<span><%=Connect.getInfo(7,"product","price") %></span>
                        </div>
                        <div class="button">
                            <input class="buy" type="button" value="购买"/>
                            <input class="addtocart" type="button" value="购物车"/>
                        </div>
                    </div>
                 </li>
                 <li>
                    <div class="product">
                        <div class="productphoto"><a href=""><img src=<%=Connect.getInfo(9,"product","src") %>/></a></div>
                        <div class="price">
                        	<a href="#">
                        	<%=Connect.getInfo(10,"product","info") %>
                        	</a><br>
                        	<span><%=Connect.getInfo(11,"product","price") %></span>
                        </div>
                        <div class="button">
                            <input class="buy" type="button" value="购买"/>
                            <input class="addtocart" type="button" value="购物车"/>
                        </div>
                    </div>
                 </li>
                 <li>
                    <div class="product">
                        <div class="productphoto"><a href=""><img src=<%=Connect.getInfo(13,"product","src") %>/></a></div>
                        <div class="price">
                        	<a href="#">
                        	<%=Connect.getInfo(14,"product","info") %>
                        	</a><br>
                        	<span><%=Connect.getInfo(15,"product","price") %></span>
                        </div>
                        <div class="button">
                            <input class="buy" type="button" value="购买"/>
                            <input class="addtocart" type="button" value="购物车"/>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <!--第二列商品-->
         <div class="list">

            <ul>
            <%--jsp查询数据并导入--%>
    	
                <li>
                    <div class="product">
                        <div class="productphoto"><a href=""><img src=<%=Connect.getInfo(17,"product","src") %>/></a></div>
                        <div class="price">
                        	<a href="#">
                        	<%=Connect.getInfo(18,"product","info") %>
                        	</a><br>
                        	<span><%=Connect.getInfo(19,"product","price") %></span>
                        </div>
                        <div class="button">
                            <input class="buy" type="button" value="购买"/>
                            <input class="addtocart" type="button" value="购物车"/>
                        </div>
                    </div>
                </li>		
                 <li>
                    <div class="product">
                        <div class="productphoto"><a href=""><img src=<%=Connect.getInfo(21,"product","src") %>/></a></div>
                        <div class="price">
                        	<a href="#">
                        	<%=Connect.getInfo(22,"product","info") %>
                        	</a><br>
                        	<span><%=Connect.getInfo(23,"product","price") %></span>
                        </div>
                        <div class="button">
                            <input class="buy" type="button" value="购买"/>
                            <input class="addtocart" type="button" value="购物车"/>
                        </div>
                    </div>
                </li>
                 <li>
                    <div class="product">
                        <div class="productphoto"><a href=""><img src=<%=Connect.getInfo(25,"product","src") %>/></a></div>
                        <div class="price">
                        	<a href="#">
                        	<%=Connect.getInfo(26,"product","info") %>
                        	</a><br>
                        	<span><%=Connect.getInfo(27,"product","price") %></span>
                        </div>
                        <div class="button">
                            <input class="buy" type="button" value="购买"/>
                            <input class="addtocart" type="button" value="购物车"/>
                        </div>
                    </div>
                </li>
                 <li>
                    <div class="product">
                        <div class="productphoto"><a href=""><img src=<%=Connect.getInfo(29,"product","src") %>/></a></div>
                        <div class="price">
                        	<a href="#">
                        	<%=Connect.getInfo(30,"product","info") %>
                        	</a><br>
                        	<span><%=Connect.getInfo(31,"product","price") %></span>
                        </div>
                        <div class="button">
                            <input class="buy" type="button" value="购买"/>
                            <input class="addtocart" type="button" value="购物车"/>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <!--网页的底部-->
    <div id="footer">
    	<!--网站的声明-->
    	<div class="describe">
    		<p>
    			个人制作的非商业的电商平台。
    		</p>
            
    	</div>
    	<!--友情链接-->
    	<div class="friendlink">
    		<h3>友情链接</h3>
    		<ul>
    			<li><a href="">aaaaaa</a></li>
    			<li><a href="">bbbbbbbb</a></li>
    			<li><a href="">cccccccccc</a></li>
    			<li><a href="">dddddddd</a></li>
    			<li><a href="">eeeeeeeeeeee</a></li>
    			<li></li>
    			<li></li>
    		</ul>
    	</div>
    </div>
    
    
 
    
</body>
</html>

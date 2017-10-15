<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="jdbcconection.Connect" %>
<%@page import="loginRegister.LoginBean" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script src="js/jquery-3.2.1.js"></script>
 <style>
 *{
 	margin:0;
 	padding:0;
 }
 #main{
 	margin:0 auto;
 	width:1080px;
 	height:800px;
 	margin-bottom:15px;
 }
button{
	margin:10px;
	padding:10px;
	background-color:gray;
	color:white;
	margin-left:55px;
}

ul{
	list-style:none;
	padding:0;margin:0;
	}
.goods li{
	display:inline-block;
	border:1px solid #ddd;
	padding:10px;
	margin:10px;
	height:350px;
	width:220px;
	}
.goods li:hover{
	background-color:
	#efefef;
	}
.goods .price{
	color:#f00;
	font-weight:bold;
	}
.goods .price::before{
	content:"￥";
}
</style>
 <script>
window.onload = function(){
	var goods = document.getElementsByClassName('goods')[0];

	// 用于保存购物车商品信息
	var carList = [];

	// 先获取当前cookie
	var cookies = document.cookie.split('; ');
	for(var i=0;i<cookies.length;i++){
		var arr = cookies[i].split('=');
		if(arr[0] === 'carlist'){
		carList = JSON.parse(arr[1]);
		}
	}

	// 事件委托
	goods.onclick = function(e){
		e = e || window.event;
		var target = e.target || e.srcElement;

	// 添加到购物车
	if(target.tagName.toLowerCase() === 'button'){

// 获取当前li
var currentLi = target.parentElement.parentElement;
var children = currentLi.children;
var currentGUID = currentLi.getAttribute('data-guid');

// 先创建一个对象保存当前商品信息
var goodsObj = {};
goodsObj.guid = currentGUID;
goodsObj.qty = 1;
goodsObj.name = children[1].innerHTML;
goodsObj.price = children[2].innerHTML;
goodsObj.imgUrl = children[0].src;

// 如果cookie为空，则直接添加
if(carList.length===0){
// 添加到carList
carList.push(goodsObj);
}else{
// 先判断cookie中有无相同的guid商品
for(var i=0;i<carList.length;i++){
// 如果商品已经存在cookie中，则数量+1
if(carList[i].guid === currentGUID){
carList[i].qty++;
break;
}
}

// 如果原cookie中没有当前商品
if(i===carList.length){
// 添加到carList
carList.push(goodsObj);
}

}
// 存入cookie
// 把对象/数组转换诚json字符串：JSON.stringify()
document.cookie = 'carlist=' + JSON.stringify(carList);
}

}
}
</script>
 
    <style>
    	
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
    	#cart a{
    		margin-left:575px;
    		padding:10px;
    		background-color:red;
    		color:white;
    		width:80px;
    		text-decoration:none;
    		height:30px;
    		margin-bottom:10px;
    		position:relative;
    		top:-15px;
    		border-radius:5px;
    	}
    	#cart:hover{
    		background-color:
    	}
    	
    </style>
</head>
<body>
	<%--获取保存在session中的对象的数据 --%>
	<%
	String userName=null;
	ArrayList login=(ArrayList)session.getAttribute("login");
	if(login==null||login.size()==0){
		response.sendRedirect("http://localhost:8080/dianshang/login.jsp");
		
	}else{
		for(int i=login.size()-1;i>=0;i--){
			LoginBean nn=(LoginBean)login.get(i);
			userName=nn.getUserName();
		}
	}
		
	%>
    <!--网页顶部-->
    <div id="top">
        <!--导航栏顶部的区域-->
        <div>
            <!--登陆及注册链接-->
            <div id="sign">
                <ul>
                	<li><span>欢迎来到本购物平台</span></li>
                    
                    <li><span>欢迎您，<%=userName%></span></li>   
                </ul>
            </div>
        </div>
        <!--导航栏-->
        <div></div>
    </div>
    <!--网页的主体内容部分-->
     <div id="main">
    	<ul class="goods">
			<li data-guid="g01">
					<img src=<%=Connect.getInfo(1,"product","src") %>>
				<p><%=Connect.getInfo(2,"product","info") %></p>
				<p class="price"><%=Connect.getInfo(3,"product","price") %></p>
				<div class="add2cart">
					<button>添加到购物车</button>
				</div>
				
			</li>
			<li data-guid="g02">
				
				<img src=<%=Connect.getInfo(5,"product","src") %>>
				<p><%=Connect.getInfo(6,"product","info") %></p>
				<p class="price"><%=Connect.getInfo(7,"product","price") %></p>
				<div class="add2cart">
					<button>添加到购物车</button>
				</div>
				
			</li>
			<li data-guid="g03">
				
				<img src=<%=Connect.getInfo(9,"product","src") %>>
				<p><%=Connect.getInfo(10,"product","info") %></p>
				<p class="price"><%=Connect.getInfo(11,"product","price") %></p>
				<div class="add2cart">
					<button>添加到购物车</button>
				</div>
				
			</li>
			<li data-guid="g04">
				
				<img src=<%=Connect.getInfo(13,"product","src") %>>
				<p><%=Connect.getInfo(14,"product","info") %></p>
				<p class="price"><%=Connect.getInfo(15,"product","price") %></p>
				<div class="add2cart">
					<button>添加到购物车</button>
				</div>
			</li>
		
			<li data-guid="g05">
					<img src=<%=Connect.getInfo(17,"product","src") %>>
				<p><%=Connect.getInfo(18,"product","info") %></p>
				<p class="price"><%=Connect.getInfo(19,"product","price") %></p>
				<div class="add2cart">
					<button>添加到购物车</button>
				</div>
				
			</li>
			<li data-guid="g06">
				
				<img src=<%=Connect.getInfo(21,"product","src") %>>
				<p><%=Connect.getInfo(22,"product","info") %></p>
				<p class="price"><%=Connect.getInfo(23,"product","price") %></p>
				<div class="add2cart">
					<button>添加到购物车</button>
				</div>
				
			</li>
			<li data-guid="g07">
				
				<img src=<%=Connect.getInfo(25,"product","src") %>>
				<p><%=Connect.getInfo(26,"product","info") %></p>
				<p class="price"><%=Connect.getInfo(27,"product","price") %></p>
				<div class="add2cart">
					<button>添加到购物车</button>
				</div>
				
			</li>
			<li data-guid="g08">
				
				<img src=<%=Connect.getInfo(29,"product","src") %>>
				<p><%=Connect.getInfo(30,"product","info") %></p>
				<p class="price"><%=Connect.getInfo(31,"product","price") %></p>
				<div class="add2cart">
					<button>添加到购物车</button>
				</div>
			</li>
		</ul>
	</div>
    <!--第二列商品-->
    <div id="cart"><a href="cart.html">进入购物车</a></div>
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

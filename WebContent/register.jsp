<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html >
<html>
<head>

<title>Insert title here</title>
<script src="js/jquery-3.2.1.js"></script>
<script>
	$(document).ready(function(){
		$('#register').click(function(){
			var username=$('#username').val();
			var password=$('#password').val();
			var password2=$('#password2').val();
			var email=$('#email').val();
			var address=$('#street_address').val();
			var code=$('#code').val();
			if(username==''||username==null){
				alert("请输入用户名");
				return false;
			}else if(password==''||username==null){
				alert("请输入密码");
				return false;
			}else if(password==''||username==null){
				alert("请输入确认密码");
			    return false;
			}else if(password!=password2){
				alert("密码不一致，请重新输入");
				$('#password2').text('');
			}else if(address==''||address==null){
				alert("请输入地址");
				return false;
			}else if(code==''||code==null){
				alert("请输入邮编");
				return false;
			}
		});
		$('input:text,#email,input:password').focus(function(){
		    $(this).css("background-color","#F1F1F1");
		});
		$('input:text,#email,input:password').blur(function(){
		    $(this).css("background-color","white");
		});
		
		var username=$('#username').val();
		$('#username').blur(function(){
			var username=$('#username').val();
			$.ajax({
				type: "POST",
				url: "Ajaxusername",
				data:{"username":username},
				datatype:"text",
				async: true,
				error: function(request) {
					alert("Connection error");
				},
				success: function(data) {
					$("#data").html(data);
				}
			});
		});	
	});
	
</script>
<head>
    <meta charset="utf-8" />
    <title>注册</title>
    <style>
    	/*网页整体样式*/
		*{
			margin: 0px; 
		  	padding:0px;
		  }
		body{
			font-family: "微软雅黑"; 
			font-size: 15px;
			}
		#wrapper{
			width:600px; 
			margin: 0 auto;
			}
		/*一级标题和二级标题的大小、间距及颜色背景*/
		h1{
			font-weight: 500px; 
			font-size: 28px; 
			margin-top: 20px; 
			margin-bottom: 20px;
			}
		h2{
			background-color: #dedede; 
			border-bottom: 1px solid #d4d4d4; 
			border-top:1px solid #d4d4d4;
			color:#fff; 
			font-size:16px; 
			margin: 12px; padding: 0.3em 1em; 
			text-transform: uppercase; 
			font-weight: 500;
			}
		h2.account{
			background-color: #0B5586;
			}
		h2.address{
			background-color: #4494c9;
			}
		/*表单区域fieldset,ul,li的背景和间距,label设置为块形式显示*/
		fieldset{
			background-color:#f1f1f1; 
			border: none; 
			margin-bottom: 12px;
			overflow: hidden;
			padding:0 10px;
			}
		ul{
			background-color:#fff; 
			border:1px solid #eaeaea; 
			list-style: none; 
			margin: 12px; 
			padding: 12px;
			}
		li{
			margin: 0.5em 0;
			}
		label{
			display: inline-block; 
			padding:3px 6px; 
			text-align: right; 
			width:150px; 
			vertical-align: top;}
		/*分别设置各个表单元素的样式*/
		.small{
			width:150px; 
			height:20px;
			}
		.medium{
			width:200px; 
			height:20px;
			}
		.large{
			width:300px; 
			height:20px;
			}
		.create_profile{
			font-size: 20px; 
			position: absolute;left:243px; 
			font-style:italic ;
			color: white;
			background-color: gray;
			
			}
		.submit{
			position:relative;
			height: 20px; 
			width:600px
			}
		input[type="text"],#email{
			background-color: white;
		}
		
    </style>
</head>
<body>
   <div id="wrapper">
   		<h1>创建您的帐号</h1>
   		<form action="http://localhost:8080/dianshang/RegisterServlet" method="post" >
   		 <p><i>Please complete the form. Mandatory fields are marked with a</i><em>*</em></p>
   			<!--账户区域开始 -->
   			<fieldset>
   				<legend>账户信息</legend>
   				<h2 class="account">您好，请完善您的信息</h2>
   				<ul>
   					<li>
   						<label for="username" >用户名 <em>*</em></label>
   						<input type="text" id="username" name="username"  class="medium" autofocus required/>
   						<span id="data"></span>
   					</li>
   					<li>
   						<label for="email">E-mail <em>*</em></label>
   						<input type="email" id="email" name="email" class="medium" required/>
   					</li>
   					<li>
   						<label for="password">密码 <em>*</em></label>
   						<input type="password" id="password" name="password1" class="medium" placeholder="不超过15个字符" required/>
   					</li>
   					<li>
   						<label for="password2">确认密码 <em>*</em></label>
   						<input type="password" id="password2" name="password2" class="medium" placeholder="不超过15个字符" required/>
   					</li>
   				</ul>
   			</fieldset>
   			<!--账户区域结束-->
   			<!--地址区域开始-->
   			<fieldset>
   				<h2 class="address">邮编信息</h2>
   				<ul>
   					<li>
   						<label for="street_address">详细地址 <em>*</em></label>
   						<input type="text" id="street_address" name="address" class="large" required/>
   					</li>
					<li>
						<label for="code">邮编 <em>*</em></label>
   						<input type="text" id="code" name="code" class="small" required/>
					</li>
   				</ul>
   			</fieldset>
   			
   				
   			<!--地址区域结束-->
   			
   			<div class="submit">
   				<input type="submit" id="register" class="create_profile" value="创建账户" />
   			</div>
   			<div id="formwrapper"></div>
   		</form>
   </div> 

</body>
</html>
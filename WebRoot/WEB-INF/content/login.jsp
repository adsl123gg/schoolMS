<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../head.jsp" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>登陆</title>
	
</head>
<body class="container">

	<div class="span8 offset2" style="margin-top:100px">
		
		<div id="msg" class="alert">
			<a class="close" data-dismiss="alert">×</a>
			<strong></strong>
        </div>
	  
		<form class="well" id="form" action="login" method="post">
				<div style="font-size:32px;height:40px;padding-left:125px;margin-bottom:20px"><strong>河南理工教务管理系统</strong></div>
				  <span style="margin-left:155px">账号</span>
				  <input id="username" type="text" class="span3" name="student.username">
				  <br />
				  <span style="margin-left:155px">密码</span>
				  <input id="password" type="password" class="span3" name="student.passwd">
				  <br/>
				  <span style="margin-left:148px">当前登录身份</span>
				  <input type="radio" name="p" value="student" >学生
				  <input type="radio" name="p" value="teacher">教师
				  <input type="radio" name="p" value="admin" checked="checked">管理人员
				<a id="btn" type="btn" class="btn btn-primary" style="margin-left:325px;margin-top:20px">进入系统</a>
		  
		</form>
		
	</div>
	
	
	<script type="text/javascript">
		$(document).ready(function(){
		
				$("#msg").hide();
				
				$("#username").blur(function(){
  					if($("#username").val()==""){
  						$("#msg").show();
  						$("#msg").children("strong").text("用户名不能为空");
  					}else{
  						$("#msg").hide();
  					}
  				});
  				
  				$("#password").blur(function(){
  					if($("#password").val()==""){
  						$("#msg").show();
  						$("#msg").children("strong").text("密码不能为空");
  					}else{
  						$("#msg").hide();
  					}
  				});
  				
  				$("#btn").click(function(){
  					if($("#password").val()!=""&&$("#username").val()!=""){
  						$("#form").submit();
  					}else{
  						$("#msg").show();
  						$("#msg").children("strong").text("账户名或密码不能为空");
  					}
  				});
  				
		});
	</script>
	
</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../head.jsp" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>班级管理</title>
	
	<style type="text/css">
		#add{
			position:absolute;
			top:80px;
			right:20px;
			font-size:20px;
		}
	</style>
	
</head>
<body class="container">

	<div class="navbar navbar-inverse navbar-fixed-top" >
              <div class="navbar-inner">
                <div class="container">
                  <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </a>
                  
                  <div class="nav-collapse collapse navbar-inverse-collapse offset2">
                    <ul class="nav">
                      <li ><a href="adminClass">班级管理</a></li>
                      <li ><a href="adminTeacherInfo">教师管理</a></li>
                     <li ><a href="adminCourse">课程管理</a></li>
                    </ul>
                    
                    <ul class="nav pull-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"> ${admin.name }<b class="caret"></b></a>
							<ul class="dropdown-menu">
							<li><a data-toggle="modal" href="#CMM">修改密码</a></li>
							  <li><a href="adminExit">退出</a></li>
							</ul>
						</li>
                    </ul>
                  </div><!-- /.nav-collapse -->
                </div>
              </div><!-- /navbar-inner -->
    </div>
	
	
	<div id="code" class="alert" style="margin-top:50px">
		<a class="close" data-dismiss="alert">×</a>
		<strong></strong>
		<input id="codeP" type="hidden" c="${code}"></input>
    </div>
    
    
     <div id="CMM" class="modal hide fade in" style="display:none;">
	            <div class="modal-header">
	              <a class="close" data-dismiss="modal">×</a>
	              <h3>修改密码</h3>
	            </div>
	            <div class="modal-body">
					<form id="form" action="adminChangePWD" method="post">
						<div>
							<span class="" style="margin-left:103px">请输入旧密码</span>
						  	<input type="password" id="oldpasswd" name="oldpasswd">
						  	<br>
							<span class="control-label" style="margin-left:103px">请输入新密码</span>
						  	<input type="password" id="newPwd" name="newPwd">
						  	<br>
							<span class="control-label" style="margin-left:75px">请再次输入新密码</span>
						  	<input type="password" id="newPwd2" name="newPwd2">
						</div>
						<div id="msg" class="alert">
							<a class="close" data-dismiss="alert">×</a>
							<strong>你好</strong>
				        </div>
					</form>
	            </div>
	            <div class="modal-footer">
	              <a href="#" class="btn" data-dismiss="modal">关闭</a>
	              <a href="#" id="btn" class="btn btn-primary">保存</a>
	            </div>
	          </div>
    
  </body>
  
  <script type="text/javascript">
  	$(document).ready(function(){
  	
  		$("#msg").hide();
  		$("#code").hide();
  		
  		var c=$("#codeP").attr("c");
  		if(c=='updateadminpwd_fail'){
  			$("#code").children("strong").text("密码修改失败");
  			$("#code").show();
  		}else if(c=='updateadminpwd_success'){
  			$("#code").children("strong").text("密码修改成功");
  			$("#code").show();
  		}else if(c=='addclass_success'){
  			$("#code").children("strong").text("添加班级成功");
  			$("#code").show();
  		}else if(c=='addclass_fail'){
  			$("#code").children("strong").text("添加班级失败");
  			$("#code").show();
  		}else if(c=='updateclass_success'){
  			$("#code").children("strong").text("更新班级成功");
  			$("#code").show();
  		}else if(c=='updateclass_fail'){
  			$("#code").children("strong").text("更新班级失败");
  			$("#code").show();
  		}else if(c=='addstudent_success'){
  			$("#code").children("strong").text("添加同学成功");
  			$("#code").show();
  		}else if(c=='addstudent_fail'){
  			$("#code").children("strong").text("添加同学失败");
  			$("#code").show();
  		}else if(c=='updatestudent_fail'){
  			$("#code").children("strong").text("更新同学失败");
  			$("#code").show();
  		}else if(c=='updatestudent_success'){
  			$("#code").children("strong").text("更新同学成功");
  			$("#code").show();
  		}else if(c=='addteacher_fail'){
  			$("#code").children("strong").text("添加教师失败");
  			$("#code").show();
  		}else if(c=='addteacher_success'){
  			$("#code").children("strong").text("添加教师成功");
  			$("#code").show();
  		}else if(c=='updateteacher_fail'){
  			$("#code").children("strong").text("更新教师失败");
  			$("#code").show();
  		}else if(c=='updateteacher_success'){
  			$("#code").children("strong").text("更新教师成功");
  			$("#code").show();
  		}else if(c=='addcourse_success'){
  			$("#code").children("strong").text("添加课程成功");
  			$("#code").show();
  		}else if(c=='addcourse_fail'){
  			$("#code").children("strong").text("添加课程失败");
  			$("#code").show();
  		}else if(c=='updatecourse_success'){
  			$("#code").children("strong").text("更新课程成功");
  			$("#code").show();
  		}else if(c=='updatecourse_fail'){
  			$("#code").children("strong").text("更新课程失败");
  			$("#code").show();
  		}
  		
  		
  		$("#btn").click(function(){
  			if($("#newPwd").val()==''||$("#newPwd2").val()==''||$("#oldpasswd").val()==''){
  				$("#msg").show();
  				$("#msg").children("strong").text("密码不能为空");
  			}else if($("#newPwd").val() != $("#newPwd2").val()){
  				$("#msg").show();
  				$("#msg").children("strong").text("两次密码不相同");
  			}else if($("#newPwd").val() == $("#newPwd2").val()){
  				$("#form").submit();
  			}
  			
  		});
  		
  	});
  </script>
	
</body>
</html>
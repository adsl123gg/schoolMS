<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./admin_head.jsp" %>
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

	<div class="" style="margin-top:50px">
	<span id="add" class="btn btn-primary" data-toggle="modal" href="#modal">添加班级</span>
		
      <div class="well">
		<table class="table">
			<c:forEach items="${clazzs}" var="clazz" >
			 	<tr>
					<td width="300px">
						<span class="btn btn-info btn-large c " rel="popover" data-content="电气自动化学院" data-original-title="${clazz.classname}">
							<a href="adminClassInfo?classid=${clazz.id}" style="color:white">
							${clazz.classname}</a>
							<a href="#"><i class="icon-edit"  data-toggle="modal" onclick="updateClass(this)" href="#edit"></i></a>
							<a onclick="delClass(this)" href="javascript:;" ><i class="icon-trash"></i></a>
							<input type="hidden" id="${clazz.id}" >
						</span>
						<span class="offset1">班级总人数为 ${fn:length(clazz.studentSet)} </span>
						<a href="adminClassCourse?classid=${clazz.id}"><span class="btn btn-primary offset2">查看课表</span></a>
					</td>
					
				</tr>
			</c:forEach>
			
		</table>
          </div>
          
          <!-- 添加班级的框  -->
		<div id="modal" class="modal hide fade in" style="display: none;">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>添加班级</h3>
            </div>
            <div class="modal-body">
				<form class="form-horizontal" method="post" id="addClassForm" action="addClass">
					<fieldset>
					  <div class="control-group">
						<label class="control-label" >班级名称</label>
						<div class="controls">
						  <input type="text" id="addClassContent" name="clazz.classname">
						</div>
						<div id="addClass_msg" class="alert">
							<a class="close" data-dismiss="alert">×</a>
							<strong></strong>
				        </div>
					  </div>
					   
					</fieldset>
				</form>
            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">关闭</a>
              <a href="#" class="btn btn-primary" id="addClass">保存</a>
            </div>
          </div>
		  
		  <!-- 修改名称的框  -->
		  <div id="edit" class="modal hide fade in" style="display: none;">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>修改班级</h3>
            </div>
            <div class="modal-body">
				<form class="form-horizontal" id="updateClassForm" action="updateClass" method="post">
					<fieldset>
					  <div class="control-group">
						<label class="control-label" id="newClass"></label>
						<div class="controls">
						  <input type="text" id="updateClassContent" name="classcontent">
						  <input type="hidden" name="classid" id="classid">
						</div>
						<div id="updateClass_msg" class="alert">
							<a class="close" data-dismiss="alert">×</a>
							<strong></strong>
				        </div>
					  </div>
					   
					</fieldset>
				</form>
            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">关闭</a>
              <a href="#" class="btn btn-primary" id="updateClass">保存</a>
            </div>
          </div>
          
    </div>
	
	<script type="text/javascript">
	
		var classname;
		var id;
		
		$(document).ready(function(){
			
			$('.c').popover('hide');
			$("#addClass_msg").hide();
			$("#updateClass_msg").hide();
			
			$("#addClass").click(function(){
				if($("#addClassContent").val()==''){
					$("#addClass_msg").show();
					$("#addClass_msg").children("strong").text("班级名称不能为空");
				}else{
					$("#updateClass").submit();
				}
			});
			
			$("#updateClass").click(function(){
				var content=$("#updateClassContent").val();
				//alert(content+"000000"+classname);
				if(content==classname){
					$("#updateClass_msg").show();
					$("#updateClass_msg").children("strong").text("班级名称和原来的相同");
				}else if(content==""){
					$("#updateClass_msg").show();
					$("#updateClass_msg").children("strong").text("班级名称不为空");
				}else{
					$("#updateClassForm").submit();
					//$.get("updateClass",{classid:id,classcontent:content});
				}
			
			});
			
		});
		
		
		function updateClass(obj){
			 classname=$(obj).parent().parent().children("a").eq(0).text().trim();
			 classname=classname.replace(/[\r\n]/g,"").trim();
			 id=$(obj).parent().parent().children("input").attr("id");
			
			$("#classid").val(id);
			$("#newClass").text("将“"+classname+"”修改为");
		}
		
		function delClass(obj){
				classname=$(obj).parent().children("a").eq(0).text();
				rs=confirm("确定删除"+classname+"吗？");
				id=$(obj).parent().children("input").attr("id");
				if(true==rs){
					$.get("delClass",{classid: id},
					  function(rs){
					  alert(rs);
					    if(rs=="deleteclass_success"){
					    	$(obj).parent().parent().parent().remove();
					    	$("#code").children("strong").text(classname+"删除班级成功！");
					    	$("#code").show();
					    }else if(rs=="deleteclass_fail"){
					    	$("#code").children("strong").text(classname+"删除班级失败！");
					    	$("#code").show();
					    }
				 	}); 
				}
				
		}
			
	</script>
	
</body>
</html>
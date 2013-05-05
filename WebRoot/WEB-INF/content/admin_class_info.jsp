<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./admin_head.jsp" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>班级信息</title>
	
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
	<span id="add" class="btn btn-primary" data-toggle="modal" href="#modal">添加学生</span>
	
	<!-- 添加学生的框 -->
	<div id="modal" class="modal hide fade in" style="display:none;">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>添加学生</h3>
            </div>
            <div class="modal-body">
              <p>
				<form class="form-horizontal" id="addStudentForm" action="addStudent" method="post">
					<fieldset>
					  <div class="control-group">
						<label class="control-label" >姓名</label>
						<div class="controls">
						  <input type="text" name="student.name" id="addname">
						</div>
					  </div>
					   <div class="control-group">
						<label class="control-label" >学号</label>
						<div class="controls">
						  <input type="text" name="student.username" id="addusername">
						</div>
					  </div> 
					  <div class="control-group">
						<label class="control-label" >出生日期</label>
						<div class="controls">
						  <input type="text" name="student.birth" id="addbirth">
						</div>
					  </div> 
					  <div class="control-group">
						<label class="control-label" >性别</label>
						<div class="controls">
						  <select  name="student.sex">
							<option value=true selected="selected">男</option>
							<option value=false>女</option>
						  </select>
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label" >住址</label>
						<div class="controls">
						  <input type="text" name="student.address" id="addaddress">
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label" >入学时间</label>
						<div class="controls">
						  <input type="text" name="student.intime" id="addintime">
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label" >班级</label>
						<div class="controls">
						  <select class="span2" name="classid">
							<option value="${clazz.id }" selected="selected">${clazz.classname }</option>
						  </select>
						</div>
					  </div>
					  <div id="addstudent_msg" class="alert control-group">
							<a class="close" data-dismiss="alert">×</a>
							<strong></strong>
				        </div>
					</fieldset>
				</form>
			  </p>
            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">关闭</a>
              <a href="#" class="btn btn-primary" id="addStudent">保存</a>
            </div>
          </div>
	
      <table class="table table-striped">
	        <thead>
          <tr>
            <th colspan=7><strong ><h3>${clazz.classname }</h3></strong></th>
          </tr>
		  <tr>
				<td>姓名</td>
				<td>学号</td>
				<td>出生日期</td>
				<td>性别</td>
				<td>班级</td>
				<td>住址</td>
				<td>入学时间</td>
			</tr>
        </thead>
        <tbody>
        	<c:forEach items="${students }" var="student">
        		<tr>
					<td>${student.name }</td>
					<td>${student.username }</td>
					<td>${student.birth }</td>
					<td>
						<c:if test="${student.sex eq 'true'}">
		          			男
		          		</c:if>
		          		<c:if test="${student.sex eq 'false'}">
		          			女
		          		</c:if>
					</td>
					<td>${clazz.classname }</td>
					<td>${student.address }</td>
					<td>${student.intime }</td>
					<td><a class="btn" onclick="editStudent(this)" ref="${student.id}" data-toggle="modal" href="#edit">修改</a>
					<a class="btn btn-danger" href="javascript:;"  onclick="delStudent(this)" ref="${student.id}" >删除</a></td>
				</tr>
        	</c:forEach>
        </tbody>
      </table>
    
	
	<!-- 修改学生的框 -->
	<div id="edit" class="modal hide fade in" style="display: none;">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>修改学生</h3>
            </div>
            <div class="modal-body">
              <p>
				<form class="form-horizontal" id="updateStudentForm" action="updateStudent" method="post">
					<fieldset>
					<input type="hidden" id="hiddenid" name="student.id">
					  <div class="control-group">
						<label class="control-label" >姓名</label>
						<div class="controls">
						  <input type="text" name="student.name" id="editname">
						</div>
					  </div>
					   <div class="control-group">
						<label class="control-label" >学号</label>
						<div class="controls">
						 <input type="text" name="student.username" id="editusername">
						</div>
					  </div> 
					  <div class="control-group">
						<label class="control-label" >出生日期</label>
						<div class="controls">
						  <input type="text" name="student.birth" id="editbirth">
						</div>
					  </div> 
					  <div class="control-group">
						<label class="control-label" >性别</label>
						<div class="controls">
						  <select  name="student.sex" id="editsex">
							<option value=true>男</option>
							<option value=false>女</option>
						  </select>
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label" >住址</label>
						<div class="controls">
						  <input type="text" name="student.address" id="editaddress">
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label" >入学时间</label>
						<div class="controls">
						 	<input type="text" name="student.intime" id="editintime">
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label" >班级</label>
						<div class="controls">
						  <select class="span2" name="classid">
							<option value="${clazz.id }" selected="selected">${clazz.classname }</option>
						  </select>
						</div>
					  </div>
					  <div id="editstudent_msg" class="alert control-group">
							<a class="close" data-dismiss="alert">×</a>
							<strong></strong>
				        </div>
					</fieldset>
				</form>
			  </p>
            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">关闭</a>
              <a href="#" class="btn btn-primary" id="updateStudent">保存</a>
            </div>
          </div>
		  
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
		
			$("#addstudent_msg").hide();
			$("#editstudent_msg").hide();
			
			$("#addStudent").click(function(){
				name=$("#addname").val();
				username=$("#addusername").val();
				address=$("#addaddress").val();
				birth=$("#addbirth").val();
				intime=$("#addintime").val();
				
				if(name!=""&&username!=""&&address!=""&&birth!=""&&intime!=""){
					$("#addStudentForm").submit();
				}else{
					$("#addstudent_msg").children("strong").text("除地址外，其他信息不可为空");
					$("#addstudent_msg").show();
				}
				
			});
			
			$("#updateStudent").click(function(){
			
				name=$("#editname").val();
				username=$("#editusername").val();
				address=$("#editaddress").val();
				birth=$("#editbirth").val();
				intime=$("#editintime").val();
				
				if(name!=""&&username!=""&&address!=""&&birth!=""&&intime!=""){
					$("#updateStudentForm").submit();
				}else{
					$("#editstudent_msg").children("strong").text("除地址外，其他信息不可为空");
					$("#editstudent_msg").show();
				}
				
			});
			
			
		});
		
		function editStudent(obj){
			td=$(obj).parent().parent().children();
			$("#editname").val(td.eq(0).text());
			$("#editusername").val(td.eq(1).text());
			$("#editbirth").val(td.eq(2).text());
			
			if(td.eq(3).text().trim()=='男'){
				$("#editsex").children().eq(1).removeAttr("selected");
				$("#editsex").children().eq(0).attr("selected","selected");
			}else if(td.eq(3).text().trim()=='女'){
				$("#editsex").children().eq(0).removeAttr("selected");
				$("#editsex").children().eq(1).attr("selected","selected");
			}
			
			$("#editaddress").val(td.eq(5).text());
			$("#editintime").val(td.eq(6).text());
			
			$("#hiddenid").val($(obj).attr("ref"));
		}
		
		function delStudent(obj){
			r=confirm("确定删除同学吗");
    		if(true==r){
    			id=$(obj).attr("ref");
				$.get("deleteStudent",{studentid:id},
				function(c){
					if(c=='deletestudent_success'){
			  			$("#code").children("strong").text("删除同学成功");
			  			$("#code").show();
			  			$(obj).parent().parent().remove();
			  		}else if(c=='deletestudent_fail'){
			  			$("#code").children("strong").text("删除同学失败");
			  			$("#code").show();
			  		}
				}
				);
    		}
			
		}
		
	</script>
	
</body>
</html>
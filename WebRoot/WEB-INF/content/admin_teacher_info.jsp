<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./admin_head.jsp" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>教师信息</title>
	
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
	<span id="add" class="btn btn-primary" data-toggle="modal" href="#modal">新增教师</span>
	
	<!-- 添加教师的框 -->
	<div id="modal" class="modal hide fade in" style="display: none;">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>添加教师</h3>
            </div>
            <div class="modal-body">
              <p>
				<form class="form-horizontal" action="addTeacher" method="post" id="addTeacherForm">
					<fieldset>
					  <div class="control-group">
						<label class="control-label" >姓名</label>
						<div class="controls">
						  <input type="text" name="teacher.name" id="addname">
						</div>
					  </div>
					   <div class="control-group">
						<label class="control-label" >教师编号</label>
						<div class="controls">
						  <input type="text" name="teacher.username" id="addusername">
						</div>
					  </div> 
					  <div class="control-group">
						<label class="control-label" >出生日期</label>
						<div class="controls">
						  <input type="text" name="teacher.birth" id="addbirth">
						</div>
					  </div> 
					  <div class="control-group">
						<label class="control-label" >性别</label>
						<div class="controls">
						   <select  name="teacher.sex" id="addsex">
							<option value=true>男</option>
							<option value=false>女</option>
						  </select>
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label" >住址</label>
						<div class="controls">
						  <input type="text" name="teacher.address" id="addaddress">
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label" >入学时间</label>
						<div class="controls">
						  <input type="text" name="teacher.intime" id="addintime">
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label" >毕业院校</label>
						<div class="controls">
						  <input type="text" name="teacher.school" id="addschool">
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label" >学历</label>
						<div class="controls">
						  <input type="text" name="teacher.education" id="addeducation">
						</div>
					  </div>
					   <div id="addteacher_msg" class="alert control-group">
							<a class="close" data-dismiss="alert">×</a>
							<strong></strong>
				        </div>
					 
					</fieldset>
				</form>
			  </p>
            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">关闭</a>
              <a href="#" class="btn btn-primary" id="addTeacher">保存</a>
            </div>
    </div>

      <table class="table table-striped">
	        <thead>
          <tr>
            <th colspan=8><strong ><h3>教师信息</h3></strong></th>
          </tr>
		  <tr>
				<td>姓名</td>
				<td>教师编号</td>
				<td>出生日期</td>
				<td>性别</td>
				<td>住址</td>
				<td>入学时间</td>
				<td>毕业院校</td>
				<td>学历</td>
			</tr>
        </thead>
        <tbody>
        	<c:forEach items="${teachers }" var="teacher">
        		<tr>
					<td>${teacher.name }</td>
					<td>${teacher.username }</td>
					<td>${teacher.birth }</td>
					<td>
						<c:if test="${teacher.sex eq 'true'}">
							男
						</c:if>
						<c:if test="${teacher.sex eq 'false'}">
							女
						</c:if>
					</td>
					<td>${teacher.address }</td>
					<td>${teacher.intime}</td>
					<td>${teacher.school }</td>
					<td>${teacher.education }</td>
					<td><button class="btn" onclick="editTeacher(this)" ref="${teacher.id }" href="#edit" data-toggle="modal">修改</button>
					<button class="btn btn-danger" onclick="delTeacher(this)" ref="${teacher.id }">删除</button></td>
				</tr>
        	</c:forEach>
        </tbody>
      </table>
    </div>
	
	<!-- 编辑教师的框 -->
	<div id="edit" class="modal hide fade in" style="display: none;">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>编辑教师</h3>
            </div>
            <div class="modal-body">
              <p>
				<form class="form-horizontal" action="updateTeacher" method="post" id="updateTeacherForm">
					<fieldset>
						<input type="hidden" name="teacher.id" id="teacherid">
					  <div class="control-group">
						<label class="control-label" >姓名</label>
						<div class="controls">
						  <input type="text" name="teacher.name" id="editname">
						</div>
					  </div>
					   <div class="control-group">
						<label class="control-label" >教师编号</label>
						<div class="controls">
						  <input type="text" name="teacher.username" id="editusername">
						</div>
					  </div> 
					  <div class="control-group">
						<label class="control-label" >出生日期</label>
						<div class="controls">
						  <input type="text" name="teacher.birth" id="editbirth">
						</div>
					  </div> 
					  <div class="control-group">
						<label class="control-label" >性别</label>
						<div class="controls">
						  <select  name="teacher.sex" id="editsex">
							<option value=true>男</option>
							<option value=false>女</option>
						  </select>
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label" >住址</label>
						<div class="controls">
						  <input type="text" name="teacher.address" id="editaddress">
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label" >入学时间</label>
						<div class="controls">
						  <input type="text" name="teacher.intime" id="editintime">
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label" >毕业院校</label>
						<div class="controls">
						  <input type="text" name="teacher.school" id="editschool">
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label" >学历</label>
						<div class="controls">
						  <input type="text" name="teacher.education" id="editeducation">
						</div>
					  </div>
					   <div id="editteacher_msg" class="alert control-group">
							<a class="close" data-dismiss="alert">×</a>
							<strong></strong>
				        </div>
					 
					</fieldset>
				</form>
			  </p>
            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">关闭</a>
              <a href="#" class="btn btn-primary" id="updateTeacher">保存</a>
            </div>
    </div>
    
    <script type="text/javascript">
    	$(document).ready(function(){
    		$("#addteacher_msg").hide();
			$("#editteacher_msg").hide();
			
			$("#updateTeacher").click(function(){
				name=$("#editname").val();
				username=$("#editusername").val();
				address=$("#editaddress").val();
				birth=$("#editbirth").val();
				intime=$("#editintime").val();
				school=$("#editschool").val();
				education=$("#editeducation").val();
				
				if(name!=""&&username!=""&&birth!=""&&intime!=""&&school!=""&&education!=""){
					$("#updateTeacherForm").submit();
				}else{
					$("#editteacher_msg").children("strong").text("除地址外，其他信息不可为空");
					$("#editteacher_msg").show();
				}
			});
			
			
			$("#addTeacher").click(function(){
				name=$("#addname").val();
				username=$("#addusername").val();
				address=$("#addaddress").val();
				birth=$("#addbirth").val();
				intime=$("#addintime").val();
				school=$("#addschool").val();
				education=$("#addeducation").val();
				
				if(name!=""&&username!=""&&birth!=""&&intime!=""&&school!=""&&education!=""){
					$("#addTeacherForm").submit();
				}else{
					$("#addteacher_msg").children("strong").text("除地址外，其他信息不可为空");
					$("#addteacher_msg").show();
				}
			});
			
    	});
    	
    	function delTeacher(obj){
    		r=confirm("确定删除教师吗");
    		if(true==r){
    			id=$(obj).attr("ref");
	    		alert(id);
	    		$.get("deleteTeacher",{teacherid:id},function(rs){
	    			if("deleteteacher_success"==rs.trim()){
	    				$("#code").children("strong").text("删除教师成功");
			  			$("#code").show();
			  			$(obj).parent().parent().remove();
	    			}else{
	    				$("#code").children("strong").text("删除教师失败");
			  			$("#code").show();
	    			}
	    		});
    		}
    		
    	}
    	
    	function editTeacher(obj){
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
			
			$("#editaddress").val(td.eq(4).text());
			$("#editintime").val(td.eq(5).text());
			$("#editschool").val(td.eq(5).text());
			$("#editeducation").val(td.eq(5).text());
			
			$("#teacherid").val($(obj).attr("ref"));
    	}
    	
    </script>
	
</body>
</html>
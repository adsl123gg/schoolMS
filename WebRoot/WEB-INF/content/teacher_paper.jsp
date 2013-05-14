<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./teacher_head.jsp" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>试卷信息</title>
	
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
	<span id="add" class="btn btn-primary" data-toggle="modal" href="#modal">新增试卷</span>
	
	<!-- 添加试卷名称的框 -->
	<div id="modal" class="modal hide fade in" style="display: none;">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>添加试卷</h3>
            </div>
            <div class="modal-body">
              <p>
				<form class="form-horizontal" action="addPaperName" method="post" id="addPaperNameForm">
					<fieldset>
					  <div class="control-group">
						<label class="control-label" >试卷名称</label>
						<div class="controls">
						  <input type="text" name="paper.name" id="addname">
						  <input type="hidden" name="teacherid" value="${teacher.id }">
						</div>
					  </div>
					  <div id="addpaper_msg" class="alert">
							<a class="close" data-dismiss="alert">×</a>
							<strong></strong>
				        </div>
					</fieldset>
				</form>
			  </p>
            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">关闭</a>
              <a href="#" class="btn btn-primary" id="addPaperName">保存</a>
            </div>
    </div>

      <table class="table table-striped">
	        <thead>
          <tr>
            <th colspan=8><strong ><h3>当前试卷列表</h3></strong></th>
          </tr>
		  <tr>
				<td>试卷名称</td>
				<td>试卷状态</td>
				<td>题目数量</td>
				<td>操作</td>
			</tr>
        </thead>
        <tbody>
        	<c:forEach items="${papers }" var="paper">
        		<tr>
					<td><a href="teacherPaperInfo?paperid=${paper.id}">${paper.name }</a></td>
					<td>${paper.state }</td>
					<td>当前试卷有${fn:length(paper.questionSet)}道题</td>
					<td>
						<button class="btn" onclick="editpaper(this);" ref="${paper.id }" href="#edit" data-toggle="modal">修改</button>
						<button class="btn btn-danger" onclick="delpaper(this)" ref="${paper.id }">删除</button>
						<button class="btn btn-success" onclick="submitpaper(this)" ref="${paper.id }">提交试卷</button>
					</td>
				</tr>
        	</c:forEach>
        </tbody>
      </table>
    </div>
	
	<!-- 编辑试卷名称的框 -->
	<div id="edit" class="modal hide fade in" style="display: none;">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>编辑试卷</h3>
            </div>
            <div class="modal-body">
              <p>
				<form class="form-horizontal" action="updatePaperName" method="post" id="editPaperNameForm">
					<fieldset>
					  <div class="control-group">
						<label class="control-label" >试卷名称</label>
						<div class="controls">
						  <input type="text" name="paper.name" id="editname">
						  <input type="hidden" name="paper.id" id="editid">
						</div>
					  </div>
					  <div id="editpaper_msg" class="alert">
							<a class="close" data-dismiss="alert">×</a>
							<strong></strong>
				        </div>
					</fieldset>
				</form>
			  </p>
            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">关闭</a>
              <a href="#" class="btn btn-primary" id="updatePaperName">保存</a>
            </div>
    </div>
    
    <script type="text/javascript">
    	$(document).ready(function(){
    	
    		$("#addpaper_msg").hide();
    		$("#editpaper_msg").hide();
			
			$("#updatePaperName").click(function(){
				
				if($("#editname").val()!=""){
					$("#editPaperNameForm").submit();
				}else{
					$("#editpaper_msg").children("strong").text("试卷名称不可为空");
					$("#editpaper_msg").show();
				}
			});
			
			
			$("#addPaperName").click(function(){
				if($("#addname").val()!=""){
					$("#addPaperNameForm").submit();
				}else{
					$("#addpaper_msg").children("strong").text("试卷名称不可为空");
					$("#addpaper_msg").show();
				}
			});
			
    	});
    	
    	function delpaper(obj){
    		rs=confirm("确定删除该试卷吗？");
    		if(rs==true){
    			id=$(obj).attr("ref");
    			$.get("checkPaperSubmit",{paperid:id},function(rs){
    				if(rs=="false"){
    					$.get("deletePaper",{paperid:id},function(result){
			    			if(result.trim()=="delpaper_success"){
			    				$("#code").children("strong").text("删除试卷成功");
			  					$("#code").show();
			  					$(obj).parent().parent().remove();
			    			}else{
			    				$("#code").children("strong").text("删除试卷失败");
			  					$("#code").show();
			    			}
			    		});
    				}else{
    					//$(obj).attr("disabled","disabled");
	    				alert("该试卷已提交，不能修改或删除");
	    				return;
    				}
    			});
	    		
    		}
    	}
    	
    	function editpaper(obj){
    		id=$(obj).attr("ref");
    		//$(obj).attr("disabled","");
    		$.get("checkPaperSubmit",{paperid:id},function(rs){
    			if(rs=="true"){
    				alert("该试卷已提交，不能修改或删除");
    				$("#edit").hide();
    				return true;
    			}else{
    				$(obj).removeAttr("disabled");
    				
    				name=$(obj).parent().parent().children("td").eq(0).children("a").eq(0).text();
    		
		    		$("#editname").val(name);
		    		$("#editid").val(id);
    			}
    		});
    	}
    	
    	function submitpaper(obj){
    		id=$(obj).attr("ref");
    		rs=confirm("确定提交该试卷吗，提交之后不能修改！");
    		if(rs==true){
    			$.get("checkPaperSubmit",{paperid:id},function(rs){
	    			if(rs=="false"){
	    				$.get("submitPaper",{paperid:id},function(rs){
			    			if(rs.trim()=="paper_submit_success"){
			    				$("#code").children("strong").text("试卷提交成功");
				  				$("#code").show();
			    			}else{
			    				$("#code").children("strong").text("试卷提交失败");
				  				$("#code").show();
			    			}
			    		});
	    			}else{
	    				//$(obj).attr("disabled","disabled");
	    				alert("该试卷已提交，不能重复提交");
	    				return;
	    			}
    			});
    		}
    		
    		
    	}
    	
    </script>
	
</body>
</html>
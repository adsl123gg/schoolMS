<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./teacher_head.jsp" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>资料共享库</title>
	
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

	<div class="container" style="margin-top:70px;margin-bottom:20px"><span style="font-size:32px;">资料共享库</span></div>
	<a id="add" class="btn btn-primary" data-toggle="modal" href="#fileupload">上传文件</a>
	
	<div class="span12 container">
      <table class="table table-striped">
	     <thead>
          
        </thead>
        <tbody>
        	<c:forEach items="${datas}" var="data">
        		<tr>
		          <td class="span10"> <a href="downloadfile?fileName=${data.savename}">${data.filename}</a></td>
				  <td>${fn:substringBefore(data.createtime," ")}</td>
		        </tr>
        	</c:forEach>
         
        </tbody>
      </table>
    </div>
    
    <!-- 文件上传的框 -->
    <div id="fileupload" class="modal hide fade in" style="display: none;">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>上传文件</h3>
            </div>
            <div class="modal-body">
				<form class="form-horizontal"  method="post" enctype="multipart/form-data" id="fileUploadForm" action="fileUpload">
					<fieldset>
					  <div class="control-group">
						<label class="control-label" >上传文件</label>
						<div class="controls">
						  <input type="file" id="file" name="file" class="input-file">
						</div>
						<!-- <div id="addClass_msg" class="alert">
							<a class="close" data-dismiss="alert">×</a>
							<strong></strong>
				        </div> -->
					  </div>
					   
					</fieldset>
				</form>
            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">关闭</a>
              <a href="#" class="btn btn-primary" id="fileupload">保存</a>
            </div>
          </div>

</body>

	<script type="text/javascript">
		$(document).ready(function(){
		
			$("#fileupload").click(function(){
				if($("#file").val()!=""){
					$("#fileUploadForm").submit();
				}
				
			});
			
		});
	</script>

</html>
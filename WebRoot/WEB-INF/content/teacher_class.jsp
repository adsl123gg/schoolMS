<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./teacher_head.jsp" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>查询代课班级</title>
	
</head>
<body class="container">

	<div class="" style="margin-top:50px">
      <div class="well">
		<table class="table">
			<c:forEach items="${clazzs}" var="clazz" >
			 	<tr>
					<td width="300px">
						<span class="btn btn-info btn-large c " rel="popover" data-content="电气自动化学院" data-original-title="${clazz.classname}">
							<a href="teacherClassInfo?classid=${clazz.id}" style="color:white">
							${clazz.classname}</a>
							<input type="hidden" id="${clazz.id}" >
						</span>
					</td>
					
				</tr>
			</c:forEach>
		</table>
          </div>
    </div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			$('.c').popover('hide');
		});
		
	</script>
	
</body>
</html>
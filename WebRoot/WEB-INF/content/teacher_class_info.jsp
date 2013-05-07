<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./teacher_head.jsp" %>
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
					<td>查看成绩</td>
				</tr>
        	</c:forEach>
        </tbody>
      </table>
    
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
		});
		
	</script>
	
</body>
</html>
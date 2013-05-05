<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./student_head.jsp" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>学生信息</title>
	
</head>
<body class="container">

	<div style="margin-top:50px">
	
		<table class="table table-striped">
	        <thead>
          <tr>
            <th>个人信息</th>
          </tr>
        </thead>
        <tbody>
          <tr>
			<td>姓名</td>
			<td>${student.name}</td>
		  </tr>
          <tr>
          	<td>出生日期</td>
          	<td>${student.birth }</td>
          </tr>
          <tr>
          	<td>性别</td>
          	<td>
          		<c:if test="${student.sex eq 'true'}">
          			男
          		</c:if>
          		<c:if test="${student.sex eq 'false'}">
          			女
          		</c:if>
          	</td>
          </tr>
          <tr>
          	<td>住址</td>
          	<td>${student.address }</td>
          </tr>
          <tr>
          	<td>学号</td>
          	<td>${student.username }</td>
          </tr>
          <tr>
          	<td>班级</td>
          	<td>${student.clazz.classname }</td>
          </tr>
          <tr>
          	<td>入学时间</td>
          	<td>${student.intime }</td>
          </tr>
        </tbody>
      </table>
	  
	</div>
	
</body>
</html>
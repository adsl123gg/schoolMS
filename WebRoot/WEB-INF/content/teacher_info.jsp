<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./teacher_head.jsp" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>教师信息</title>
	
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
			<td>${teacher.name}</td>
		  </tr>
          <tr>
          	<td>出生日期</td>
          	<td>${teacher.birth}</td>
          </tr>
          <tr>
          	<td>性别</td>
          	<td>
				<c:if test="${teacher.sex eq 'true'}">
          			男
          		</c:if>
          		<c:if test="${teacher.sex eq 'false'}">
          			女
          		</c:if>
			</td>
          </tr>
          <tr>
          	<td>住址</td>
          	<td>${teacher.address}</td>
          </tr>
          <tr>
          	<td>教师编号</td>
          	<td>${teacher.username}</td>
          </tr>
		  <tr>
          	<td>毕业院校</td>
          	<td>${teacher.school}</td>
          </tr>
		  <tr>
          	<td>学历</td>
          	<td>${teacher.education}</td>
          </tr>
          <tr>
          	<td>入校时间</td>
          	<td>${teacher.intime}</td>
          </tr>
        </tbody>
      </table>
	  
	</div>
	
</body>
</html>
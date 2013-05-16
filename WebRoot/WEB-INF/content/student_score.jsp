<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./student_head.jsp" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>学生成绩</title>
	
</head>
<body class="container">

	<div class="" style="margin-top:50px">
		 <table class="table table-striped table-bordered">
	        <thead>
			  <tr>
				<th>课程名称</th>
				<th>学分</th>
				<th>成绩</th>
				<th>课程属性</th>
				
			  </tr>
			</thead>
			<tbody>
				<c:forEach items="${scores}" var="score">
					<tr>
						<td>${score.course.coursename }</td>
						<td>${score.course.credit }</td>
						<td>${score.score }分</td>
						<td>${score.course.property }</td>
					</tr>
				</c:forEach>
				<!-- <tr>
					<td>3542352435</td>
					<td>java</td>
					<td>2</td>
					<td>98</td>
					<td>必修</td>
				</tr>
				<tr>
					<td>234524352345</td>
					<td>android</td>
					<td>2</td>
					<td>79</td>
					<td>必修</td>
				</tr> -->
			</tbody>
		</table>
    </div>
	
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./admin_head.jsp" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>admin_add_exam.jsp</title>
	
	
</head>
<body class="container">

	<div class="" style="margin-top:50px">

        <table class="table table-striped">
	        <thead>
          <tr>
            <th colspan=8><strong ><h3>课程“${course.coursename }”的考试安排</h3></strong></th>
          </tr>
		  <tr>
				<td>参加考试班级</td>
				<td>考试使用试卷</td>
				<td>考试时间</td>
				<td>考试时长</td>
				<td>考试地点</td>
			</tr>
        </thead>
        <tbody>	
        		<tr>
						<td>
						
							<select>
								<c:forEach items="${course.classSet}" var="clazz">
									<option>${clazz.classname}</option>
								</c:forEach>
								
							</select>
						</td>
						<td>
							<select name="paperid">
									<option value="${paper.id }">${exam.paper.name}</option>
							</select>
						</td>
						<td><input type="text" style="width:130px" value="${exam.starttime }" disabled="disabled"></td>
						<td>
							<select style="width:80px" name="examlengthtime">
									<option >${exam.lengthoftime }小时</option>
							</select>
						</td>
						<td><input type="text" style="width:130px" value="${exam.address }" disabled="disabled"></td>
				</tr>
        </tbody>
      </table>
      
    </div>
	
    
    <script type="text/javascript">
    
    	$(function() {
			
			$("#datepicker").datetimepicker({
				hourMin: 8,
				hourMax: 21
			});
			
		});
		
		function addexam(){
			$("#addExamForm").submit();
		}
    
    </script>
	
</body>
</html>
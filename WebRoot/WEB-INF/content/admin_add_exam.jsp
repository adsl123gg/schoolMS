<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./admin_head.jsp" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>考试安排</title>
	
	
	<script src="js/jquery-1.7.2.js"></script>
	<script src="js/jquery.ui.core.js"></script>
	<script src="js/jquery.ui.datepicker.js"></script>
	
	<script src="js/jquery-ui-timepicker-addon.js"></script>
	<script src="js/jquery-ui-sliderAccess.js"></script>
	
	
</head>
<body class="container">

	<div class="" style="margin-top:50px">

		<form action="addExam" method="post" id="addExamForm">
			<input type="hidden" name="courseid" value="${course.id}">
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
									<c:forEach items="${papers}" var="paper" >
										<option value="${paper.id }">${paper.name}</option>
									</c:forEach>
									
								</select>
							</td>
							<td><input id="datepicker" type="text" style="width:130px" name="exam.starttime"></td>
							<td>
								<select style="width:80px" name="exam.lengthoftime">
										<option value="1">1小时</option>
										<option value="2">2小时</option>
										<option value="3">3小时</option>
								</select>
							</td>
							<td><input type="text" id="address" style="width:130px" name="exam.address"></td>
					</tr>
	        </tbody>
	      </table>
      </form>
      	<button class="btn btn-success pull-right" id="addExam">确认安排</button>
      
    </div>
	
    
    <script type="text/javascript">
    
    	$(function() {
			
			$("#datepicker").datetimepicker({
				hourMin: 8,
				hourMax: 21
			});
			
		});
		
		$(document).ready(function(){
		
			$("#addExam").click(function(){
				time=$("#datepicker").val();
				address=$("#address").val();
				
				if(time!=""&&address!=""){
					$("#addExamForm").submit();
				}else{
					$("#code").children("strong").text("考试时间和地点不允许为空！");
	  				$("#code").show();
				}
			});
			
		});
		
    
    </script>
	
</body>
</html>
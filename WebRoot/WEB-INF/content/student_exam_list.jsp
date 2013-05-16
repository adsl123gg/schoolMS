<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./student_head.jsp" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>学生考试管理</title>
	
</head>
<body class="container">

	<div class="" style="margin-top:50px">

        <table class="table table-striped">
	        <thead>
          <tr>
            <th colspan=8><strong ><h3>当前考试</h3></strong></th>
          </tr>
		  <tr>
				<td>考试课程名称</td>
				<td>考试开始时间</td>
				<td>考试时长</td>
				<td>考试地点</td>
				<td>操作</td>
			</tr>
        </thead>
        <tbody>
        	<c:forEach items="${exams }" var="exam">
        		<tr>
					<td><a href="javascript:;">${exam.course.coursename }</a></td>
					<td>${exam.starttime }</td>
					<td>${exam.lengthoftime}小时</td>
					<td>${exam.address }</td>
					<td>
						<button class="btn btn-success" onclick="verifyexam(this)" ref="${exam.id }">参加考试</button>
					</td>
				</tr>
        	</c:forEach>
        </tbody>
      </table>
    </div>
	
    
    <script type="text/javascript">
    
    	function verifyexam(obj){
    		id=$(obj).attr("ref");
    		$.get("verifyExam",{examid:id},function(rs){
    			
    			$.get("isSubmit",{examid:id},function(rs){
    				if(rs=="submit_ok"){
    					alert("您已交卷，不能重复参加考试");
    				}else{
    					window.location.href="studentExamPaper?examid="+id;
    				}
    			});
    			
    			/* if(rs=="beforeexam"){
    				alert("未到考试时间，请耐心等待！");
    			}else if(rs=="afterexam"){
    				alert("考试已结束！");
    			}else{
    				$.get("isSubmit",{examid:id},function(rs){
    				if(rs=="submit_ok"){
    					alert("您已交卷，不能重复参加考试");
    				}else{
    					window.location.href="studentExamPaper?examid="+id;
    				}
    			});
    			} */
    		});
    	}
    
    </script>
	
</body>
</html>
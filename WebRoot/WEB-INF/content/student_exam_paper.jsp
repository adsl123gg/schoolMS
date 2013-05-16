<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./student_head.jsp" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>考试试卷</title>
	
	<style type="text/css">
		.cc{
			width:150px
		}
		
		#time{
			position:absolute;
			top:80px;
			right:20px;
			font-size:20px;
		}
	</style>
	
</head>
<body class="container">

	<div class="" style="margin-top:50px">
	
	<span id="time" ref="${exam.id}">倒计时：${exam.lengthoftime }小时</span>
	
		<div style="margin-bottom:20px">
			<strong style="font-size:20px">${paper.name}</strong>
			<button class="btn btn-success pull-right" id="jiaojuan">交卷</button>
			<form action="studentSubmitPaper" id="jiaojuanForm" method="post" style="display:none">
				<input type="hidden" name="answers" id="answers">
				<input type="hidden" name="courseid" value="${exam.course.id }">
			</form>
		</div>
      <table class="table table-striped">
      		<tbody>
	      		<c:forEach items="${paper.questionSet}" var="question" varStatus="status">
	      			    <tr>
	      					<td>试题${status.count}问题</td>
			        		<td colspan=3 >
				        		<textarea rows="3" cols="15" style="width:400px" disabled="disabled">${question.question }</textarea>
			        		</td>
			        		<td >选项
			        			<select style="width:90px" ref="${question.id}">
			        				<%-- <option value="${question.rightAnswer}" >${question.rightAnswer}</option> --%>
			        				<option value="no">请选择</option>
			        				<option value="A">A</option>
			        				<option value="B">B</option>
			        				<option value="C">C</option>
			        				<option value="D">D</option>
			        			</select>
			        			<br>
			        			<span>分值</span><input type="text" disabled="disabled" value="${question.score}" style="width:80px">
			        		</td>
	      				</tr>
	      				<tr>
			        		<td class="">试题${status.count}答案</td>
			        		<c:forTokens items="${question.answers}" delims="&&" var="ans" varStatus="sta">
			        			<td >
			        					<c:if test="${sta.count==1 }">
			        						A.
			        					</c:if>
			        					<c:if test="${sta.count==2 }">
			        						B.
			        					</c:if>
			        					<c:if test="${sta.count==3 }">
			        						C.
			        					</c:if>
			        					<c:if test="${sta.count==4 }">
			        						D.
			        					</c:if>
			        					<input type="text" class="cc" value="${ans}" disabled="disabled">
			        			</td>
			        		</c:forTokens>
			        	</tr>
	      			
	      		</c:forEach>
      		</tbody>
      		
      </table>
     
    </div>
    
    <script type="text/javascript">
    	$(document).ready(function(){
    	
    		countdown();
    	
    		$("#jiaojuan").click(function(){
    		
    			result=confirm("确认交卷吗，交卷之后不能继续答题！");
    			if(result==true){
    				selects=$("table select");
    			
	    			for(var i=0;i<selects.size();i++){
	    				if(selects.eq(i).val()=="no"){
	    					alert("还有试题未回答，请完成所有题目后交卷!");
	    					return;
	    				}
	    			}
	    			
	    			var answers="";
	    			for(var i=0;i<selects.size();i++){
	    				questionid=selects.eq(i).attr("ref");
	    				ans=selects.eq(i).val();
	    				answers+=questionid+"%%"+ans+"&&";
	    			}
	    			$("#answers").val(answers);
	    			$("#jiaojuanForm").submit();
    			}
    			
    		});
    		
    	});
    	
    	function countdown(){
    		/* var date=new Date();
    		//alert(date.getHours());
    		$("#time").text(date.getHours()+":"+date.getMinutes()+":"+date.getSeconds());
    		//$("#time").text(date.getMilliseconds()); */
    		
    		examid=$("#time").attr("ref");
    		$.get("countdown",{examid:examid},function(rs){
    			if(rs!="timeout"){
    				$("#time").text("考试剩余"+rs+"分钟");
    			}else{
    				
    				selects=$("table select");
    			
	    			var answers="";
	    			for(var i=0;i<selects.size();i++){
	    				questionid=selects.eq(i).attr("ref");
	    				ans=selects.eq(i).val();
	    				answers+=questionid+"%%"+ans+"&&";
	    			}
	    			$("#answers").val(answers);
	    			$("#jiaojuanForm").submit();
	    			
	    			alert("考试时间到，试卷已自动提交！");
    			}
    		});
    		
    		setTimeout(countdown,1000);
    	}
    	
    </script>
    
</body>
</html>
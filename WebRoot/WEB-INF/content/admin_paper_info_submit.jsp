<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./admin_head.jsp" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>试卷信息</title>
	
	<style type="text/css">
		.cc{
			width:150px
		}
		
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
	
		<div style="margin-bottom:20px">
			<strong style="font-size:20px">试卷${paper.name}的题目列表</strong>
			<input type="hidden" value="${paper.id}" id="paperid">
		</div>
      <table class="table table-striped">
      		<tbody>
	      		<c:forEach items="${paper.questionSet}" var="question" varStatus="status">
	      			    <tr>
	      					<td>试题${status.count}问题</td>
			        		<td colspan=3 >
				        		<textarea rows="3" cols="15" style="width:400px" disabled="disabled">${question.question }</textarea>
			        		</td>
			        		<td >正确答案
			        			<select style="width:60px">
			        				<option value="${question.rightAnswer}" >${question.rightAnswer}</option>
			        			</select>
			        			<br>
			        			<span>分值</span><input type="text" disabled="disabled" value="${question.score}" style="width:80px">
			        		</td>
			        		<%-- <td>
			        			<a class="btn"  onclick="editQuestion(this)" ref="${question.id}" data-toggle="modal" href="#edit">编辑该题目</a>
			        			<a class="btn btn-danger" href="javascript:;" onclick="delQuestion(this)" ref="${question.id}">删除该题目</a>
			        		</td> --%>
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
    
    
</body>
</html>
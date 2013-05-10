<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./teacher_head.jsp" %>
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

	<!-- 添加题目的框 -->
	<div id="modal" class="modal hide fade in container" style="display: none;width:800px">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>添加题目</h3>
            </div>
            <div class="modal-body">
              <p>
				<form class="form-horizontal" action="addQuestion" method="post" id="addQuestionForm">
					<fieldset>
					   <table class="table table-striped" id="addQuestionTable">
		      			    <tr>
		      					<td>请输入试题的题目</td>
				        		<td colspan=3 >
					        		<textarea rows="3" cols="15" style="width:400px" id="addquestion" name="question.question"></textarea>
				        		</td>
				        		<td >正确答案
				        			<select style="width:60px" name="question.rightAnswer" >
				        				<option value="A" >A</option>
				        				<option value="B" >B</option>
				        				<option value="C" >C</option>
				        				<option value="D" >D</option>
				        			</select>
				        			<br>
				        			<span>分值</span><input type="text" style="width:80px" id="addscore" name="question.score">
				        		</td>
		      				</tr>
		      				<tr>
				        		<td class="">试题答案<input type="hidden" name="question.answers" id="addanswers"></td>
				        			<td >A.<input type="text" class="cc" ></td>
				        			<td >B.<input type="text" class="cc" ></td>
				        			<td >C.<input type="text" class="cc" ></td>
				        			<td >D.<input type="text" class="cc" ></td>
				        	</tr>
      					</table>
      					<div id="addquestion_msg" class="alert">
							<a class="close" data-dismiss="alert">×</a>
							<strong></strong>
				        </div>
					</fieldset>
				</form>
			  </p>
            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">关闭</a>
              <a href="#" class="btn btn-primary" id="addQuestion">保存</a>
            </div>
    </div>
    
    
    <!-- 修改题目的框 -->
	<div id="edit" class="modal hide fade in container" style="display: none;width:800px">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>修改题目</h3>
            </div>
            <div class="modal-body">
              <p>
				<form class="form-horizontal" action="updateQuestion" method="post" id="editQuestionForm">
					<fieldset>
					   <table class="table table-striped" id="">
					   		
		      			    <tr>
		      					<td>请输入试题的题目</td>
				        		<td colspan=3 >
					        		<textarea rows="3" cols="15" style="width:400px" id="editquestion" name="question.question"></textarea>
					        		<input type="hidden" name="questionid" id="editquestionid">
				        		</td>
				        		<td >正确答案
				        			<select style="width:60px" name="question.rightAnswer" id="editrightAnswer">
				        				<option value="A" >A</option>
				        				<option value="B" >B</option>
				        				<option value="C" >C</option>
				        				<option value="D" >D</option>
				        			</select>
				        			<br>
				        			<span>分值</span><input type="text" style="width:80px" id="editscore" name="question.score">
				        		</td>
		      				</tr>
		      				<tr>
				        		<td class="">试题答案<input type="hidden" name="question.answers" id="editanswers"></td>
				        			<td >A.<input type="text" class="cc" ></td>
				        			<td >B.<input type="text" class="cc" ></td>
				        			<td >C.<input type="text" class="cc" ></td>
				        			<td >D.<input type="text" class="cc" ></td>
				        	</tr>
      					</table>
      					<div id="editquestion_msg" class="alert">
							<a class="close" data-dismiss="alert">×</a>
							<strong></strong>
				        </div>
					</fieldset>
				</form>
			  </p>
            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">关闭</a>
              <a href="#" class="btn btn-primary" id="editQuestion">保存</a>
            </div>
    </div>

	<div class="" style="margin-top:50px">
	
	<span id="add" class="btn btn-primary" data-toggle="modal" href="#modal">添加题目</span>
	
		<div style="margin-bottom:20px">
			<strong style="font-size:20px">试卷${paper.name}的题目列表</strong>
			<input type="hidden" value="${paper.id}" id="paperid">
		</div>
      <table class="table table-striped">
      		<tbody>
	      		<c:forEach items="${paper.questionSet}" var="question" varStatus="status">
	      			    <tr>
	      					<td>试题${status.count}问题</td>
			        		<td colspan=2 >
				        		<textarea rows="3" cols="15" style="width:400px" disabled="disabled">${question.question }</textarea>
			        		</td>
			        		<td >正确答案
			        			<select style="width:60px">
			        				<option value="${question.rightAnswer}" >${question.rightAnswer}</option>
			        			</select>
			        			<br>
			        			<span>分值</span><input type="text" disabled="disabled" value="${question.score}" style="width:80px">
			        		</td>
			        		<td>
			        			<a class="btn"  onclick="editQuestion(this)" ref="${question.id}" data-toggle="modal" href="#edit">编辑该题目</a>
			        			<a class="btn btn-danger" href="javascript:;" onclick="delQuestion(this)" ref="${question.id}">删除该题目</a>
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
    		
			$("#addquestion_msg").hide();
			$("#editquestion_msg").hide();
			
			$("#editQuestion").click(function(){
				
				question=$("#editquestion").val().trim();
				score=$("#editscore").val().trim();
				
				editanswers=$("#editanswers");
				var answers="";
				for(var i=1;i<editanswers.parent().parent().children("td").size();i++){
					ans=editanswers.parent().parent().children("td").eq(i).children("input").eq(0).val().trim();
					if(""!=ans){
						answers+=ans+"&&";
					}else{
						break;
					}
				}
				
				if(""!=answers){
					editanswers.val(answers);
				}
				
				if(""!=question&&""!=score&&""!=answers){
					
					$("#editQuestionForm").submit();
				}else{
					$("#editquestion_msg").show();
					$("#editquestion_msg").children("strong").text("题目名称、分值和答案不允许为空");
				}
				
				
			});
			
			
			
			$("#addQuestion").click(function(){
				
				question=$("#addquestion").val().trim();
				score=$("#addscore").val().trim();
				
				addanswers=$("#addanswers");
				var answers="";
				for(var i=1;i<addanswers.parent().parent().children("td").size();i++){
					ans=addanswers.parent().parent().children("td").eq(i).children("input").eq(0).val().trim();
					if(""!=ans){
						answers+=ans+"&&";
					}else{
						break;
					}
				}
				
				if(""!=answers){
					addanswers.val(answers);
				}
				
				if(""!=question&&""!=score&&""!=answers){
					$("#addQuestionForm").submit();
				}else{
					$("#addquestion_msg").show();
					$("#addquestion_msg").children("strong").text("题目名称、分值和答案不允许为空");
				}
				
				
				/* paperid=$("#paperid").val();
				form=$("#addQuestionTable");
				
				var s=form.children("tr").size()/2;
				var a=0;
				for(var i=0;i<form.children("tr").size()/2;i++){
					
					question=form.children("tr").eq(2*i).children("td").eq(1).children("textarea").eq(0).val();
					score=form.children("tr").eq(2*i).children("td").eq(2).children("input").eq(0).val();
					rightAnswer=form.children("tr").eq(2*i).children("td").eq(2).children("select").eq(0).val();
					var answers="";
					for(var j=1;j<5;j++){
						var ans=form.children("tr").eq(2*i+1).children("td").eq(j).children("input").eq(0).val();
						if(""!=ans.trim()){
							answers+=ans+"&&";
						}else{
							break;
						}
					}
					
					alert(answers);
					//"question.question":question,"question.rightAnswer":rightAnswer,"question.answers":answers,"question.score":score,"papperid":papperid
					$.post("addQuestion",{"question.question":question,"question.rightAnswer":rightAnswer,"question.answers":answers,"question.score":score},function(rs){
						alert(rs);
						if(rs.trim()=="addquestion_success"){
							a=a+1;
							alert(a+"========"+s);
						}
					});
				} */
				
				
			});
			
			
			
    	});
    	
    	function delQuestion(obj){
    	
    		isdel=confirm("确定删除该题目吗?");
    		if(true==isdel){
    			id=$(obj).attr("ref");
    		
	    		$.get("deleteQuestion",{questionid:id},function(rs){
	    			if(rs.trim()=="delquestion_success"){
	    				$("#code").children("strong").text("删除题目成功");
		  				$("#code").show();
		  				
		  				index=$(obj).parent().parent().index();
		  				$(obj).parent().parent().parent().children("tr").eq(index+1).remove();
		  				$(obj).parent().parent().remove();
		  				
	    			}else{
	    				$("#code").children("strong").text("删除题目失败");
		  				$("#code").show();
	    			}
	    		});
    		}
    		
    	}
    	
    	
    		function editQuestion(obj){
    			
    			id=$(obj).attr("ref");
				$("#editquestionid").val(id);
				
    			firsttr=$(obj).parent().parent();
    			secondtr=firsttr.parent().children("tr").eq(firsttr.index()+1);
    			
    			question=firsttr.children("td").eq(1).children("textarea").eq(0).val();
    			rightAnswer=firsttr.children("td").eq(2).children("select").val().trim();
    			score=firsttr.children("td").eq(2).children("input").val();
    			
    			$("#editquestion").val(question);
    			$("#editscore").val(score);
    			
    			editanswers=$("#editanswers").parent().parent().children("td");
    			
    			for(var i=1;i<secondtr.children("td").size();i++){
    				choose=secondtr.children("td").eq(i).children("input").val();
    				editanswers.eq(i).children("input").eq(0).val(choose);
    			}
    			
    			options=$("#editrightAnswer").children("option");
    			for(var i=0;i<options.size();i++){
    				if(options.eq(i).val()==rightAnswer){
    					options.eq(i).attr("selected","selected");
    					//alert(options.eq(i).val());
    				}else{
    					options.eq(i).removeAttr("selected");
    				}
    			}
    			
    		 }
    	
    </script>
	
</body>
</html>
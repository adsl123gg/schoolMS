<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./admin_head.jsp" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>课程信息</title>
	
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
	<span id="add" class="btn btn-primary" data-toggle="modal" href="#modal">添加课程</span>
	
	<!-- 添加课程的框 -->
	<div id="modal" class="modal hide fade in" style="display:none;">
            <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>添加课程</h3>
            </div>
            <div class="modal-body">
              <p>
				<form class="form-horizontal" id="addCourseForm" action="addCourse" method="post">
					<fieldset>
					  <div class="control-group">
						<label class="control-label" >课程名称</label>
						<div class="controls">
						  <input type="text" name="course.coursename" id="addcoursename">
						</div>
					  </div>
					   <div class="control-group">
						<label class="control-label" >任课教师</label>
						<div class="controls">
						  <select  name="teacherid" id="addteacherid">
						  	<c:forEach items="${teachers}" var="teacher">
						  		<option value="${teacher.id }" >${teacher.name}</option>
						  	</c:forEach>
						  </select>
						</div>
					  </div> 
					  <div class="control-group">
						<label class="control-label" >上课地点</label>
						<div class="controls">
						  <input type="text" name="course.address" id="addaddress">
						</div>
					  </div> 
					  <div class="control-group">
						<label class="control-label" >学分</label>
						<div class="controls">
							<input type="text" name="course.credit" id="addcredit">
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label" >课程属性</label>
						<div class="controls">
						  <select  name="course.property">
						  	<option value="必修">必修</option>
						  	<option value="选修">选修</option>
						  </select>
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label" >上课时间</label>
						<div class="controls">
						  <a class="btn" id="bb">click</a>
						  <input type="hidden" name="course.time" id="addtime">
						</div>
					  </div>
					  <div id="addcourse_msg" class="alert control-group">
							<a class="close" data-dismiss="alert">×</a>
							<strong></strong>
				        </div>
					</fieldset>
				</form>
			  </p>
            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">关闭</a>
              <a href="#" class="btn btn-primary" id="addCourse">保存</a>
            </div>
          </div>
	
      <table class="table table-striped">
	        <thead>
          <tr>
            <th colspan=7><strong ><h3>课程名称</h3></strong></th>
          </tr>
		  <tr>
				<td>课程名称</td>
				<td>任课教师</td>
				<td>上课地点</td>
				<td>上课时间</td>
				<td>学分</td>
				<td>属性</td>
			</tr>
        </thead>
        <tbody>
        	<c:forEach items="${courses }" var="course">
        		<tr>
					<td>${course.coursename }</td>
					<td>${course.teacher.name }</td>
					<td>${course.address }</td>
					<td ref="${course.time}">
						<select style="width:130px">
							<c:forTokens items="${course.time}" delims="&&" var="t">
								<c:if test="${not empty t }">
									<option>${t}</option>
								</c:if>
							</c:forTokens>
						</select>
						<!-- <select >
							<option></option>
						</select> -->
					</td>
					<td>${course.credit }</td>
					<td>${course.property }</td>
					<td><a class="btn" onclick="editCourse(this)" ref="${course.id}" data-toggle="modal" href="#edit">修改</a>
					<a class="btn btn-danger" href="javascript:;"  onclick="delCourse(this)" ref="${course.id}" >删除</a></td>
				</tr>
        	</c:forEach>
        </tbody>
      </table>
    
	
	<!-- 修改课程的框 -->
	<div id="edit" class="modal hide fade in" style="display: none;">
           <div class="modal-header">
              <a class="close" data-dismiss="modal">×</a>
              <h3>修改课程</h3>
            </div>
            <div class="modal-body">
              <p>
				<form class="form-horizontal" id="updateCourseForm" action="updateCourse" method="post">
					<fieldset>
						<input type ="hidden" name="courseid" id="hiddenid">
					  <div class="control-group">
						<label class="control-label" >课程名称</label>
						<div class="controls">
						  <input type="text" name="course.coursename" id="editcoursename">
						</div>
					  </div>
					   <div class="control-group">
						<label class="control-label" >任课教师</label>
						<div class="controls">
						  <select  name="teacherid" id="editteacherid">
						  	<c:forEach items="${teachers}" var="teacher">
						  		<option value="${teacher.id }" >${teacher.name}</option>
						  	</c:forEach>
						  	<!-- <option selected="selected" >你好</option> -->
						  </select>
						</div>
					  </div> 
					  <div class="control-group">
						<label class="control-label" >上课地点</label>
						<div class="controls">
						  <input type="text" name="course.address" id="editaddress">
						</div>
					  </div> 
					  <div class="control-group">
						<label class="control-label" >学分</label>
						<div class="controls">
							<input type="text" name="course.credit" id="editcredit">
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label" >课程属性</label>
						<div class="controls">
						  <select  name="course.property">
						  	<option value="必修" >必修</option>
						  	<option value="选修">选修</option>
						  </select>
						</div>
					  </div>
					  <div class="control-group">
						<label class="control-label" >上课时间</label>
						<div class="controls">
						  <a class="btn" id="ee">click</a>
						  <input type="hidden" name="course.time" id="edittime">
						</div>
					  </div>
					  <div id="updatecourse_msg" class="alert control-group">
							<a class="close" data-dismiss="alert">×</a>
							<strong></strong>
				        </div>
					</fieldset>
				</form>
			  </p>
            </div>
            <div class="modal-footer">
              <a href="#" class="btn" data-dismiss="modal">关闭</a>
              <a href="#" class="btn btn-primary" id="updateCourse">保存</a>
            </div>
    </div>
         
      <div id="course" class="modal hide fade in" style="display:none;width:340px;height:239px">
      	<table class="" border="1" style="display:inline">
	      <thead>
          <tr>
            <th colspan=1></th>
            
            <th>星期一</th>
            <th>星期二</th>
            <th>星期三</th>
            <th>星期四</th>
            <th>星期五</th>
          </tr>
        </thead>
        <tbody>
          <tr>
          	<td>第一节</td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
			<td onclick="duihao(this)"></td>
          </tr>
          <tr>
          	<td>第二节</td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          </tr>
          <tr>
          	<td>第三节</td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          </tr>
          <tr>
          	<td>第四节</td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          </tr>
          <tr>
          	<td>第五节</td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          </tr>
          <tr>
          	<td>第六节</td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          </tr>
          <tr>
          	<td>第七节</td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          </tr>
          <tr>
          	<td>第八节</td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          </tr>
          <tr>
          	<td>第九节</td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          </tr>
          <tr>
          	<td>第十节</td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          	<td onclick="duihao(this)"></td>
          </tr>
        </tbody>
      </table>
      <a id="close_course"><i class="icon-remove"></i></a>
    </div>
    
		  
	</div>
	
	<script type="text/javascript">
		
		var offset;
		
		$(document).ready(function(){
		
			$("#addcourse_msg").hide();
			$("#updatecourse_msg").hide();
			
			
			$("#addCourse").click(function(){
				teacherid=$("#addteacherid").val();
				coursename=$("#addcoursename").val();
				address=$("#addaddress").val();
				credit=$("#addcredit").val();
				time=$("#addtime").val();
				
				//alert(time);
				if(coursename!=""&&address!=""&&credit!=""&&time!=""){
					$.get("checkCourseOfTeacher",{teacherid:teacherid,time:time,courseid:""},function(rs){
						if("checkcourseofteacher_success"==rs){
							$("#addCourseForm").submit();
						}else{
							alert("任课教师上课时间冲突");
						}
					});
					
				}else{
					$("#addcourse_msg").children("strong").text("以上信息不允许为空");
					$("#addcourse_msg").show();
				}
				
			});
			
			$("#updateCourse").click(function(){
				courseid=$("#hiddenid").val();
				teacherid=$("#editteacherid").val();
				coursename=$("#editcoursename").val();
				address=$("#editaddress").val();
				credit=$("#editcredit").val();
				time=$("#edittime").val();
				
				if(coursename!=""&&address!=""&&credit!=""&&time!=""){
					$.get("checkCourseOfTeacher",{teacherid:teacherid,time:time,courseid:courseid},function(rs){
						if("checkcourseofteacher_success"==rs){
							$("#updateCourseForm").submit();
						}else{
							alert("任课教师上课时间冲突");
						}
					});
					//
				}else{
					$("#updatecourse_msg").children("strong").text("以上信息不允许为空");
					$("#updatecourse_msg").show();
				}
				
			});
			
			
			//don't edit,it's important
			//------------------------------------------------------------------
			
			//编辑课程的代码
			//+++++++++++++++++++++++++++++
			$("#ee").click(function(){
					t=$("#course").css("display").trim();
					if("block"==t){
						$("#course").css("display","none");
					}else{
						$("#course").css("display","block");
						$("#course").offset({ top: offset.top, left: offset.left });
					}
			});
			//+++++++++++++++++++++++++++++
			
			//添加课程的代码
			//+++++++++++++++++++++++++++++
			$("#bb").click(function(){
					//$("#course").css("display","none");
					t=$("#course").css("display").trim();
					if("block"==t){
						$("#course").css("display","none");
					}else{
						$("#course").css("display","block");
						$("#course").offset({ top: offset.top, left: offset.left });
					}
			});
			
			$("#add").click(function(){
				setTimeout(function(){
					offset=$("#bb").offset();
				},1000);
				
			});
			//+++++++++++++++++++++++++++++
			
			$("#close_course").click(function(){
				var rs="";
				tds=$("#course").find("td");
				//alert(tds.eq(0).text("afda"));
				for(var i=0;i<tds.size();i++){
					if(tds.eq(i).text()=="上课"){
						rs+=tds.eq(i).attr("x")+"-"+tds.eq(i).attr("y")+"&&";
						tds.eq(i).text("");
					}
				}
				$("#addtime").val(rs);
				$("#edittime").val(rs);
				$("#course").css("display","none");
				
				//删除痕迹
				for(var i=0;i<tds.size();i++){
					tds.eq(i).removeAttr("x");
					tds.eq(i).removeAttr("y");
				}
				
			});
			//------------------------------------------------------------------
			
		});
		
		function delCourse(obj){
			result=confirm("确定删除课程吗");
			if(true==result){
				id=$(obj).attr("ref");
				$.get("deleteCourse",{courseid:id},function(rs){
					if("deletecourse_success"==rs.trim()){
						$("#code").children("strong").text("删除课程成功");
						$("#code").show();
						$(obj).parent().parent().remove();
					}else{
						$("#code").children("strong").text("删除课程失败");
						$("#code").show();
					}
					
				});
			}
			
		}
		
		
		//don't edit,it's important
		//------------------------------------------------------------------
		function editCourse(obj){
		
			$("#hiddenid").val($(obj).attr("ref"));
			
			tds=$(obj).parent().parent().children("td");
			
			coursename=tds.eq(0).text().trim();
			teachername=tds.eq(1).text().trim();
			address=tds.eq(2).text().trim();
			time=tds.eq(3).attr("ref");
			credit=tds.eq(4).text().trim();
			property=tds.eq(5).text().trim();
			
			$("#editcoursename").val(coursename);
			$("#editaddress").val(address);
			$("#editcredit").val(credit);
			
			
			/* $("#editcoursename").val(coursename);
			$("#editcoursename").val(coursename); */
			
			/* tds=$(obj).parent().parent().children("td");
			teachername=tds.eq(1).text().trim();
			//alert(teachername);
			
			ops=$("#teacherid").children("option");
			for(var i=0;i<ops.size();i++){
				if(teachername==ops.eq(i).text().trim()){
					ops.eq(i).attr("selected","selected");
					ops.eq(i).remove();
					$("#teacherid").prepend(ops.eq(i)); 
					//alert(ops.eq(i).text().trim());
				}
			} */
			
			//settime(time);
			
			setTimeout(function(){
					offset=$("#ee").offset();
			},1000);
			
		}
		
		//根据该课程的时间，将$("#course")里面设置为相应的时间
		function settime(t){
			//alert(t);
			tt=t.split("&&");
			alert(tt[0]);
			for(var i=0;i<tt.length;i++){
				
			}
		}
		
		function duihao(obj){
			if($(obj).text().trim()==""){
				$(obj).text("上课");
				
				x=$(obj).parent().children().eq(0).text();
				y=$(obj).parent().children("td").index($(obj));
				$(obj).attr("x",x);
				$(obj).attr("y",y);
			
			}else{
				$(obj).text("");
				$(obj).removeAttr("x");
				$(obj).removeAttr("y");
			}
			
		}
		//------------------------------------------------------------------
		
		
	</script>
	
</body>
</html>
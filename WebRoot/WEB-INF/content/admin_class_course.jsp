<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./admin_head.jsp" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>学生课程</title>
	
</head>
<body class="container">

	<div class="" style="margin-top:50px">
      <table class="table table-striped table-bordered">
	        <thead>
          <tr>
            <th colspan=2></th>
            
            <th>星期一</th>
            <th>星期二</th>
            <th>星期三</th>
            <th>星期四</th>
            <th>星期五</th>
          </tr>
        </thead>
        <tbody>
          <tr>
          	<td rowspan=4>上午</td>
          	<td id="one">第一节</td>
          	<td></td>
          	<td></td>
          	<td></td>
          	<td></td>
			<td></td>
          </tr>
          <tr>
          	<td id="two">第二节</td>
          	<td></td>
          	<td></td>
          	<td></td>
          	<td></td>
          	<td></td>
          </tr>
          <tr>
          	<td id="three">第三节</td>
          	<td></td>
          	<td></td>
          	<td></td>
          	<td></td>
          	<td></td>
          </tr>
          <tr>
          	<td id="four">第四节</td>
          	<td></td>
          	<td></td>
          	<td></td>
          	<td></td>
          	<td></td>
          </tr>
          <tr>
          	<td rowspan=4>下午</td>
          	<td id="five">第五节</td>
          	<td></td>
          	<td></td>
          	<td></td>
          	<td></td>
          	<td></td>
          </tr>
          <tr>
          	<td id="six">第六节</td>
          	<td></td>
          	<td></td>
          	<td></td>
          	<td></td>
          	<td></td>
          </tr>
          <tr>
          	<td id="seven">第七节</td>
          	<td></td>
          	<td></td>
          	<td></td>
          	<td></td>
          	<td></td>
          </tr>
          <tr>
          	<td id="eight">第八节</td>
          	<td></td>
          	<td></td>
          	<td></td>
          	<td></td>
          	<td></td>
          </tr>
          <tr>
          	<td rowspan=2>晚上</td>
          	<td id="nine">第九节</td>
          	<td></td>
          	<td></td>
          	<td></td>
          	<td></td>
          	<td></td>
          </tr>
          <tr>
          	<td id="ten">第十节</td>
          	<td></td>
          	<td></td>
          	<td></td>
          	<td></td>
          	<td></td>
          </tr>
        </tbody>
      </table>
    </div>
    
    <table class="table table-striped">
	        <thead>
          <tr>
            <th colspan=6><strong ><h5>设定${clazz.classname}的课程</h5></strong></th>
            <th>
            	<form action="saveClassCourse" method="post" id="saveCourseForm">
            		<input type="hidden" name="classcourse" id="classcourse">
            		<input type="hidden" name="classid" value="${clazz.id}">
            	</form>
            	<button class="btn btn-primary" id="saveCourse">保存课表</button>
            </th>
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
						
					</td>
					<td>${course.credit }</td>
					<td>${course.property }</td>
					<td><a class="btn btn-success" onclick="setCourse(this)" ref="${course.id}" href="javascript:;">设定</a></td>
				</tr>
        	</c:forEach>
        </tbody>
      </table>
      
      <div type="hidden" id="from">
      	<c:forEach items="${classcourseset}" var ="s">
      		<input type="hidden" courseid="${s.id }" coursetime="${s.time}" coursename="${s.coursename}"/>
      	</c:forEach>
      </div>
      
      <script type="text/javascript">
      	$(document).ready(function(){
      		
      		$("#saveCourse").click(function(){
      			/* if($("#classcourse").val().trim()!=""){
      				$("#saveCourseForm").submit();
      			} */
      			$("#saveCourseForm").submit();
      		});
      		
      		
      		showCourse($("#from"));
      	});
      	
      	function showCourse(obj){
      		classcourses=$(obj).children("input");
			
			/* alert(classcourses.eq(0).attr("coursetime"));
			alert(classcourses.eq(1).attr("coursetime")); */
      		for(var i=0;i<classcourses.size();i++){
      			
      			time=classcourses.eq(i).attr("coursetime");
	      		coursename=classcourses.eq(i).attr("coursename");
	      		id=classcourses.eq(i).attr("courseid");
      		
	      		var ts=time.split("&&");
	      		
	      		for(var j=0;j<ts.length;j++){
	      			r=getrow(ts[j]);
	      			s=getcol(ts[j]);
	      			index=$("#"+r).index();
	      			
	      			$("#"+r).parent().children("td").eq(index+s).text(coursename);
	      			$("#classcourse").val($("#classcourse").val()+id+";");
	      		}
      		}
      		
      	}
      	
      	function setCourse(obj){
      		time=$(obj).parent().parent().children().eq(3).attr("ref");
      		coursename=$(obj).parent().parent().children().eq(0).text();
      		id=$(obj).attr("ref");
      		
      		ts=time.split("&&");
      		//确认是否冲突
      		for(var i=0;i<ts.length;i++){
      			r=getrow(ts[i]);
      			s=getcol(ts[i]);
      			index=$("#"+r).index();
      			content=$("#"+r).parent().children("td").eq(index+s).text();
      			if(content!=""&&content!=coursename){
      				alert("课程"+coursename+"和"+getday(s)+getcount(r)+"的"+content+"冲突");
      				return;
      			}
      		}
      		
      		//在课程表上显示课程
      		for(var i=0;i<ts.length;i++){
      			r=getrow(ts[i]);
      			s=getcol(ts[i]);
      			index=$("#"+r).index();
      			if($("#"+r).parent().children("td").eq(index+s).text()==""){
      				$("#"+r).parent().children("td").eq(index+s).text(coursename);
      				$("#classcourse").val($("#classcourse").val()+id+";");
      			}else{
      				$("#"+r).parent().children("td").eq(index+s).text("");
      				$("#classcourse").val($("#classcourse").val().replace(id+";",""));
      			}
      		}
      		
      	}
      	
      	function getcount(r){
      		if("one"==r){
      			return "第一节课";
      		}else if("two"==r){
      			return "第二节课";
      		}else if("three"==r){
      			return "第三节课";
      		}else if("four"==r){
      			return "第四节课";
      		}else if("five"==r){
      			return "第五节课";
      		}else if("six"==r){
      			return "第六节课";
      		}else if("seven"==r){
      			return "第七节课";
      		}else if("eight"==r){
      			return "第八节课";
      		}else if("nine"==r){
      			return "第九节课";
      		}else if("ten"==r){
      			return "第十节课";
      		}
      	}
      	
      	function getday(s){
      		if(s==1){
      			return "周一";
      		}else if(s==2){
      			return "周二";
      		}else if(s==3){
      			return "周三";
      		}else if(s==4){
      			return "周四";
      		}else if(s==5){
      			return "周五";
      		}
      	}
      	
      	function getcol(time){
      		if(time.indexOf("星期一")>-1){
      			return 1;
      		}else if(time.indexOf("星期二")>-1){
      			return 2;
      		}else if(time.indexOf("星期三")>-1){
      			return 3;
      		}else if(time.indexOf("星期四")>-1){
      			return 4;
      		}else if(time.indexOf("星期五")>-1){
      			return 5;
      		}
      	}
      	
      	function getrow(time){
      		if(time.indexOf("第一节")>-1){
      			return "one";
      		}else if(time.indexOf("第二节")>-1){
      			return "two";
      		}else if(time.indexOf("第三节")>-1){
      			return "three";
      		}else if(time.indexOf("第四节")>-1){
      			return "four";
      		}else if(time.indexOf("第五节")>-1){
      			return "five";
      		}else if(time.indexOf("第六节")>-1){
      			return "six";
      		}else if(time.indexOf("第七节")>-1){
      			return "seven";
      		}else if(time.indexOf("第八节")>-1){
      			return "eight";
      		}else if(time.indexOf("第九节")>-1){
      			return "nine";
      		}else if(time.indexOf("第十节")>-1){
      			return "ten";
      		}
      	}
      
      </script>
	
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./admin_head.jsp" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>试卷管理</title>
	
</head>
<body class="container">

	<div class="" style="margin-top:50px">

        <table class="table table-striped">
	        <thead>
          <tr>
            <th colspan=8><strong ><h3>当前试卷列表</h3></strong></th>
          </tr>
		  <tr>
				<td>试卷名称</td>
				<td>出题者</td>
				<td>试卷状态</td>
				<td>题目数量</td>
				<td>操作</td>
			</tr>
        </thead>
        <tbody>
        	<c:forEach items="${papers }" var="paper">
        		<tr>
					<td><a href="adminPaperInfo?paperid=${paper.id}">${paper.name }</a></td>
					<td>${paper.teacher.name }</td>
					<td>${paper.state }</td>
					<td>当前试卷有${fn:length(paper.questionSet)}道题</td>
					<td>
						<button class="btn btn-success" onclick="verifypaper(this)" ref="${paper.id }">通过审核</button>
						<form action="verifyPaper" method="post" style="display:none">
							<input type="hidden" name="paperid" value="${paper.id}">
						</form>
					</td>
				</tr>
        	</c:forEach>
        </tbody>
      </table>
    </div>
	
    
    <script type="text/javascript">
    
    	function verifypaper(obj){
    		rs=confirm("确定该试卷通过审核吗，审核通过的试卷可直接作为考试试题！");
    		if(rs==true){
	    		//$("#verifypaperform").submit();
	    		$(obj).parent().children("form").eq(0).submit();
	    		//$(obj).parent.parent().children("td").eq(1).text("审核通过");
    		}
    	}
    
    </script>
	
</body>
</html>
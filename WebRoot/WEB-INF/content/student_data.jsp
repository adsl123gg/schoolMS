<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="./student_head.jsp" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>资料共享库</title>
	
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

	<div class="container" style="margin-top:70px;margin-bottom:20px"><span style="font-size:32px;">资料共享库</span></div>
	
	<div class="span12 container">
      <table class="table table-striped">
	     <thead>
          
        </thead>
        <tbody>
        	<c:forEach items="${datas}" var="data">
        		<tr>
		          <td class="span10"> <a href="downloadfile?fileName=${data.savename}">${data.filename}</a></td>
				  <td>${fn:substringBefore(data.createtime," ")}</td>
		        </tr>
        	</c:forEach>
         
        </tbody>
      </table>
    </div>
    
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
	table, th, td{
      border: 1px solid black;
      border-collapse: collapse;
      padding: 5px 10px;
   }
   button{
      margin: 5px;
   }
   table {
      width: 500px;
   }
   input[type="text"]{
      width: 40%;   
   }
   #search{
      display: inline-block;
   }
   colgroup {
      width: 30%;
   }
   #chkBtn{
   	 float: left;
   }
   #rightt{
   	float: right;
   }
   #listBack{
   	background: aqua;
   }
</style>
</head>
<body>
   	     <form action="report_CommentWrite.do" method="post">
		   <input type="hidden" name="rept_no" value="${dto.rept_no}">
		   <table>
		   		<tr>
		   			<th>관리자 아이디</th>
		   			<td><input type="text" name="id" value="${sessionScope.loginId}" readonly></td>
		   		</tr>
		   		<tr>
		   			<th>처리사유</th>
		   			<td><textarea name="proc_content"></textarea></td>
		   		</tr>
		   		<tr>
		   			<th>처리상태</th>
		   			<td>
			   			<select name="rept_state">
					   	  	<option value="처리중">처리중</option>
					   	  	<option value="처리완료">처리완료</option>
					   	  	<option value="반려">반려</option>
					   	</select>
		   	  		</td>
		   		</tr>		   		
		   </table>		   	
		   <button>신고 처리 하기</button>
		   <input type="button" onclick="location.href='reportList.go'" value="취소">
		</form>
</body>
<script>

</script>
</html>
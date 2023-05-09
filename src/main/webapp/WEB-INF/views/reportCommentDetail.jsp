<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<jsp:include page="gnb.jsp"/>
     <input type="hidden" name="rept_no" value="${dto.rept_no}">
	   <table>
	   		<tr>
	   			<th>관리자 아이디</th>
	   			<td>${dto.admin_id}</td>
	   		</tr>
	   		<tr>
	   			<th>처리사유</th>
	   			<td>${dto.proc_content}</td>
	   		</tr>
	   		<tr>
	   			<th>처리상태</th>
	   			<td>
		   			${dto.rept_state}
	   	  		</td>
	   		</tr>		   		
	   </table>	     
</body>
<script>

</script>
</html>
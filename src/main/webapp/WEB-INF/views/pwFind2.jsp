<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/css.css">
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
   table, th, td{
      border: 1px solid black;
      border-collapse: collapse;
      padding: 5px 10px;
   }
   button {
      margin: 5px;
   }
   table{
      width: 500px;
   }
</style>
</head>
<body>
	<jsp:include page="gnb.jsp"/>
	<h3>비밀번호 찾기 (2/3)</h3>
	<form action="pwFind3.go" method="get">	   
	   <table>
		  <tr>
	         <th>아이디</th>
	         <td><input type="text" name="id" value="${sessionScope.id}" readonly></td>
	      </tr>
	      <tr>
	         <th>본인확인 질문</th>
	         <td><input type="text" name="chkreq" value="${sessionScope.chkreq}" readonly></td>
	      </tr>
	      <tr>
	         <th>본인확인 답변</th>
	         <td><input type="text" name="chkresp" placeholder="답변을 입력해주세요 !"></td>
	      </tr>
	      <tr>
	         <th colspan="2">
	            <button>비밀번호 확인</button>
	         </th>         
	      </tr>
	   </table>
   </form>
</body>
<script>
	var msg = "${msg}";
	if(msg!=""){
		alert(msg);
	}
</script>
</html>
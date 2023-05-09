<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
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
	<h3>비밀번호 찾기 (1/3)</h3>
	<form action="pwFind2.go" method="get">	   
	   <table>
	      <tr>
	         <th>아이디</th>
	         <td><input type="text" name="id"></td>
	      </tr>
	      <tr>
	         <th>번호</th>
	         <td><input type="number" name="phone"></td>
	      </tr>
	      <tr>
	         <th colspan="2">
	            <button>본인확인 질문/답변 이동</button>
	         </th>         
	      </tr>
	   </table>
   </form>
</body>
<script>
	var msg = "${result}";
	if(msg!=""){
		alert(msg);
	}
</script>
</html>
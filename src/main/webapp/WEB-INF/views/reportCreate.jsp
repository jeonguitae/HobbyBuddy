<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	table, th, td{
		border : 1px solid black;
		border-collapse: collapse;
		padding : 5px 10px;
	}

</style>

</head>
<body>
	<form action="report.do" method="post">
		<table>
			<tr>
				<th>신고 대상 아이디</th>
				<td>reprotMsg.jsp로 신고해주세요~</td>
			<tr>
				<th>사진<th>
						
			</tr>			
			<tr>
				<th colspan="2">
					<input type="button" onclick="location.href='./'" value="신고등록"/>
					<input type="button" onclick="location.href='./'" value="취소"/>
				</th>
			</tr>
		</table>	
	</form>
</body>
<script>

</script>
</html>
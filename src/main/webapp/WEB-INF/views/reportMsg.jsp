<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/css.css">
<title>쪽지 신고하기</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
</style>
</head>
<body>
	<jsp:include page="gnb.jsp"/>
	<h3>쪽지 신고하기</h3>
	<form action="reportMsg.do" method="get">
		<table>
			<tr>
				<th>신고 아이디</th>
				<td><input type="text" name="reporter" value="${id_send}" readonly/></td>
			</tr>
			<tr>
				<th>내 아이디</th>
				<td><input type="text" name="preporter" value="${sessionScope.loginId}" readonly/></td>
			</tr>
			<tr>
				<th>게시판 분류</th>
				<td><input type="text" name="reptboard_class" value="쪽지" readonly></td>
			</tr>
			<tr>
				<th>게시판 번호</th>
				<td><input type="text" name="reptboard_num" value="${msgNo}" readonly></td>
			</tr>
			<tr>
				<th>신고 제목</th>
				<td><input type="text" name="rept_title" value=""></td>
			</tr>
			<tr>
				<th>신고 내용</th>
				<td><input type="text" name="rept_content" value=""></td>
			</tr>
			<tr>
				<th>신고 하기</th>
				<td><button>신고 하기</button></td>
			</tr>
		</table>
	</form>
</body>
<script>
</script>
</html>
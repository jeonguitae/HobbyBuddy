<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
	}
	button{
		margin: 5px;
	}
	table{
		width: 500px;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<th>작성자</th>
			<td>${board.id}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${board.subject}</td>
		</tr>
		<tr>
			<th>나이 조건</th>
			<td>${board.minage}세 이상 ${board.maxage}세 이하</td>
		</tr>
		<tr>
			<th>지역</th>
			<td>${board.city} ${board.area}</td>
		</tr>
		<tr>
			<th>약속날짜</th>
			<td>${board.meeting_date}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${board.content}</td>
		</tr>
		<tr>
			<td colspan="2">
				<button onclick="location.href='gupdate.go?id=${board.gidx}'">수정하기</button>
				<button onclick="location.href='report.go'">신고하기</button>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<a href="./">리스트로 돌아가기</a>
			</th>
		</tr>
	</table>	
</body>
<script></script>
</html>
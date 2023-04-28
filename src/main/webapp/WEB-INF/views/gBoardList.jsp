<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	#login{
		margin-bottom: 20px;
	}
</style>
</head>
<body>
<h1>목진경</h1>
<h1>박희준</h1>
<h1>지웅ㅎ</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${list.size() == 0 }">
				<tr><th colspan="5">게시물이 없습니다.</th></tr>
			</c:if>
			<c:forEach items="${list}" var="bbs">
				<tr>
					<td>${bbs.idx}</td>
					<td><a href="detail.do?id=${bbs.idx}">${bbs.subject}</a></td>
					<td>${bbs.user_name}</td>
					<td>${bbs.bHit}</td>
					<td><a href="del.do?id=${bbs.idx}">삭제</a></td>
				</tr>			
			</c:forEach>
		</tbody>
	</table>
</body>
<script></script>
</html>
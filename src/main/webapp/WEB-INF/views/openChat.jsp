<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
</style>
</head>
<body>
	<form action="openlist.do" method="post">
		<button>참가자</button>
	</form>
		<table>
			<thead>
				<tr>
					<th>방 번호</th>
					<th>아이디</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach items="${list}" var="bbs">
					<tr>
						<td>${bbs.gidx}</td>
						<td>${bbs.loginId}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
</body>
<script></script>
</html>
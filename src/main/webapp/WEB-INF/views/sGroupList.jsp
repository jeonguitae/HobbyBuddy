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
<jsp:include page="gnb.jsp"/>
	<table class="sgjlist">
		
		<thead>
			<tr>
				<th>참가중인 유저</th>
			</tr>
		</thead>		
		
		<tbody>
			<c:forEach items="${sgjlist}" var="bbs">
				<tr>
					<th class="id">${bbs.id}</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
<script></script>
</html>
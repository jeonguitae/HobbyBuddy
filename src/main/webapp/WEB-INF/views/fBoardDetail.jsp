<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="resources/css/commons.css">
<style></style>
</head>
<body>
		<table>
			<tr>
				<th>제목</th>
				<td>${dto.title}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${dto.id}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${dto.fbTIme}</td>
			</tr>
			<tr>
				<th>사진</th>
				<td>${dto. }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${dto.content}</td>
			</tr>
			<c:if test="${dto.newFileName ne null}">
			<tr>
				<th>사진</th>
				<td><img width="500" src="/photo/${dto.newFileName}"/></td>
			</tr>
			</c:if>
			<tr>
				<th colspan="2">
					<input type="button" onclick="location.href='./list.do'" value="리스트"/>
					<input type="button" onclick="location.href='./update.go?idx=${dto.idx}'" value="수정"/>
				</th>
			</tr>
		</table>	
</body>
<script></script>
</html>
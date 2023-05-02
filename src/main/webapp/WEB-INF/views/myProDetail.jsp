<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style></style>
</head>
<body>
	<table>
		<tr>
			<th>id</th>
			<td>${dto.subject}</td>
		</tr>
		<tr>
			<th>name</th>
			<td>${dto.subject}</td>
		</tr>
		<tr>
			<th>email</th>
			<td>${dto.subject}</td>
		</tr>
		<tr>
			<th>phone</th>
			<td>${dto.subject}</td>
		</tr>
		<tr>
			<th>age</th>
			<td>${dto.subject}</td>
		</tr>
		<tr>
			<th>city area</th>
			<td>${dto.subject}</td>
		</tr>
		<tr>
			<th>manner temp.</th>
			<td>${dto.subject}</td>
		</tr>
		<tr>
			<th>chkrep</th>
			<td>${dto.subject}</td>
		</tr>
		<tr>
			<th>chkresp</th>
			<td>${dto.subject}</td>
		</tr>
		<tr>
			<th>intr</th>
			<td>${dto.subject}</td>
		</tr>
		
		
		
		
		
		
		
		<tr>
			<th>작성자</th>
			<td>${dto.user_name}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${dto.reg_date}</td>
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
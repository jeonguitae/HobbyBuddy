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
	<form action="fwrite.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject"/></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="user_name"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content"></textarea></td>
			</tr>
			<tr>
				<th>사진</th>
				<td>
					<input type="file" name="photo"/>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" onclick="location.href='./'" value="리스트"/>
					<input type="button" onclick="location.href='/fdetail.do'" value="상세"/>저장
				</th>
			</tr>
		</table>	
	</form>
</body>
<script></script>
</html>
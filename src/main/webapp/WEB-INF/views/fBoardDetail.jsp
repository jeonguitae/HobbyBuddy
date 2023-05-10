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
	}
</style>
</head>
<body>
		<table>
			<tr>
				<th>분류</th>
				<td>${dto.big_hb} - ${dto.small_hb}</td>
			
			</tr>
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
				<td>${dto.fbTime}</td>
			</tr>
			<c:if test="${dto.new_photo_name ne null}">
			<tr>
				<th>사진</th>
				<td><img width="500" src="/photo/${dto.new_photo_name}"/></td>
			</tr>
			</c:if>
			<tr>
				<th>내용</th>
				<td>${dto.bContent}</td>
			</tr>
			
			
			<c:if test="${dto.id eq sessionScope.loginId}">
			<tr>
				<th colspan="2">
					<input type="hidden" name="board_class" value="${dto.board_class}">
					<input type="button" onclick="location.href='./fupdate.go?fbNo=${dto.fbNo}'" value="수정"/>
					<input type="button" onclick="location.href='./fdelete.do?fbNo=${dto.fbNo}'" value="삭제"/>
				</th>
			</tr>
			</c:if>
			
		</table>	
		<input type="button" onclick="location.href='./flist.go'" value="리스트"/>

</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
</script>
</html>
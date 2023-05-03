<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="resources/css/commons.css">
<style>
	table, th, td{
		border : 1px solid black;
		border-collapse: collapse;
		padding : 5px 10px;
		width : 800px;
		margin : 5px;
	}
	input.title, input.user, textarea.content{
		width : 640px;
	}
</style>
</head>
<body>
	<form action="fwrite.do" method="post" enctype="multipart/form-data">
		<table>
		<colgroup>
			<col width="20%">
			<col width="80%">
		</colgroup>
			<tr>
				<th>제목</th>
				<td><input class="title" type="text" name="subject"/></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input class="user" type="text" name="id"/></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea class="content" name="bContent"></textarea></td>
			</tr>
			<tr>
				<th>사진</th>
				<td>
					<input type="file" name="photo"/>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" onclick="location.href='./flist.go'" value="리스트"/>
					<input type="submit" value="저장"/>
				</th>
			</tr>
		</table>	
	</form>
</body>
<script>
	$('.writefin').on('click',function(){
		alert("글이 저장되었습니다.");
	})
</script>
</html>
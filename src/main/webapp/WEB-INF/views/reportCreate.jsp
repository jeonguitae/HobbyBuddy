<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

</style>

</head>
<body>
	<form action="report.do" method="post">
		<table>
			<tr>
				<th>신고 대상 아이디</th>
				<td><input type="text" name="user_name"/></td>
			</tr>					
			<tr>
				<%String gidx = request.getParameter("gidx");%>	
			    <th>신고 방번호</th>
			    <td><%= gidx %></td>
			</tr>			
			<tr>
				<th>신고 일시</th>
				<td></td>
			</tr>
			
			<tr>
				<th>신고 분류</th>
				<td>
					<select name="report">
						<option value="프로필">프로필</option>
						<option value="자유게시판">자유게시판</option>
						<option value="모임방">모임방</option>
						<option value="댓글">댓글</option>
						<option value="쪽지방">쪽지방</option>
						<option value="후기">후기</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<th>신고 제목</th>
				<td><input type="text" name="subject"/></td>
			</tr>		
			<tr>
				<th>신고 내용</th>
				<td><textarea name="content"></textarea></td>
			</tr>
			<tr>
				<th>사진<th>
						
			</tr>			
			<tr>
				<th colspan="2">
					<input type="button" onclick="location.href='./'" value="신고등록"/>
					<input type="button" onclick="location.href='./'" value="취소"/>
				</th>
			</tr>
		</table>	
	</form>
</body>
<script>

</script>
</html>
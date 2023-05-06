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
	<div class="memberList">
		<form action="memberlist.do" method="get">
			<table>
				
				<tr>
					<th>구분</th>
					<td>
						<input type="checkbox" name="admin" value="관리자">관리자
						<input type="checkbox" name="admin" value="회원">회원
					</td>
				</tr>
				<tr>
					<th>경고횟수</th>
					<td>
						<input type="checkbox" name="number" value="0회">0회
						<input type="checkbox" name="number" value="1회">1회
						<input type="checkbox" name="number" value="2회">2회
						<input type="checkbox" name="number" value="3회">3회
					</td>
				</tr>
				<tr>
					<th>정지여부</th>
					<td>
						<input type="checkbox" name="stop" value="정상 회원">정상 회원
						<input type="checkbox" name="stop" value="정지 회원">정지 회원
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="검색"/>
					</th>
				</tr>
		</table>	
		<table>
		<thead>
			<tr>
				<th>구분</th>
				<th>아이디</th>
				<th>경고횟수</th>
				<th>정지여부</th>
			</tr>
		</thead>		

	</table>
	</form>
	</div>
	
</body>
<script>

</script>
</html>
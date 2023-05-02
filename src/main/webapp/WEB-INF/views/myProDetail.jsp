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
			<td>${prodetail.id}</td>
		</tr>
		<tr>
			<th>name</th>
			<td>${prodetail.name}</td>
		</tr>
		<tr>
			<th>email</th>
			<td>${prodetail.email}</td>
		</tr>
		<tr>
			<th>phone</th>
			<td>${prodetail.phone}</td>
		</tr>
		<tr>
			<th>age</th>
			<td>${prodetail.age}</td>
		</tr>
		<tr>
			<th>city area</th>
			<td>${prodetail.city} ${prodetail.area}</td>
		</tr>
		<tr>
			<th>manner temp.</th>
			<td>${prodetail.mannertp}</td>
		</tr>
		<tr>
			<th>chkreq</th>
			<td>${prodetail.chkreq}</td>
		</tr>
		<tr>
			<th>chkresp</th>
			<td>${prodetail.chkresp}</td>
		</tr>
		<tr>
			<th>intr</th>
			<td>${prodetail.intr}</td>
		</tr>
		<tr>
			<th>random</th>
			<td>${prodetail.random}</td>
		</tr>
		<c:if test="${prodetail.newFileName ne null}">
			<tr>
				<th>프로필 사진</th>
				<td><img width="300" src="/photo/${prodetail.newFileName}"/></td>
			</tr>
		</c:if>
		<tr>
			<th colspan="2">
			<input type="button" onclick="location.href='./prodetailUpdate.go?id=${prodetail.id}'" value="수정"/>
			</th>
		</tr>
	</table>	
</body>
<script></script>
</html>
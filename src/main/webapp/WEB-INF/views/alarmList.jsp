<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>알림 리스트</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	table, th, td{
		border : 1px solid black;
		border-collapse: collapse;
		padding : 5px 10px;
		width : 800px;
		margin : 5px;
	}
</style>
</head>
<body>
	<jsp:include page="gnb.jsp"/>
	<table>
		<colgroup>
			<col width="20%"/>
			<col width="20%"/>
			<col width="40%"/>
			<col width="20%"/>

		</colgroup>
		<thead>
			<tr>
				<th>보낸 사람</th>
				<th>알림 제목</th>
				<th>알림 내용</th>
				<th>게시판, 번호</th>
			</tr>
		</thead>		
		<tbody>
			<c:if test="${alarmList eq null}">
				<tr>
					<th colspan="4">알림이 없습니다.</th>
				</tr>
			</c:if>
						
			<c:forEach items="${alarmList}" var="alarmList">
				<tr>
					<td>${alarmList.id_send}</td>
					<td><a href="fdetail.do?fbNo=${alarmList.alarm_num}">${alarmList.alarm_title}</a></td>
					<td>${alarmList.alarm_content}</td>
					<td>${alarmList.alarm_class}, ${alarmList.alarm_num}</td>
				</tr>
				
			</c:forEach>
		</tbody>
	</table>
</body>
<script>
</script>
</html>
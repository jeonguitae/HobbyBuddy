<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
	}
	button{
		margin: 5px;
	}
	table{
		width: 500px;
	}
</style>
</head>
<body>
<jsp:include page="gnb.jsp"/>
		<table>
			<tr>
				<th>글 번호</th>
				<td class="gidx">${board.gidx}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${board.id}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${board.subject}</td>
			</tr>
			<tr>
				<th>나이 조건</th>
				<td>${board.minage}세 이상 ${board.maxage}세 이하</td>
			</tr>
			<tr>
				<th>지역</th>
				<td>${board.city} ${board.area}</td>
			</tr>
			<c:if test="${board.new_photo_name ne null}">
				<tr>
					<th>사진</th>
					<td><img width="500" src="/photo/${board.new_photo_name}"/></td>
				</tr>
			</c:if>
			<tr>
				<th>약속날짜</th>
				<td>${board.meeting_date}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${board.content}</td>
			</tr>
			<tr>
				<th colspan="2">
				  <button onclick="location.href='gupdate.go?gidx=${board.gidx}&id=${board.id}'">수정하기</button>
				  <button onclick="location.href='greport.go?gidx=${board.gidx}&id_send=${board.id}&content=${board.content}'">신고하기</button>
				  <button id="del" onclick="location.href='gdelete.do?gidx=${board.gidx}&id=${board.id}'">삭제하기</button>
				</th>
			</tr>
			<tr>
				<th colspan="2">
					<a class="openchat" href="openchat.go?gidx=${board.gidx}">참가하기</a>
				</th>
			</tr>
			<tr>
				<th colspan="2">
					<input type="button" onclick="location.href='./glist.go'" value="리스트"/>
				</th>
			</tr>
		</table>
		
		<form class="secretSet" method="post" action="gboardSecretSet.do?gidx=${board.gidx}">
			<input type="hidden" name="writer_id" value="${dto.id}">
			<input type="hidden" name="sboard_title" value="${dto.title}">
			<input type="hidden" name="sboard_num" value="${dto.fbNo}">
			<input type="hidden" name="admin_id" value="${sessionScope.loginId}">			
			<button id="secretSet_btn" >비밀글 설정</button>
			
		</form>	
</body>
<script>
	var msg = "${msg}";
	if(msg != ""){
	   confirm(msg);
	}
	
	session.setAttribute("gidx", params.get("gidx"));
	$('a[class="openchat"]').click(function(){
		var loginId = "${sessionScope.loginId}";
		if(loginId != null){
			$('a[class="openchat"]').attr('href', 'openchat.go?gidx=${board.gidx}&loginId=' + loginId)
		}
	});
	
</script>
</html>
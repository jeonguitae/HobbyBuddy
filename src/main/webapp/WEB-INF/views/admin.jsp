<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>

</style>
</head>
<body>
<jsp:include page="gnb.jsp"/>
<button onclick="location.href='report_fboardList.go'" class="buttons"> 자유 게시판 신고 관리 가기</button>
<button onclick="location.href='report_gboardList.go'" class="buttons"> 모임방 신고 관리 가기</button>           
<button onclick="location.href='secretList.go'" class="buttons">비밀글 리스트 보기</button>
<button onclick="location.href='report_profileList.go'" class="buttons">프로필 신고 관리 가기</button>
<button onclick="location.href='report_msgList.go'" class="buttons">쪽지 신고 관리 가기</button>
<button onclick="location.href='memberList.go'" class="buttons">멤버 리스트 보기</button>  
</body>
<script>
var msg = "${msg}";
if(msg!=""){
	alert(msg);
}

</script>
</html>
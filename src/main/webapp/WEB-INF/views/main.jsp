<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
</style>
</head>
<body>
	<jsp:include page="gnb.jsp"/>
	<div>하비버디 메인화면입니다</div>
	<input type="button" value="로그인" class="loginIdChk" onclick="location.href='login.go'"/>
	<input type="button" value="회원가입" class="loginIdChk" onclick="location.href='join.go'"/>
	<input type="button" value="로그아웃" class="loginIdChk2" onclick="location.href='logout.go'"/>
	
	<input type="button" value="운동" onclick="location.href='join.go'"/>
	<input type="button" value="반려동물" onclick="location.href='join.go'"/>	
	<input type="button" value="맛집" onclick="location.href='join.go'"/>	
	<input type="button" value="여가" onclick="location.href='join.go'"/>	
	<input type="button" value="기타" onclick="location.href='join.go'"/>
	<input type="button" value="gnb" onclick="location.href='gnb.go'"/>
	

	
</body>
<script>
	var loginId = "${sessionScope.loginId}";
	list();
	function list(){
		if(loginId == ""){
			$('.loginIdChk2').hide();
		}else{
			$('.loginIdChk').hide();
   		}
	}

</script>
</html>
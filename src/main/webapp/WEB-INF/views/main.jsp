<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<link rel="stylesheet" href="resources/css/css.css">
<style>
	.mImg{
		float: none;
	
	}
	

</style>
</head>
<body>
	<jsp:include page="gnb.jsp"/>
	<input type="button" value="로그인" class="loginIdChk" onclick="location.href='login.go'"/>
	<input type="button" value="회원가입" class="loginIdChk" onclick="location.href='join.go'"/>
	<input type="button" value="로그아웃" class="loginIdChk2" onclick="location.href='logout.go'"/>
	
	<br/><br/><br/>
	
	<a href="./sportglist.go"><img width="150" src="/photo/운동.png" class="mImg"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="./petglist.go"><img width="150" src="/photo/반려.png" class="mImg"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="./foodglist.go"><img width="150" src="/photo/맛집.png" class="mImg"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="./leisureglist.go"><img width="150" src="/photo/여가.png" class="mImg"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="./etcglist.go"><img width="150" src="/photo/기타.png" class="mImg"/></a>
	
	<br/>
	
	<input type="button" value="운동" onclick="location.href='sportglist.go'"/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="반려동물" onclick="location.href='petglist.go'"/>	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="맛집" onclick="location.href='foodglist.go'"/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="여가" onclick="location.href='leisureglist.go'"/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" value="기타" onclick="location.href='etcglist.go'"/>

	
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
	
	var msg = "${msg}";
	if(msg!=""){
		alert(msg);
	}

</script>
</html>
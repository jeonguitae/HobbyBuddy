<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="resources/css/css.css">
<style>
   table, th, td{
      border: 1px solid black;
      border-collapse: collapse;
      padding: 5px 10px;
   }
   
</style>

</head>
<body>
   <form action="myp.do" method="post">
      <table>
      
      	<tr>
      		<th rowspan="8">&nbsp;&nbsp;&nbsp;&nbsp;<img width="500" src="/photo/${photo.new_photo_name}"/>&nbsp;&nbsp;&nbsp;&nbsp;
      		</th>
      		<th>아이디</th>
      		<td>&nbsp;&nbsp;&nbsp;&nbsp;${member.id}&nbsp;&nbsp;&nbsp;&nbsp;</td>
      		<th rowspan="2">
               <input type="submit" value="즐겨찾기"/>
            </th>
      	</tr>
      	<tr>
      		<th>이름</th>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;${member.name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
      	</tr>
      	<tr>
            <th>나이</th>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;${member.age}&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <th rowspan="2">
            	<input type="button" value="쪽지 보내기" onclick="location.href='msgChat.go?id_receive=${member.id}'"/>
            </th>
      	</tr>
      	<tr>
            <th>성별</th>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;${member.gender}&nbsp;&nbsp;&nbsp;&nbsp;</td>
      	</tr>
      	<tr>
            <th>지역</th>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;${member.area}&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <th rowspan="2">
      			<input type="button" value="프로필 신고" onclick="location.href='./report.go'"/>
      		</th>
      	</tr>
      	<tr>
            <th>취미</th>
            <td id="myHobbyList"></td>
      	</tr>      	
      	<tr>
            <th>매너온도</th>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;${member.mannertp}&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <th rowspan="2">
      			<input type="button" value="뒤로가기" onclick="redirect:/profile.go"/>
      		</th>
      	</tr>
      	<tr>
            <th>자기소개</th>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;${member.intr}&nbsp;&nbsp;&nbsp;&nbsp;</td>
      	</tr>
      </table>
      
      <br/>
      
      <table>
      	<tr>
      		<th>정지 상태</th>
      		<td>&nbsp;&nbsp;&nbsp;&nbsp;${member.ban}&nbsp;&nbsp;&nbsp;&nbsp;</td>
      		<td><input type="button" value="정지"/></td>
      	</tr>
      	<tr>
      		<th>경고 당한 횟수</th>
      		<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
      		<td><input type="button" value="경고"/> </td>
      	</tr>
      	<tr>
      		<th>랜덤매칭 동의 여부</th>
      		<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
      	</tr>
      	<tr>
      		<th>현재 방 생성 갯수</th>
      		<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
      	</tr>
      	
      </table>

   </form>
</body>

<script>
var member_id = "${member.id}";
HobbyList();
function HobbyList(){
	console.log("member_id : " + member_id);
	$.ajax({
		type:'get',
		url:'myHobbyList.ajax',
		data:{id:member_id},
		dataType:'json',
		success:function(data){
			console.log("data, myHobbyList : " + data.myHobbyList);
			console.log("data, login : " + data.login);
			if(!data.login){
				alert('로그인이 필요한 서비스 입니다.');
				location.href='./';
			}else{
				myHobbyListDraw(data.myHobbyList);
			}
		},
		error:function(e){
			console.log(e);
		}
	});	
}


function myHobbyListDraw(myHobbyList){
	console.log("myHobbyList : " + myHobbyList);
	var content = '';
	myHobbyList.forEach(function(item,index){
		content+= item.big_hb + " / " + item.small_hb + "<br/>" ;
		console.log(item.my_hobby_no);
	});
	
	$('#myHobbyList').empty();
	$('#myHobbyList').append(content);
}
</script>
</html>
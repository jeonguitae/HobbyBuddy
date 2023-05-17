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
      margin-top : 200px;
      
   }
 
 	body{
 	
 		margin-right :700px;
 		margin-left : 700px;
 	}
   #admin{
   	display: none;
   }
   
   
</style>

</head>
<jsp:include page="gnb.jsp"/>
<body>
     <!-- <form action="myp.do" method="post"> -->
      <table>
      
         <tr>
            <th rowspan="9"><img src="/photo/${photo.new_photo_name}"/>
            </th>
            <th>아이디</th>
            <td>${member.id}</td>
         </tr>
         <tr>
            <th>이름</th>
            <td>${member.name}</td>
         </tr>
         <tr>
            <th>나이</th>
            <td>${member.age}</td>
         </tr>
         <tr>
            <th>성별</th>
            <td>${member.gender}</td>
         </tr>
         <tr>
            <th>지역</th>
            <td>${member.area}</td>
         </tr>
         <tr>
            <th>취미</th>
            <td id="myHobbyList"></td>
         </tr>         
         <tr>
            <th>매너온도</th>
            <td>${member.mannertp}</td>
         </tr>
         <tr>
            <th>자기소개</th>
            <td>${member.intr}</td>
         </tr>
         <tr>
            <th>매너온도</th>
            <td>
               <input type="button" value="매너온도 + 1" onclick="location.href='mannertp.do?id_receive=${member.id}&tp_cal=plus'"/>
               <input type="button" value="매너온도 - 1" onclick="location.href='mannertp.do?id_receive=${member.id}&tp_cal=minus'"/>
               <input type="button" value="매너온도 삭제" onclick="location.href='mannertp.do?id_receive=${member.id}&tp_cal=del'"/>
            </td>
      	</tr>
      <!-- 	<tr>
      		<th colspan="3"> -->
      		 <%--   <input type="button" name="bmarkdo" value="즐겨찾기" onclick="location.href='bmark.do?myid=${sessionScope.loginId}&memid=${member.id}'"> --%>
         <tr>
            <th colspan="3">
             <input type="button" name="bmarkdo" value="즐겨찾기" onclick="location.href='bmark.do?myid=${sessionScope.loginId}&memid=${member.id}'">
           <%--     <button id="bmark" onclick="location.href=bmark.do?myid=${sessionScope.loginId}&memid=${mimber.id}">즐겨찾기</button>   --%>
               <input type="button" value="쪽지 보내기" onclick="location.href='msgChat.go?id_receive=${member.id}'"/>
               <input type="button" value="프로필 신고" onclick="location.href='report.go?id=${member.id}'"/>
<!--                <input type="button" value="뒤로가기" onclick="redirect:/profile.go"/> -->
            </th>
         </tr>
     		 </table>
        
     
      <br/>
      <div id = "admin">
	      <table>
	      	<tr>
	      		<th>관리자여부</th>
	      		<td>${member.admin}</td>
	      		<td><input type="button" value="관리자 설정" onclick="location.href='adminupdate.do?id=${member.id}'"/></td>
	      	</tr>
	         <tr>
	            <th>정지 상태</th>
	            <td>${member.ban}</td>
<%-- 	            <td><input type="button" value="관리자 해지" onclick="location.href='aupdate.do?id=${member.id}'"/></td> --%>
	         </tr>
	         <tr>
	            <th>경고 당한 횟수</th>
	            <td>${member.warning}</td>
	            <td><input type="button" value="회원 정지" onclick="location.href='banupdate.do?id=${member.id}'"/></td>   
	         </tr>
	         <tr>
	            <th>랜덤매칭 동의 여부</th>
	            <td>${member.random}</td>
<%-- 	            <td><input type="button" value="정지 해제" onclick="location.href='bupdate.do?id=${member.id}'"/></td> --%>
	      </table>
</div>
 <!-- </form> -->
</body>

<script>


	$('input[name="bmarkdo"]').click(function(){
		console.log("즐겨찾기 추가하고 싶은 건 맞아?");
		alert('즐겨찾기에 추가되었습니다.');
	})
	
	var adminChk = "${sessionScope.adminChk}";

var msg = "${msg}";
if(msg != ""){
	alert(msg);
}

/*    var adminChk = "${sessionScope.adminChk}";

	$('input[name="bmarkdo"]').click(function(){
		console.log("즐겨찾기 추가하고 싶은 건 맞아?");
		alert('즐겨찾기에 추가되었습니다.');
	})
	
	var adminChk = "${sessionScope.adminChk}";
   
   if (adminChk == '1') {
	   $('#admin').css('display', 'block');
    } */

   
   
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
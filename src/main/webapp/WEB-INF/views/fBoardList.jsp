<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 리스트</title>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<style>
	/* table, th, td{
		border : 1px solid black;
		border-collapse: collapse;
		padding : 5px 10px;
		width : 800px;
		margin : 5px;
	}
	table[class="second"]{
		border : 1px solid black;
		border-collapse: collapse;
		padding : 5px 10px;
		width : 1000px;
	} */
	body {
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
		width: 800px;
		margin: 5px;
	}
	
	table.first, table.second {
		margin: 20px auto;
		border-collapse: collapse;
	}
	
	table.second {
		width: 1000px;
	}
	
	table.second th {
		background-color: #f0f0f0;
		color: #222;
	}
	
	table.second tbody tr:nth-child(odd) {
		background-color: #f9f9f9;
	}
	
	table.second tbody tr:hover {
		background-color: #e9e9e9;
		cursor: pointer;
	}
	
	table.second a {
		color: #222;
		text-decoration: none;
	}
	.fbutton{
		 background-color: #22c55e;
	}
	table.second input[type="submit"], table.first button, table.first input[type="submit"] {
		padding: 10px 20px;
		background-color: #333;
		color: #fff;
		border: none;
		border-radius: 5px;
		cursor: pointer;
	}
	table.first{
		border-collapse: collapse;
	}
	table.first button {
		margin-left: 10px;
	}
	table.first input[type="radio"], table.first input[type="checkbox"] {
		margin-right: 10px;
	}
	input[name="search"]{
		margin-left: 400px;
	}
</style>
</head>
<body>
<jsp:include page="gnb.jsp"/>
	<div class="fsort">
      <form action="fsorting.do" method="get">
	<table class="first">
			<tr>
	         <td colspan="2">
	            <select name="big_hb" style="margin-left: 560px;">
	               <c:forEach items="${big_hb}" var="b">
	                  <option value="${b.big_hb}">${b.big_hb}</option>      
	               </c:forEach>
	            </select>
	            <select name="small_hb">
	           		 <option>x</option>
	            </select>
	            <button class="fbutton">검색</button>
	           </td>
      		</tr>
	</table>
		
	 </form>
   </div>
	<table class="second">
		<colgroup>
			<col width="10%"/>
			<col width="40%"/>
			<col width="15%"/>
			<col width="25%"/>
			<col width="10%"/>
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>		
		<tbody>
			<c:if test="${list eq null}">
				<tr>
					<th colspan="6">등록된 글이 없습니다.</th>
				</tr>
			</c:if>
			<c:if test="${list.size() == 0}">
               <tr><th colspan="5">조건에 해당하는 게시물이 없습니다.</th></tr>
            </c:if>
			<c:forEach items="${list}" var="bbs">
				<c:if test="${not empty sessionScope.loginId}">
					<tr>
						<td style="text-align: center;">${bbs.fbNo}</td>
						<td style="text-align: center;"><a href="fdetail.do?fbNo=${bbs.fbNo}" id="login">${bbs.title}</a></td>
						<td style="text-align: center;">${bbs.id}</td>
						<td style="text-align: center;">${bbs.fbTime}</td>
						<td style="text-align: center;">${bbs.bhit}</td>
					</tr>
				</c:if> 
				<c:if test="${empty sessionScope.loginId}">
					<tr>
						<td>${bbs.fbNo}</td>
						<td><a href="javascript:showAlert();">${bbs.title}</a></td>
						<td>${bbs.id}</td>
						<td>${bbs.fbTime}</td>
						<td>${bbs.bhit}</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
	<table>
		<tr>
            <td class="fsearch">      
                <form action="fsearch.do">
                   <input type="text" name="search" value=""/>
                      <select name="fsearch">
                         <option value="title">제목</option>
                         <option value="id">작성자</option>
                         <option value="bContent">내용</option>
                      </select>
                   <input type="submit" value="검색"/>
                     </form>
                  </td>
               </tr>
	</table>
	<c:if test="${not empty sessionScope.loginId}">
	<button onclick="location.href='fwrite.go'">글쓰기</button>
	</c:if>
</body>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
	function showAlert() {
		alert("로그인이 필요한 페이지입니다.");
		location.href='./login.go';
	}
/* 
	//선택이 안 됐다고 value가 null은 아닌가봐
	var count = 0;
	$('.fbutton').click(function(){
		if(count == 0){
			alert('대분류는 필수 선택 항목입니다.');
		}
	}) */
	
	var loginId = "${sessionScope.loginId}";   
   myHobbyList();
   function myHobbyList(){
      console.log("loginId : " + loginId);
      $.ajax({
         type:'get',
         url:'myHobbyList.ajax',
         data:{id:loginId},
         dataType:'json',
         success:function(data){
            console.log("data, myHobbyList : " + data.myHobbyList);
            console.log("data, login : " + data.login);
            if(!true){
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
         content += '<tr>';
         content += '<td><input type="checkbox" value="'+item.my_hobby_no+'"/></td>';
         content+='<td>'+item.big_hb + " / " + item.small_hb+'</td>';
         content += '</tr>';
         console.log(item.my_hobby_no);
      });
      
      $('#myHobbyList').empty();
      $('#myHobbyList').append(content);
   }

   $('select[name="big_hb"]').on('change', function(e){
       var big_hb = $('select[name="big_hb"]').val();      
       console.log("big_hb ? " + big_hb);      
       $.ajax({
          type: 'get'
          ,url: 'big_hb.ajax'
          ,data:{'big_hb':big_hb}
          ,dataType:'json'
          ,success:function(data){
             console.log("big_hb data : " + data.small_hb);
             if(data != ""){
                console.log("big_hb 취미 호출");
                small_hbDraw(data.small_hb);
             } else {
                alert('오류가 발생하였습니다.');
             }
          }
          ,error:function(e){
             console.log(e);
          }
       });
   })

   function small_hbDraw(small_hb){
    console.log("small_hb : " + small_hb);
    var content = '';
    small_hb.forEach(function(item,index){
       content +='<option value="'+item.small_hb+'">'+item.small_hb+'</option>';
    });
    $('select[name="small_hb"]').empty();
    $('select[name="small_hb"]').append(content);
   }
	/* $('input[name="bhobby"]').click(function(){
		count = 1;
	var content='';
	var val = $(this).val();
	console.log(val);
	
	 if(val == '운동'){
		 content += '<input type="checkbox" name="mhobby" value="헬스">헬스';
		 content += '<input type="checkbox" name="mhobby" value="축구">축구'; 
         content += '<input type="checkbox" name="mhobby" value="야구">야구';
         content += '<input type="checkbox" name="mhobby" value="풋살">풋살';
         content += '<input type="checkbox" name="mhobby" value="탁구">탁구';
         content += '<input type="checkbox" name="mhobby" value="골프">골프';
         content += '<input type="checkbox" name="mhobby" value="테니스">테니스';
      }
      
      else if(val == '맛집'){
         content += '<input type="checkbox" name="mhobby" value="식사">식사';
         content += '<input type="checkbox" name="mhobby" value="술">술';
         content += '<input type="checkbox" name="mhobby" value="카페">카페';
      }
      
      else if(val == '반려동물'){
         content += '<input type="checkbox" name="mhobby" value="산책">산책';
         content += '<input type="checkbox" name="mhobby" value="쇼핑">쇼핑';
         content += '<input type="checkbox" name="mhobby" value="미용">미용';
      }
      
      else{
         content += '<input type="checkbox" name="mhobby" value="영화">영화';
         content += '<input type="checkbox" name="mhobby" value="게임">게임';
         content += '<input type="checkbox" name="mhobby" value="노래방">노래방';
         content += '<input type="checkbox" name="mhobby" value="보드게임">보드게임';
         content += '<input type="checkbox" name="mhobby" value="방탈출">방탈출';
      }

	$('.mhobby').html(content);
	}); */
</script>
</html>
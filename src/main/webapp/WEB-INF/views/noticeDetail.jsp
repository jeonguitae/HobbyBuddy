<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
	table, th, td{
      border: 1px solid black;
      border-collapse: collapse;
      padding: 5px 10px;
   }
   button{
      margin: 5px;
   }
   table {
      width: 500px;
   }
   input[type="text"]{
      width: 40%;   
   }
   #search{
      display: inline-block;
   }
   colgroup {
      width: 30%;
   }
   #chkBtn{
   	 float: left;
   }
   #delete_btn{
   	float: right;
   }
   #update_btn{
   	float: right;
   }
   #listBack{
   	background: aqua;
   }
</style>
</head>
<body>
	<jsp:include page="gnb.jsp"/>
   <h1 align="center">공지사항 상세</h1>
   
      <table>
         
         <tr>
            <th>방번호</th>
            <td>${dto.notice_idx}</td>
         </tr>
         <tr>
            <th>조회수</th>
            <td>${dto.notice_bHit}</td>
         </tr>
         <tr>
            <th>작성자</th>
            <td>${dto.id}</td>
         </tr>
         <tr>
			  <th>작성일시</th>
			  <td><fmt:formatDate value="${dto.notice_date}" pattern="yyyy/MM/dd" /></td>  
		  </tr>
		 <tr>
            <th>제목</th>
            <td >${dto.notice_title}</td>
         </tr>
         <tr> 
            <th>내용</th>
            <td>${dto.notice_content}</td>
         </tr>
         
         <c:if test="${dto.new_photo_name ne null }">
         	<th>사진</th>
            <td>
		      <img src="/photo/${dto.new_photo_name}" width="500">
		    </td>
         </c:if>            
         <tr>
            <th colspan="2">
            	<button id="chkBtn">${dto.notice_chk ? '비공개 설정' : '공개 설정'}</button>          	
               <input type="button" onclick="location.href='noticeList.go'" value="리스트로 돌아가기" id="listBack">
               <input type="button" onclick="if(confirm('정말로 삭제하시겠습니까?')){location.href='./noticeDelete.go?notice_idx=${dto.notice_idx}';}" value="삭제" id="delete_btn">
               <input type="button" onclick="location.href='./noticeUpdate.go?notice_idx=${dto.notice_idx}'" value="수정" id="update_btn">              
              
            </th>
         </tr>
      </table>      
</body>
<script>

var msg = "${msg}";
if (msg !== "") {
    alert(msg);
}


var adminChk = '${sessionScope.adminChk}';

if (adminChk === true || adminChk === '1' || adminChk === "true") {
 
} else {
	document.querySelector('#update_btn').style.display = 'none';
	document.querySelector('#chkBtn').style.display = 'none';
	document.querySelector('#delete_btn').style.display = 'none';
}


$(document).ready(function() {
	  var btnText = $("#chkBtn").text();
	  $("#chkBtn").on("click", function() {
	    var notice_idx = '${dto.notice_idx}';
	    var notice_title = '${dto.notice_title}';
	    var notice_content = '${dto.notice_content}';
	    var notice_chk2 = '${dto.notice_chk}';
	    var flag = $("#chkBtn").text() == '공개 설정' ? 'true' : 'false';

	    if (confirm('해당 글을 ' + (flag == 'true' ? '공개' : '비공개') + '하시겠습니까?')) {
	      $.ajax({
	        type: 'POST',
	        url: 'update_chk.ajax',
	        data: {
	        	'notice_idx': notice_idx,
	        	'notice_title': notice_title,
	        	'notice_content': notice_content,
	        	'notice_chk' : notice_chk2,
	        	'flag': flag 
	        },
	        success: function(response) {
	          console.log(response);
	          var newBtnText = flag == 'true' ? '비공개 설정' : '공개 설정';
	          $("#chkBtn").text(newBtnText);
	        },
	        error: function(error) {
	          console.error(error);
	        }
	      });
	    } else {

	    }
	  });
	});

/* // 페이지 로드될 때 버튼 텍스트 초기화
  if ($("#chkBtn").text() == 'false') {
    $("#chkBtn").text('공개 설정');
  } else {
    $("#chkBtn").text('비공개 설정');
  }
  if ($("#chkText").text() == 'false') {
	    $("#chkText").text('비공개 설정');
	  } else {
	    $("#chkText").text('공개 설정');
  } */
  
  

</script>
</html>
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
   #rightt{
   	float: right;
   }
   #listBack{
   	background: aqua;
   }
</style>
</head>
<body>
   <h3 align="center">문의 내역 상세</h3>
   
      <table>
         
         <tr>
            <th>작성일</th>
            <td>${dto.notice_idx}</td>
         </tr>
         <tr>
            <th>작성종류</th>
            <td>${dto.notice_bHit}</td>
         </tr>
         <tr>
            <th>작성자</th>
            <td>${dto.id}</td>
         </tr>
         <tr>
			  <th>문의제목</th>
			  <td><fmt:formatDate value="${dto.notice_date}" pattern="yyyy/MM/dd" /></td>  
		 </tr>
		 <tr>
            <th>문의내용</th>
            <td >${dto.notice_title}</td>
         </tr>
         <tr>
            <th>공개여부</th>
            <td>${dto.notice_content}</td>
         </tr>
         
         <c:if test="${dto.newFileName ne null }">
            <tr>
               <th>사진</th>
               <td> <img src="/photo/${dto.newFileName}" width="100"/></td>         
            </tr>
         </c:if>            
         <tr>
            <th colspan="2">
            	<button id="chkBtn">${dto.notice_chk ? '비공개 설정' : '공개 설정'}</button>          	
               <input type="button" onclick="location.href='noticeList.go'" value="리스트로 돌아가기" id="listBack">
               <input type="button" onclick="if(confirm('정말로 삭제하시겠습니까?')){location.href='./noticeDelete.go?notice_idx=${dto.notice_idx}';}" value="삭제" id="rightt">
               <input type="button" onclick="location.href='./noticeUpdate.go?notice_idx=${dto.notice_idx}'" value="수정" id="rightt">              
               
            </th>
         </tr>
      </table>      
</body>
<script>
$(document).ready(function() {
  var btnText = $("#chkBtn").text();
  $("#chkBtn").on("click", function() {
    var notice_idx = ${dto.notice_idx};
    var flag = $("#chkBtn").text() == '공개 설정' ? 'true' : 'false';

    if (confirm('해당 글을 ' + (flag == 'true' ? '공개' : '비공개') + '하시겠습니까?')) {
      $.ajax({
        type: 'POST',
        url: 'update_chk.ajax',
        data: { notice_idx: notice_idx, flag: flag },
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
      $("#chkBtn").text(btnText);
    }
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
  
});
</script>
</html>
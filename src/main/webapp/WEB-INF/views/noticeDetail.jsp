<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
   #chk{
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
   <h3 align="center">공지사항 상세</h3>
   
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
            <td>${dto.notice_date}</td>
         </tr>
         <tr>
            <th>제목</th>
            <td>${dto.notice_title}</td>
         </tr>
         <tr>
            <th>내용</th>
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
               <input type="button" value="${dto.notice_chk }" id="chk"> 
               <input type="button" onclick="location.href='noticeList.go'" value="리스트로 돌아가기" id="listBack">
               <input type="button" onclick="location.href='./noticeUpdate.go?notice_idx=${dto.notice_idx}'" value="수정" id="rightt">               
               <input type="button" onclick="if(confirm('정말로 삭제하시겠습니까?')){location.href='./noticeDelete.go?notice_idx=${dto.notice_idx}';}" value="삭제" id="rightt">
            </th>
         </tr>
         
               
      </table>
</body>
<script>

if ($("#chk").val() == 'false') {
	$("#chk").val('비공개');
}else{
	$("#chk").val('공개');
}


$("#chk").on("click", function() {
  var notice_idx = ${dto.notice_idx};
  var flag = '${dto.notice_chk}' === 'false' ? 'notice_ChkOn' : 'notice_ChkOff';
  
  if(flag === 'notice_ChkOn') {
    if(confirm('해당 글을 공개하시겠습니까?')) {
      $.ajax({
        type: 'POST',
        url: 'update_chk.ajax',
        data: { notice_idx: notice_idx, flag: flag },
        success: function(response) {
          console.log(response);
          var newChk = flag === 'notice_ChkOn' ? '공개' : '비공개';
          $("#chk").val(newChk);
        },
        error: function(error) {
          console.error(error);
        }
      });
    } else {
      $("#chk").val('비공개');
    }
  } else {
    if(confirm('해당 글을 비공개하시겠습니까?')) {
      $.ajax({
        type: 'POST',
        url: 'update_chk.ajax',
        data: { notice_idx: notice_idx, flag: flag },
        success: function(response) {
          console.log(response);
          var newChk = flag === 'notice_ChkOn' ? '공개' : '비공개';
          $("#chk").val(newChk);
        },
        error: function(error) {
          console.error(error);
        }
      });
    } else {
      $("#chk").val('공개');
    }
  }
});



</script>
</html>
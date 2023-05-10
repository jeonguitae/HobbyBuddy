<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
	<jsp:include page="gnb.jsp"/>
   <h3 align="center">신고 상세</h3>
   
      <table>
         
         <tr>
            <th>신고 번호</th>
            <td><a href="fBoardDetail.go?reptboard_num='+item.notice_idx+'"></a>${dto.rept_no}</td>
         </tr>
         <tr>
            <th>피신고자 아이디</th>
            <td>${dto.preporter}</td>
         </tr>
         <tr>
            <th>신고 게시판 종류</th>
            <td>${dto.reptboard_class}</td>
         </tr>
         <tr>
		  	<th>신고 제목</th>
		  	<td>${dto.rept_title}</td>  
		  </tr>
		 <tr>
            <th>신고 내용</th>
            <td >${dto.rept_content}</td>
         </tr>
         <tr>
            <th>신고 일시</th>
            <td><fmt:formatDate value="${dto.rept_date}" pattern="yyyy/MM/dd" /></td>
         </tr>
         <tr>
            <th>처리 상태</th>
            <td>${dto.rept_state}</td>
         </tr>
         <tr>
            <th>처리 사유</th>
            <td>${dto.proc_content}</td>
         </tr>
          
      </table> 
      <hr>	    
	  <form action="report_CommentWrite.do" method="post">
         <input type="hidden" name="rept_no" value="${dto.rept_no}">
         <table>
               <tr>
                  <th>관리자 아이디</th>
                  <td><input type="text" name="admin_id" value="${sessionScope.loginId}" readonly></td>
               </tr>
               <tr>
                  <th>처리사유</th>
                  <td><textarea name="proc_content"></textarea></td>
               </tr>
               <tr>
                  <th>처리상태</th>
                  <td>
                     <select name="rept_state">
                          <option value="처리중">처리중</option>
                          <option value="처리완료">처리완료</option>
                          <option value="반려">반려</option>
                     </select>
                    </td>
               </tr>               
         </table>            
         <button id="confirmButton">신고 처리 하기</button>
         <input type="button" onclick="location.href='reportList.go'" value="취소">
      </form>  
</body>
<script>
    var form = document.querySelector('form');
    form.addEventListener('submit', function(event) {
        var proc_content = form.elements['proc_content'].value;
        if (proc_content === '') {
            alert('처리사유를 입력하세요.');
            event.preventDefault();
        }
    });
    
    $(document).ready(function() {
    	  $('#confirmButton').on('click', function() {
    	    if (confirm('신고를 처리하시겠습니까?')) {
    	      // 정상적으로 접수된 경우 처리하는 코드
    	      alert('신고가 정상적으로 접수되었습니다.');
    	    }
    	  });
    	});


</script>
</html>
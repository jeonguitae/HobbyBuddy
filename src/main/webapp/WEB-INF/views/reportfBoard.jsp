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
   textarea.content{
   	  width : 800px;
   	  height : 300px;
   }
   input.title{
   	  width : 800px; 
   }
   button{
      margin: 5px;
   }
   table {
      width: 400px;
   }
   table.
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
   <h3 align="center">자유게시판 신고</h3>
   <form action="freport.do">
      <table>
         <tr>
            <th><input type="hidden" name="reptboard_num" value="${fbNo}">
            	<input type="hidden" name="reporter" value="${myid}">
            	<input type="hidden" name="preporter" value="${memid}">피신고자 아이디</th>
            <td>${memid}</td>
         </tr>
         <tr>
            <th>게시판종류</th>
            <td>자유게시판<input type="hidden" name="reptboard_class" value="자유"></td>
         </tr>
         <tr>
		  	<th>신고 제목</th>
		  	<td><input class="title" type="text" name="rept_title"/></td>  
		  </tr>
		 <tr>
            <th>신고 내용</th>
            <td ><textarea class="content" name="rept_content"></textarea></td>
         </tr>
         <%-- <tr>
            <th>신고 일시</th>
            <td><fmt:formatDate value="${dto.rept_date}" pattern="yyyy/MM/dd" /></td>
         </tr> --%>
      </table> 
         <button id="freportdo">신고하기</button>
               </form>
         <input type="button" onclick="location.href='report_fboardList.go'" value="취소">                  
</body>
<script>
    var msg = ${msg}
    if (msg != null) {
		alert(msg);
	}
    
$(document).ready(function() {
	  $('#confirmButton').on('click', function() {
		    if (confirm('신고를 처리하시겠습니까?')) {
		      var form = document.querySelector('form');
		      var proc_content = form.elements['proc_content'].value;
		      var admin_id = form.elements['admin_id'].value;
		      var rept_state = form.elements['rept_state'].value;
		      if (admin_id === '') {
		    	  alert('세션이 종료되었습니다. 다시 로그인 해주세요.');
			      return;
			  }else if (proc_content === '') {
			      alert('처리사유를 입력하세요.');
			      return;
			  }else if (rept_state === '선택') {
				  alert('처리상태를 선택하세요.');
			      return;
		      }else{				  
				  form.submit();
			      alert('처리가 완료 되었습니다.');  
			  }	      
		    }else{
		    	
		    }
	  });
});



</script>
</html>
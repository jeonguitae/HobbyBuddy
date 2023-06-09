<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>\
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<style>
	table, th, td{
      border: 1px solid black;
      border-collapse: collapse;
      padding: 5px 10px;
      
   }
   table{
   		width: 50%;
   }
   button{
      margin: 5px;
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
   #after_qboard{
   	display: none;
   }
</style>
</head>
<body>
	<jsp:include page="gnb.jsp"/>
      <h1 align="center">문의 내역</h1>
   		<form class="secretSet" method="post" action="qboardSecretSet.do?qboard_no=${dto.qboard_no}">
			<input type="hidden" name="writer_id" value="${dto.id}">
			<input type="hidden" name="sboard_title" value="${dto.qboard_title}">
			<input type="hidden" name="sboard_num" value="${dto.qboard_no}">
			<input type="hidden" name="admin_id" value="${sessionScope.loginId}">			
			<button id="secretSet_btn" style="float: right;" >비밀글 설정</button>			
		</form>   		
      <table>
         
         <tr>
            <th>문의 종류</th>
            <td>${dto.qboard_class}</td>
            <c:if test="${not empty dto.new_photo_name}">
		    <td rowspan="7">
		    	<img src="/photo/${dto.new_photo_name}" width="400"/>
		    </td>
		    
		</c:if>
         </tr>
         <tr>
            <th>작성자</th>
            <td>${dto.id}</td>
         </tr>
         <tr>
			  <th>작성 날짜</th>
			  <td><fmt:formatDate value="${dto.qboard_time}" pattern="yyyy/MM/dd" /></td>  
		 </tr>
		 <tr>
            <th>문의 제목</th>
            <td>${dto.qboard_title}</td>
         </tr>
		 <tr>
            <th>문의 내용</th>
            <td >${dto.qboard_content}</td>
         </tr>
         <tr>
            <th>공개 여부</th>
            <td>${dto.qboard_openchk ? '공개' : '비공개'}</td>
         </tr>
         
         
		<tr>
			<td colspan="2">				
				<input type="button" onclick="location.href='qboardList.go'" value="리스트로 돌아가기" id="listBack">
				<input type="button" onclick="location.href='./qboardUpdate.go?qboard_no=${dto.qboard_no}'" value="수정" id="updateBtn">	
               <input type="button" onclick="if(confirm('정말로 삭제하시겠습니까?')){location.href='./qboardDelete.go?qboard_no=${dto.qboard_no}';}" value="삭제" id="deleteBtn">
			</td>    
		</tr>
      </table> 
       <form action="qBoard_replyWrite.do" method="post">
		  <input type="hidden" name="qboard_no" value="${dto.qboard_no}">
		  <input type="hidden" name="qboard_state" value="${dto.qboard_state}">
		  <input type="hidden" name="admin_id" value="${sessionScope.loginId}">
		  
		  <table>
		    <tr>	
		      <th>문의 답변</th>
		      <td>
		        <textarea disabled="disabled" name="content" id="contentInput" style="width: 800px; height: 400px; resize: none;">${dto.qboard_reply}.</textarea>
		      </td>
		    </tr>
		    <tr id="reply_time2">
		      <th>답변 일시</th>
		      <td>
		        <input type="text" name="reply_time" value="${dto.reply_time}" class="reply-time" style="width: 400px;">
		      </td>
		    </tr>
		  </table>
		  
		  <table>		  	
		    <tr id="admin_reply2">
		      <th>문의 답변</th>
		      <td id="after">
		        <textarea name="qboard_reply" id="contentInput" style="width: 800px; height: 400px; resize: none;">${dto.qboard_reply}.</textarea>
		      </td>
		    </tr>
		    
		    <tr id="admin_reply" style="display:none">
		      <th colspan="2">
		        <button id="reply_btn">답변 등록</button>
		      </th>
		    </tr>
		  </table>
		</form>   
</body>
<script>

const replyBtn = document.getElementById('reply_btn');
const myForm = document.querySelector('form[action="qBoard_replyWrite.do"]');

replyBtn.addEventListener('click', function(event) {
  event.preventDefault(); // 기본 동작인 form submit을 막음

  const result = confirm("답변을 등록하시겠습니까?");

  if (result) {
    console.log("답변이 등록되었습니다.");
    myForm.submit(); // 폼을 제출함
  } else {
    console.log("답변 등록이 취소되었습니다.");
    return; // 취소 버튼을 눌렀을 때 함수를 종료하여 아무 동작도 수행하지 않음
  }
});

const secretSetBtn = document.getElementById('secretSet_btn');

secretSetBtn.addEventListener('click', function(event) {
  event.preventDefault(); // 기본 동작인 form submit을 막음

  const result = confirm("비밀글 설정하시겠습니까?");

  if (result) {
   
    console.log("비밀글이 설정되었습니다.");

   
    const form = this.closest('form');
    form.submit();
  } else {
  
    console.log("비밀글 설정이 취소되었습니다.");
  }
});
	var sessionID = '${sessionScope.loginId}';
	var authorID = '${dto.id}';
	var adminChk = '${sessionScope.adminChk}';
	
	if (adminChk === true || adminChk === '1' || adminChk === "true") {
	  document.querySelector('#after textarea').disabled = false;
	  document.querySelector('#admin_reply').style.display = 'table-row';
	  
	} else {
	  document.querySelector('#admin_reply').style.display = 'none';
	  document.querySelector('#admin_reply2').style.display = 'none';
	  document.querySelector('#reply_time2').style.display = 'none';
	}

	// 수정 버튼 보이기/숨기기
	var updateBtn = document.querySelector('#updateBtn');
	if (sessionID === authorID || adminChk === "true") {
	  updateBtn.style.display = 'inline-block';
	} else {
	  updateBtn.style.display = 'none';
	}
	
	var secretSet_btn = document.querySelector('#secretSet_btn');
	if (secretSet_btn.value === 'true') {
	  secretSet_btn.innerText = '비밀글 해제';
	} else if (secretSet_btn.value === 'false') {
	  secretSet_btn.innerText = '비밀글 설정';
	}
	
	if (adminChk === true || adminChk === '1' || adminChk === "true") {
		secretSet_btn.style.display = 'inline-block';
		} else {
			secretSet_btn.style.display = 'none';
		}

	// 삭제 버튼 보이기/숨기기
	var deleteBtn = document.querySelector('#deleteBtn');
	if (sessionID === authorID || adminChk === "true") {
	  deleteBtn.style.display = 'inline-block';
	} else {
	  deleteBtn.style.display = 'none';
	}
	
	$(document).ready(function() {
		  // reply-time 클래스를 가진 input 요소를 선택합니다.
		  var replyTime = $(".reply-time");
	
		  // 해당 값이 "1999-09-09 00:00:00.000"인 경우에는 해당 요소를 숨깁니다.
		  if (replyTime.val() === "Thu Sep 09 00:00:00 KST 1999") {
			  replyTime.closest("tr").hide();
			} else {
			  var date = moment(replyTime.val(), "ddd MMM DD HH:mm:ss z YYYY").format("YY/MM/DD HH:MM:SS");
			  if (date !== "Invalid date") {
			    replyTime.val(date);
			  }
			}
	
		});
	
	$(document).ready(function() {
		  // reply-time 클래스를 가진 input 요소를 선택합니다.
		  var replyTime = $(".reply-time");
	
		  // 해당 값이 "1999-09-09 00:00:00.000"인 경우에는 해당 요소를 숨깁니다.
		  if (replyTime.val() === "Thu Sep 09 00:00:00 KST 1999") {
			  replyTime.closest("tr").hide();
			} else {
			  var date = moment(replyTime.val(), "ddd MMM DD HH:mm:ss z YYYY").format("YY/MM/DD HH:MM:SS");
			  if (date !== "Invalid date") {
			    replyTime.val(date);
			  }
			}
	
		});
	
	
	

</script>
</html>
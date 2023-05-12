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
   #after_qboard{
   	display: none;
   }
</style>
</head>
<body>
   <h3 align="center">문의 내역 상세</h3>
   	<form action="qboardUpdate.do" method="post" enctype="multipart/form-data">
      <input type="hidden" name="qboard_no" value="${dto.qboard_no}"/>
      <table>
         <tr>
            <th>문의 유형</th>
            <td>            	        		
           		<select name="qboard_class" id="qboard_class">				    
				    <option value="계정 문의" ${dto.board_class == '계정 문의' ? 'selected' : ''}>계정문의</option>
				    <option value="게시판 문의" ${dto.qboard_class == '게시판 문의' ? 'selected' : ''}>게시판문의</option>
				    <option value="채팅 문의" ${dto.qboard_class == '채팅 문의' ? 'selected' : ''}>채팅문의</option>
				    <option value="기타 문의" ${dto.qboard_class == '기타 문의' ? 'selected' : ''}>기타문의</option>
				</select>            	
            </td>
         </tr>
         <tr>
            <th>작성자</th>
            <td>${dto.id}</td>
         </tr>         
		 <tr>
            <th>문의 제목</th>
            <td><input type="text" name="qboard_title" value="${dto.qboard_title}"></td>
         </tr>
		 <tr>
            <th>문의 내용</th>
            <td><textarea name="qboard_content">${dto.qboard_content}</textarea></td>
         </tr>
         <tr>
            <th>공개 여부</th>
            <td>
			  <input type="radio" name="qboard_openchk" value="1" ${dto.qboard_openchk == 'true' ? 'checked' : ''}>공개&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <input type="radio" name="qboard_openchk" value="0" ${dto.qboard_openchk == 'false' ? 'checked' : ''}>비공개
			</td>

         </tr>    
         
		    <tr>
		        <th>사진</th>
		        <th>
					<c:if test="${dto.new_photo_name eq null}">
	                  <input type="file" name="photo" multiple="multiple">
	               </c:if>
	               <c:if test="${dto.new_photo_name ne null}">
					  <img src="/photo/${dto.new_photo_name}" width="100"/>
					  ${dto.new_photo_name}
					  <input type="hidden" name="photoIdx" value="${dto.photoIdx}">
					  <a href="QdeletePhoto.do?photoIdx=${dto.photoIdx}&qboard_no=${dto.qboard_no}">사진 삭제</a>				  		  
					</c:if>		        
		        </th>		           
		    </tr>		
			<tr>            
	            <th colspan="2">               
	               <!-- 이러면 submit 효과가 사라짐 -->
	               <!-- <button type="button"></button> -->
	               <button>수정</button>
	               <input type="button" onclick="location.href='qboardList.go'" value="취소">
	            </th>
	         </tr> 
      </table>   
      </form>	
      <table id="answer">	      
		    <tr>
		      <th>문의 답변</th>
		      <td id="after"><input type="text" value="작성된 답변이 없습니다." readonly="readonly"></td>         
		    </tr>
		    <tr>
		      <th>답변 일시</th>
		      <td><%-- ${dto.answer_date} --%></td>         
		    </tr>		  
	</table>   		 
</body>
<script>
	var adminChk = "${sessionscope.adminChk}";
	if (adminChk == '1' || adminChk == 'true') {
	    $('#after input').removeAttr('readonly').val('작성된 답변이.');
	}
	window.onload = function() {
	    var table = document.getElementById("answer");
	    table.style.display = "none";
	  }
	
</script>
</html>
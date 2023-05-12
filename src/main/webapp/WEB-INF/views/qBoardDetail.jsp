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
   
      <table>
         
         <tr>
            <th>문의 종류</th>
            <td>${dto.qboard_class}</td>
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
         
         <c:if test="${not empty dto.new_photo_name}">
		    <tr>
		        <th>사진</th>
		        <td><img src="/photo/${dto.new_photo_name}" width="100"/></td>
		    </tr>
		</c:if>
		<tr>
			<td colspan="2">				
				<input type="button" onclick="location.href='qboardList.go'" value="리스트로 돌아가기" id="listBack">
				<input type="button" onclick="location.href='./qboardUpdate.go?qboard_no=${dto.qboard_no}'" value="수정">	
               <input type="button" onclick="if(confirm('정말로 삭제하시겠습니까?')){location.href='./qboardDelete.go?qboard_no=${dto.qboard_no}';}" value="삭제">               	
			</td>    
		</tr>
      </table>   
      <table>	      
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
		    $('#after').removeAttr('readonly').val('작성된 답변이.');
		}



</script>
</html>
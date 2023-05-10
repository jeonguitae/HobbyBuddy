<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="resources/css/commons.css">
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
</style>
</head>
<body>
   <h3 align="center">문의 등록</h3>
   <form action="qBoardWrite.do" method="post" enctype="multipart/form-data">
      <table>      
      
         <tr>
            <th>작성자 아이디</th>
            <td><input type="text" name="id" value="${sessionScope.loginId}" readonly></td>
         </tr>               
         <tr>
            <th>문의 유형</th>
            <td>
            	<select name="qboard_class">
            		<option value="question_default">선택</option>
            		<option value="question_id">계정문의</option>
            		<option value="question_board">게시판문의</option>
            		<option value="question_chat">채팅문의</option>
            		<option value="question_other">기타문의</option>
            	</select>
            </td>
         </tr>
         <tr>
            <th>문의 제목</th>
            <td><input type="text" name="qBoard_title"></td>
         </tr>
         <tr>
            <th>문의 내용</th>
            <td><textarea name="qboard_content"></textarea></td>
         </tr>
         <tr>
            <th>사진</th>
            <td>
               <input type="file" name="photo" multiple="multiple">               
            </td>
         </tr>   
         <tr>
         	<th>
	         	공개여부
         	</th>
         	<th>
         		<input type="radio" name="open_Chk">공개&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	         	<input type="radio" name="open_Chk">비공개
         	</th>         	
         </tr>      
         <tr>            
            <th colspan="2">               
               <!-- 이러면 submit 효과가 사라짐 -->
               <!-- <button type="button"></button> -->
               <button>등록</button>
               <input type="button" onclick="location.href='qboard.go'" value="취소">
            </th>
         </tr>
      </table>
   </form>
</body>
<script>
var msg = "${msg}";
if (msg != "") {
	alert(msg);
}
</script>
</html>
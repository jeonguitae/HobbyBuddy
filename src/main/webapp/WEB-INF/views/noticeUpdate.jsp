<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
</style>
</head>
<body>
   <h3 align="center">공지사항 수정</h3>
   <form action="noticeUpdate.do" method="post" enctype="multipart/form-data">
      <input type="hidden" name="notice_idx" value="${dto.notice_idx}"/>
      <table>      
         
         <tr>
            <th>작성자 아이디</th>
            <td>${dto.id}</td>
         </tr>               
         <tr>
            <th>공지사항 제목</th>
            <td><input type="text" name="notice_title" value="${dto.notice_title}"></td>
         </tr>
         <tr>
            <th>공지사항 내용</th>
            <td><textarea name="notice_content">${dto.notice_content}</textarea></td>
         </tr>
         <tr>
            <th>사진</th>
            <td>
               
               <c:if test="${dto.newFileName eq null}">
                  <input type="file" name="photo" multiple="multiple">
               </c:if>
               <c:if test="${dto.newFileName ne null}">
				  <img src="/photo/${dto.newFileName}" width="100"/>
				  ${dto.newFileName}
				  <input type="hidden" name="photo_idx" value="${dto.photo_idx}">
				  <a href="deletePhoto.do?photo_idx=${dto.photo_idx}&notice_idx=${dto.notice_idx}">사진 삭제</a>				  		  
				</c:if>      
            </td>
         </tr>         
         <tr>            
            <th colspan="2">               
               <!-- 이러면 submit 효과가 사라짐 -->
               <!-- <button type="button"></button> -->
               <button>수정</button>
               <input type="button" onclick="location.href='noticeList.go'" value="취소">
            </th>
         </tr> 
      </table>
   </form>
</body>
<script>

</script>
</html>
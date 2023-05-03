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
               <td> <img src="${dto.newFileName}" width="100"/></td>         
            </tr>
         </c:if>            
         <tr>
            <th colspan="2">
               <input type="button" onclick="location.href='noticeList.go'" value="리스트">
               <input type="button" onclick="location.href='./noticeUpdate.go?notice_idx=${dto.notice_idx}'" value="수정">
               <input type="button" onclick="location.href='./noticeDelete.go?notice_idx=${dto.notice_idx}'" value="삭제">
            </th>
         </tr>
               
      </table>
</body>
<script></script>
</html>
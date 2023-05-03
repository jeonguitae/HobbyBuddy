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
   <h3 align="center">공지사항 등록</h3>
   <form action="noticeWrite.do" method="post" enctype="multipart/form-data">
      <table>      
      
         <tr>
            <th>작성자 아이디</th>
            <td><input type="text" name="id"></td>
         </tr>               
         <tr>
            <th>공지사항 제목</th>
            <td><input type="text" name="notice_title"></td>
         </tr>
         <tr>
            <th>공지사항 내용</th>
            <td><textarea name="notice_content"></textarea></td>
         </tr>
         <tr>
            <th>사진</th>
            <td>
               <input type="file" name="photo" multiple="multiple">               
            </td>
         </tr>         
         <tr>            
            <th colspan="2">               
               <!-- 이러면 submit 효과가 사라짐 -->
               <!-- <button type="button"></button> -->
               <button>등록</button>
               <input type="button" onclick="location.href='noticeList.go'" value="취소">
            </th>
         </tr>
      </table>
   </form>
</body>
<script></script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
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
   #paging{
            text-align: center;
   }
   
</style>
</head>
<body>      
	<jsp:include page="gnb.jsp"/>
      <img src="../img/하비버디.png" width="100" height="100">
      <h2 align="center">공지사항 리스트</h2>
      게시물 갯수 : 
         <select id="pagePerNum">
            <option value="5">5</option>
            <option value="10">10</option>
            <option value="15">15</option>
            <option value="20">20</option>
         </select>
    
      <form action="search.do">
      	<select name="sSearch">
            <option value="default">선택</option>
            <option value="notice_title">제목</option>
            <option value="id">작성자</option>
         </select>      
         <input type="text" name="notice_Search">
         <button id="search_btn">검색</button>
      </form>                    
      <button onclick="location.href='noticeWrite.go'" >공지사항 작성</button>         
      <table>
         <thead>
            <tr>
               <th>번호</th>
               <th>작성자</th>
               <th>제목</th>
               <th>작성일시</th>
               <th>조회수</th>                      
            </tr>            
         </thead>
         <tbody id="list">
          	<c:if test="${noticePageList.size() == 0}">
               <tr><th colspan="5">해당 되는 게시물이 없습니다.</th></tr>
            </c:if>
            <c:forEach items="${noticePageList}" var="bbs">
               <tr>
                  <td>${bbs.notice_idx}</td>
                  <td><a href="noticeDetail.do?notice_idx='${bbs.notice_idx}'">${bbs.id}</a></td>
                  <td><a href="noticeDetail.do?notice_idx='${bbs.notice_idx}'">${bbs.notice_title}</a></td>                 
                  <td><fmt:formatDate value="${bbs.notice_date}" pattern="yyyy/MM/dd" /></td> 
                  <td>${bbs.notice_bHit}</td>
               </tr>               
            </c:forEach>   
         </tbody>
                                 
      </table>
      
	</body>
<script>
</script>
</html>
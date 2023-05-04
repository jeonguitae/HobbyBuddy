<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      
         <select name="notice">
            <option value="default">선택</option>
            <option value="notice_title">제목</option>
            <option value="id">작성자</option>
         </select>
      
         <input type="text" name="notice_Search">
         <button>검색</button>
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
             
         </tbody>
            <tr>
               <td colspan="6" id="paging">   
                  <!--    플러그인 사용   (twbsPagination)   -->
                  <div class="container">                           
                     <nav aria-label="Page navigation" style="text-align:center">
                        <ul class="pagination" id="pagination"></ul>
                     </nav>               
                  </div>
               </td>
            </tr>                     
      </table>
</body>
<script>

var showPage = 1;

listCall(showPage);

$('#pagePerNum').change(function() {
   listCall(showPage);
   // 페이지 처리 부분이 이미 만들어져 버려서 pagePerNum 이 변경되면 수정이 안된다.
   // 그래서 pagePerNum이 변경되면 부수고 다시 만들어야 한다.
   $('#pagination').twbsPagination('destroy');
});


function listCall(page){
   $.ajax({
      type:'post',
      url:'noticeList.ajax',
      data:{
          'page':page,
            'cnt':$('#pagePerNum').val()
      },
      dataType:'json',
      success:function(data){
         console.log(data);
         listPrint(data.noticePageList);
         
         // 총 페이지 수
         // 현재 페이지 
         
         //paging plugin
         $('#pagination').twbsPagination({
            startPage:data.currPage,    // 시작 페이지
            totalPages:data.pages,    // 총 페이지 수
            visiblePages:5,  // 보여줄 페이지[1][2][3][4][5]
            onPageClick:function(event, page){// 페이지 클릭시 동작되는 함수(콜백)
               console.log(event,page);      
            
               if (page != showPage) {
                  showPage = page;               
                  listCall(page);
               }
                  
            }
         });
      },
      error:function(e){
         console.log(e);
      }
   });
}


function listPrint(list){
   
   var content='';
   // java.sql.Date 는 js 에서 읽지 못해 밀리세컨드로 반환한다.
   // 해결방법 1. DTO 에서 Date 를 String 으로 반환
   // 해결방법 2. js 에서 변환
   list.forEach(function(item,idx){
      content += '<tr>';
      content += '<td>'+item.notice_idx+'</td>';
      content += '<td><a href="noticeDetail.do?notice_idx='+item.notice_idx+'">'+item.id+'</a></td>';
      content += '<td><a href="noticeDetail.do?notice_idx='+item.notice_idx+'">'+item.notice_title+'</a></td>';
      var date = new Date(item.notice_date);
      // 기본은 en-US
      content += '<td>'+date.toLocaleDateString('ko-KR')+'</td>';
      content += '<td>'+item.notice_bHit+'</td>';
      content += '</tr>';
   });
   $('#list').empty();
   $('#list').append(content);
}


</script>
</html>
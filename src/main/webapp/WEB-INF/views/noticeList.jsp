<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<jsp:include page="gnb.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="resources/css/css.css">
<style>
    <style>
    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        padding: 12px 20px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #f2f2f2;
    }

    #paging {
        text-align: center;
        padding-top: 20px;
    }

    #noticeboardSearchInput {
        padding: 8px;
        border-radius: 4px;
        border: 1px solid #ccc;
        margin-right: 10px;
        width: 50%
    }

    #noticeboardSearchButton {
        padding: 8px 20px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    #write_btn {
        padding: 8px 20px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        float: right;
    }

    table {
        color: red;
    }
      
</style>
<head>
</head>
<body>
		<br>
		<br>
		<br>
		<br>
      <h2 align="center" style="color: red;">공지사항</h2>
      <!-- 게시물 갯수 : 
         <select id="pagePerNum">
            <option value="10">10</option>
            <option value="20">20</option>
            <option value="30">30</option>
            <option value="40">40</option>
         </select> -->
         
       <!-- <div>
          <select id="search_Class">
            <option value="default">선택</option>
            <option value="notice_title">제목</option>
            <option value="id">작성자</option>
         </select>      
         <input type="text" id="search_text">
         <button id="search_btn">검색</button>
       </div>  -->
                 
      <button onclick="location.href='noticeWrite.go'" id="write_btn">공지사항 작성</button>
      <br>
      <br>         
      <table>
         <thead>
            <tr>
               <th>번호</th>
               <th>작성자</th>
               <th>제목</th>
               <th id="sortDate">작성일</th>
               <!-- <i class="fas fa-sort"></i> -->
               <th>조회수</th>                      
               <th id="sortChk">공개여부</th>                      
            </tr>            
         </thead>
         <tbody id="list">             
         </tbody>
            <tr>
			    <th colspan="6" id="paging" style="text-align: center;">
			        <!-- 플러그인 사용 (twbsPagination) -->
			        <div class="container" style="justify-content: center; display: flex;">
			            <nav aria-label="Page navigation">
			                <ul class="pagination" id="pagination"></ul>
			            </nav>
			        </div>
			    </th>
			</tr>                   
      </table>
      <br/>
		   <input type ="text" id="noticeboardSearchInput" placeholder="제목을 입력해 주세요.">
		   <button id ="noticeboardSearchButton">검색</button>
		
		 <br/>
   </body>
<script>

var loginId = "${sessionScope.loginId}";
var adminChk = "${sessionScope.adminChk}";

$(document).ready(function() {
	var adminChk = '${sessionScope.adminChk}';
	if (adminChk == 1 || adminChk == '1' || adminChk == "true") {

	}else{
	   $('#sortChk').closest('th').hide();
	   $('#list td:nth-child(5), #list th:nth-child(5)').hide();
	   document.querySelector('#write_btn').style.display = 'none';
	}

});


var searchText = 'default';
var showPage = 1;

listCall(showPage);

 $('#pagePerNum').change(function() {
   listCall(showPage);
   // 페이지 처리 부분이 이미 만들어져 버려서 pagePerNum 이 변경되면 수정이 안된다.
   // 그래서 pagePerNum이 변경되면 부수고 다시 만들어야 한다.
   $('#pagination').twbsPagination('destroy');
}); 
 
 $('#noticeboardSearchButton').click(function(){
	   searchText = $('#noticeboardSearchInput').val();
	   listCall(showPage);
	   $('#pagination').twbsPagination('destroy');
	});

 

/* $('#search_btn').click(function() {
   var searchClass = $("#search_Class").val();
    var searchText = $("#search_text").val();
      listCall(showPage, searchClass, searchText);
      $('#pagination').twbsPagination('destroy');
}); */


function listCall(page){
   $.ajax({
      type:'post',
      url:'noticeList.ajax',
      data:{
          'page':page,
            /* 'cnt':$('#pagePerNum').val()  */
            'search':searchText
      },
      dataType:'json',
      success:function(data){
         console.log(data);
         listPrint(data.nolist);

         
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


function listPrint(list) {
	   var content = '';
	   list.forEach(function(item, idx) {
		   content += '<tr style="color: red;">';
	      content += '<td>' + item.notice_idx + '</td>';
	      content += '<td>' + item.id + '</td>';
	      content += '<td><a href="noticeDetail.go?notice_idx=' + item.notice_idx + '">' + item.notice_title + '</a></td>';
	      var date = new Date(item.notice_date);
	      content += '<td>' + date.toLocaleDateString('ko-KR') + '</td>';
	      content += '<td>' + item.notice_bHit + '</td>';
	      
	      content += '<td id="secret">' + (item.notice_chk ? '공개' : '비공개') + '</td>';
	      content += '</tr>';
	   });
	   $('#list').empty();
	   $('#list').append(content);
	   
	   
	   var adminChk = '${sessionScope.adminChk}';
	   if (adminChk === 1 || adminChk === '1' || adminChk === "true") {
	      
	   }else{
		   var tds = document.getElementsByTagName("td");
		   for (var i = 0; i < tds.length; i++) {
		     var td = tds[i];
		     if (td.innerHTML === "비공개") {
		       var tr = td.parentElement;
		       tr.style.display = "none";
		     }
		   }
		   $('#list td#secret, #list th#secret').hide();
		   
	   }
	   
	}



/* var dateSortOrder = -1; 
var chkSortOrder = -1; 

$('#sortDate').click(function() {
   dateSortOrder *= -1; 
   $.ajax({
      type:'post',
      url:'noticeList.ajax',
      data:{
         'page':showPage,
         'cnt':$('#pagePerNum').val(),
         'sort':'date'
      },
      dataType:'json',
      success:function(data){
         list = data.noticePageList;
         list.sort(function(a, b) {
            var dateA = new Date(a.notice_date);
            var dateB = new Date(b.notice_date);
            return dateSortOrder * (dateB - dateA); // 클릭 횟수에 따라 오름차순 또는 내림차순 정렬
         });
         listPrint(list);
      },
      error:function(e){
         console.log(e);
      }
   });
});

$('#sortChk').click(function() {
   chkSortOrder *= -1; // 클릭할 때마다 정렬 방식을 변경
   $.ajax({
      type:'post',
      url:'noticeList.ajax',
      data:{
         'page':showPage,
         'cnt':$('#pagePerNum').val(),
         'sort':'chk'
      },
      dataType:'json',
      success:function(data){
         list = data.noticePageList;
         list.sort(function(a, b) {
            return chkSortOrder * (b.notice_chk - a.notice_chk); // 클릭 횟수에 따라 오름차순 또는 내림차순 정렬
         });
         listPrint(list);
      },
      error:function(e){
         console.log(e);
      }
   });
});
 */
</script>
</html>
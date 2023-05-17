<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="gnb.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
<link rel="stylesheet" href="resources/css/css.css">

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

         #qboardSearchInput {
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
            margin-right: 10px;
            width: 50%;
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
</style>
<head>

</head>
<body> 
	<br>
	<br>
	<br>
	<br>
      <h2 align="center" style="color: maroon;;">고객센터</h2>     
      
       <button onclick="location.href='qBoardWrite.go'" id="write_btn">문의하기</button>        
      <table>
         <thead>
            <tr>
               <th>번호</th>
               <th id="sortClass">문의종류<i class="fas fa-sort"></i></th>
               <th>제목</th>
               <th>작성자</th>
               <th id="sortDate">작성일<i class="fas fa-sort"></i></th>                                     
               <th id="sortChk">공개여부<i class="fas fa-sort"></i></th>
               <th>답변 여부</th>
               <!-- <th id="secret_col">비밀글 여부</th>   -->             
            </tr>            
         </thead>
         <tbody id="list">             
         </tbody>
            <tr>
               <td colspan="8" id="paging">   
                  <!--    플러그인 사용   (twbsPagination)   -->
                  <div class="container" style="justify-content: center; display: flex;">                          
                     <nav aria-label="Page navigation" style="text-align:center">
                        <ul class="pagination" id="pagination"></ul>
                     </nav>               
                  </div>
               </td>
            </tr>                     
      </table>
      <br/>
		   <input type ="text" id="qboardSearchInput" placeholder="문의 종류 및 제목을 입력해 주세요.">
		   <button id ="qboardSearchButton">검색</button>
		
		 <br/> 
      
	</body>
<script>

var loginId = "${sessionScope.loginId}";
var adminChk = "${sessionScope.adminChk}";


$(document).ready(function() {
	   var adminChk = '${sessionScope.adminChk}';
	   if (adminChk === true || adminChk === '1' || adminChk === "true") {
	      
	   } else {
	      $('#secret_col').closest('th').hide();
	      $('#list td:nth-child(8), #list th:nth-child(8)').hide();
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

$('#qboardSearchButton').click(function(){
	   searchText = $('#qboardSearchInput').val();
	   listCall(showPage);
	   $('#pagination').twbsPagination('destroy');
	});


function listCall(page){
   $.ajax({
      type:'post',
      url:'qboardList.ajax',
      data:{
          'page':page,
          'search':searchText           
      },
      dataType:'json',
      success:function(data){
         console.log(data);
         listPrint(data.qboardPageList);

         
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
	      content += '<td>'+item.qboard_no+'</td>';
	      content += '<td>'+item.qboard_class+'</a></td>';
	      content += '<td>';
	      
	      // 작성자 아이디와 세션 아이디가 일치하거나, 글이 공개된 경우 링크 제공
	      if (item.qboard_openchk === true || item.id === '${sessionScope.loginId}' || ${sessionScope.adminChk} === true) {
	         content += '<a href="qboardDetail.go?qboard_no='+item.qboard_no+'">'+item.qboard_title+'</a>';
	      } else {
	         content += '<span onclick="alert(\'비공개글 입니다.\')" style="cursor: not-allowed;">'+item.qboard_title+'</span>';
	      }

	      
	      content += '</td>';
	      content += '<td>'+item.id+'</td>';
	      var date = new Date(item.qboard_time);
	      // 기본은 en-US
	      content += '<td>'+date.toLocaleDateString('ko-KR')+'</td>';
	      content += '<td>'+(item.qboard_openchk ? '공개' : '비공개')+'</td>';
	      content += '<td>'+(item.qboard_state ? '답변 완료' : '답변 대기중')+'</td>';
	      
	     /*  if(item.secret_state) {
	         content += '<td id="secret"><button>비밀글 설정</button></td>';
	      } else {
	         content += '<td id="secret" style="display: none;"><button>비밀글 해제</button></td>';
	      } */
	      
	      content += '</tr>';
	      
	   });
	   $('#list').empty();
	   $('#list').append(content);   
	   
	   /* var adminChk = '${sessionScope.adminChk}';
	   if (adminChk === true || adminChk === '1' || adminChk === "true") {

	   } else {
	      $('#list tr').find('td:nth-child(8), th:nth-child(8)').hide();
	   } */
	}
var dateSortOrder = -1;
var chkSortOrder = -1;

$('#sortDate').click(function() {
  dateSortOrder *= -1;
  $.ajax({
    type: 'post',
    url: 'qboardList.ajax',
    data: {
      'page': showPage,
      'cnt': $('#pagePerNum').val(),
      'sort': 'date'
    },
    dataType: 'json',
    success: function(data) {
      list = data.qboardPageList;
      list.sort(function(a, b) {
        var dateA = new Date(a.qboard_time);
        var dateB = new Date(b.qboard_time);
        return dateSortOrder * (dateB - dateA); // 클릭 횟수에 따라 오름차순 또는 내림차순 정렬
      });
      listPrint(list);
    },
    error: function(e) {
      console.log(e);
    }
  });
});

$('#sortChk').click(function() {
  chkSortOrder *= -1; // 클릭할 때마다 정렬 방식을 변경
  $.ajax({
    type: 'post',
    url: 'qboardList.ajax',
    data: {
      'page': showPage,
      'cnt': $('#pagePerNum').val(),
      'sort': 'chk'
    },
    dataType: 'json',
    success: function(data) {
      list = data.qboardPageList;
      list.sort(function(a, b) {
        return chkSortOrder * (b.qboard_openchk - a.qboard_openchk); // 클릭 횟수에 따라 오름차순 또는 내림차순 정렬
      });
      listPrint(list);
    },
    error: function(e) {
      console.log(e);
    }
  });
});

var classSortOrder = 1; // 초기 정렬 방식 (오름차순)

$('#sortClass').click(function() {
  classSortOrder *= -1; // 클릭할 때마다 정렬 방식을 변경
  $.ajax({
    type: 'post',
    url: 'qboardList.ajax',
    data: {
      'page': showPage,
      'cnt': $('#pagePerNum').val(),
      'sort': 'class'
    },
    dataType: 'json',
    success: function(data) {
      list = data.qboardPageList;
      list.sort(function(a, b) {
        var classA = a.qboard_class.toUpperCase();
        var classB = b.qboard_class.toUpperCase();
        return classSortOrder * classA.localeCompare(classB); // 클릭 횟수에 따라 오름차순 또는 내림차순 정렬
      });
      listPrint(list);
    },
    error: function(e) {
      console.log(e);
    }
  });
});



</script>
</html>
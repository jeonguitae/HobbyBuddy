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
<link rel="stylesheet" href="resources/css/css.css">
<style>
    table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  border: 1px solid black;
  padding: 8px;
}

th:first-child,
td:first-child {
  border-left: none;
}

th:last-child,
td:last-child {
  border-right: none;
}

button {
  margin: 5px;
}

input[type="text"] {
  width: 40%;
}

#search {
  display: inline-block;
}

colgroup {
  width: 30%;
}

#paging {
  text-align: center;
}

th:nth-child(4),
td:nth-child(4) {
  width: 25%;
}

   
   
</style>
<head>

</head>
<body>      
      
      <h2 align="center">모임 신고 관리 리스트</h2>
    	 <br/>
		   <input type ="text" id="gboardSearchInput" placeholder="피신고자 아이디를 입력해 주세요.">
		   <button id ="gboardSearchButton">검색</button>
		
		 <br/>  
		 <br>
	<br>                         
      <table>
         <thead>
            <tr>
               <th>신고 번호</th>
               <th>신고 분류</th>
               <th>피신고자 아이디</th>
               <th>신고 제목</th>
               <th>신고 일시</th>
               <th>처리 상태</th>                        
               <th>처리 일시</th>                        
               <th>처리자</th>                        
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
      
	</body>
<script>
var loginId = "${sessionScope.loginId}";
var adminChk = "${sessionScope.adminChk}";
var searchText = 'default';
var showPage = 1;

listCall(showPage);

 $('#pagePerNum').change(function() {
   listCall(showPage);
   // 페이지 처리 부분이 이미 만들어져 버려서 pagePerNum 이 변경되면 수정이 안된다.
   // 그래서 pagePerNum이 변경되면 부수고 다시 만들어야 한다.
   $('#pagination').twbsPagination('destroy');
}); 

 

/* $('#search_btn').click(function() {
	var searchClass = $("#search_Class").val();
    var searchText = $("#search_text").val();
	   listCall(showPage, searchClass, searchText);
	   $('#pagination').twbsPagination('destroy');
}); */

$('#gboardSearchButton').click(function(){
	   searchText = $('#gboardSearchInput').val();
	   listCall(showPage);
	   $('#pagination').twbsPagination('destroy');
	});


function listCall(page){
   $.ajax({
      type:'post',
      url:'report_gboardList.ajax',
      data:{
          'page':page,
          'search':searchText
      },
      dataType:'json',
      success:function(data){
         console.log(data);
         listPrint(data.report_gboardList);

         
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
	   list.forEach(function(item,idx){
	      content += '<tr>';
	      content += '<td>'+item.rept_no+'</td>';
	      content += '<td>'+item.reptboard_class+'</td>';
	      content += '<td>'+item.preporter+'</td>';
	      content += '<td><a href="report_gboardDetail.go?rept_no='+item.rept_no+'">'+item.rept_title+'</td>';
	      var date = new Date(item.rept_date);
	      content += '<td>'+date.toLocaleDateString('ko-KR')+'</td>';
	      content += '<td>'+item.rept_state+'</td>';
	      date = new Date(item.proc_date);
	      var procDate = date.getTime() === 0 ? '' : date.toLocaleDateString('ko-KR'); // 조건문 추가
	      content += '<td>'+ procDate +'</td>';
	      content += '<td>'+(item.admin_id ? item.admin_id : '')+'</td>'; // 조건문 추가
	      content += '</tr>';
	   });
	   $('#list').empty();
	   $('#list').append(content);
	}


</script>
</html>
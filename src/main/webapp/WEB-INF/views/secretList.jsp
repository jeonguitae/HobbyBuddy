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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
      width: 1000px;
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
      <h2 align="center">비밀글 처리 관리</h2>
      게시물 갯수 : 
         <select id="pagePerNum">
            <option value="100">100</option>
            <option value="150">150</option>
            <option value="200">200</option>
            <option value="250">250</option>
         </select>
      <form action="search.do">
      
         <select name="secret">
            <option value="default">선택</option>
            <option value="sobard_title">제목</option>
            <option value="writer_id">작성자</option>
         </select>
      
         <input type="text" name="secret_Search">
         <button>검색</button>
      </form>                            
      <table>
         <thead>
            <tr>
               <th>게시판 종류</th>
               <th>게시판 번호</th>
               <th>게시판 제목</th>
               <th>작성자</th>
               <th>처리한 관리자</th>
               <th>비밀글 여부</th>                        
               <th>비밀 일시</th>                       
            </tr>            
         </thead>
         <tbody id="list">             
         </tbody>
            <tr>
               <td colspan="7" id="paging">   
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

var msg = "${msg}";
if(msg!=""){
   alert(msg);
}

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


function listCall(page){
   $.ajax({
      type:'post',
      url:'secretList.ajax',
      data:{
          'page':page,
            'cnt':$('#pagePerNum').val()          
      },
      dataType:'json',
      success:function(data){
         console.log(data);
         listPrint(data.secretPageList);

         
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
	  // java.sql.Date 는 js 에서 읽지 못해 밀리세컨드로 반환한다.
	  // 해결방법 1. DTO 에서 Date 를 String 으로 반환
	  // 해결방법 2. js 에서 변환

	  list.forEach(function(item, idx) {
	    content += '<tr>';
	    content += '<td>'+item.sboard_class+'</td>';
	    content += '<td>'+item.sboard_num+'</td>';
	    content += '<td>'+item.sboard_title+'</td>';
	    content += '<td>'+item.writer_id+'</td>';
	    content += '<td>'+item.admin_id+'</td>';
	    content += '<td><button id="secretSet_Btn" onclick="confirmSecretRelease(' + item.sboard_num + ')">비밀 해제</button></td>';
	    var date = new Date(item.secret_time);
	    content += '<td>'+date.toLocaleDateString('ko-KR')+'</td>';
	    content += '</tr>';
	  });

	  $('#list').empty();
	  $('#list').append(content);
	}

	function confirmSecretRelease(sboard_num) {
	  if (confirm('비밀 글을 해제하시겠습니까?')) {
	    // Perform additional logic if needed
	    location.href = './secretSet.do?sboard_num=' + sboard_num;
	  }
	}
	
	
	/* $('.chkBtn').off('click').on('click', function() {
    var $btn = $(this);
    var sboard_num = $btn.data('sboard-num');
    var secret_state = $btn.data('secret-state');
    var new_secret_state = secret_state;
    var newBtnText = '';

    if (secret_state) {
      if (confirm('해당 글 비밀글 해제하시겠습니까?')) {
        new_secret_state = false;
        newBtnText = '비밀글 설정';
      }
    } else {
      if (confirm('해당 글 비밀글 설정하시겠습니까?')) {
        new_secret_state = true;
        newBtnText = '비밀글 해제';
      }
    }

    if (new_secret_state !== secret_state) {
      $.ajax({
        type: 'POST',
        url: 'secret_chk.ajax',
        cache: false,
        data: { sboard_num: sboard_num, secret_state: new_secret_state },
        success: function(response) {
          console.log(response);
          $btn.text(newBtnText);
          $btn.data('secret-state', new_secret_state);
        },
        error: function(error) {
          console.error(error);
        }
      });
    } else {
      $btn.text(newBtnText);
      $btn.data('secret-state', new_secret_state);
    }
  }); */

</script>
</html>
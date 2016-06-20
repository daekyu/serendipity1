<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src=".././resources/js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="http://localhost:8090/serendipity/resources/ckeditor/sweetalert.min.js"></script> <link rel="stylesheet" type="text/css" href="http://localhost:8090/serendipity/resources/ckeditor/sweetalert.css"> 
<script type="text/javascript" src=".././resources/js/sweetalert.min.js">
</script> 
<link rel="stylesheet" type="text/css" 
href=".././resources/js/sweetalert.css">      

<script type="text/javascript">

$(function() {
   $('#withdraw').click(function() {

swal({   title: "정말로 탈퇴하시겠습니까?",   
      text: "한번탈퇴하면 복구할 수 없습니다!",   
      type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",   
      confirmButtonText: "탈퇴",   cancelButtonText: "취소",   
      closeOnConfirm: false,   closeOnCancel: false }, 
      function(isConfirm){     
         if(isConfirm){
   
               
            
         
         swal("탈퇴되었습니다.", "관련된 모든 정보가 삭제되었습니다.", "success");   
       location.href="${pageContext.request.contextPath}/index.htm?user_num=${dto.user_num}";  
      
      
      }else{     swal("취소되었습니다.", "감사합니다. :)", "error");   } });

   });
});



</script>








<!-- my account - 내가 신청한 내역 -->

<div class="breadcrumb-box breadcrumb-none"></div>

<section id="main" class="page ">
  <header class="page-header">
    <div class="container">
      <h1 class="title">회원 탈퇴</h1>
    </div>   
  </header>
  <div class="container">
    <div class="row">
      <article class="col-sm-9 col-md-9 content">
      <div class="my-account">
        <div class="table-responsive">
         <table class="table table-striped table-bordered text-center my-orders-table">
          <thead>
            <tr class="first last">
              <th>
                
              
              
                 회원 탈퇴하시겠습니까?<br><br>
                 <button type="button" class="btn btn-danger" id="withdraw"  href="${pageContext.request.contextPath}/mypage/my_page_withdraw.htm?user_num=${dto.user_num}">Yes</button>   
                 <button type="button" class="btn btn-success">No</button>
              
              
              </th>
            </tr>
           </thead> 
           
           
           
           
         </table>
        </div>
      </div>
      </article><!-- .content -->
     
     <jsp:include page="my_page_sidebar.jsp"></jsp:include>
    </div>
  </div>
</section><!-- #main -->
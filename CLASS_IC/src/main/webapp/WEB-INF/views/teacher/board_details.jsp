<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.class_ic.vo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<script type="text/javascript">

$().ready(function() {
    
     $('#add').click(function click() {

        swal({
             title: '서브 카테고리 생성',
             text: '통합게시판에서 생성 됩니다.',
             type: 'warning',
             showCancelButton: true,
             confirmButtonText: '통합게시판에서 생성',
             cancelButtonText: '나중에 생성 할래요 ',
             confirmButtonClass: "btn btn-info",
             cancelButtonClass: "btn btn-rose",
             buttonsStyling: false
         }).then(function() {
         location.href="allboard.htm";
         })

   });
     
      $('.clicksub').click(function click() {

         var subcateCode=$(this).attr("id");
        var cateCode=$('#refercate').text();
        
         $.ajax({
              type: 'GET',
              url: 'selectcatesubcateboard.htm',
              data: {cateCode:cateCode,subcateCode:subcateCode} ,
              dataType: 'text',
              success: function(data) {
                $('#selectdatatable').html(data);
              },
              error: function() {
                 alert('bad');
               
              } 

          });

   });
      
 

   });

</script>
<br>
<br>
<br>

   <div class="row">
      <div class="col-md-8 col-md-offset-2">
         <h2 class="title text-center"><b id="refercate">${cateCode}</b></h2>
         <br>
    
                                
                                
         <div class="nav-left">
            <ul class="nav nav-pills nav-pills-info nav-pills-icons"
               role="tablist">
               <!--
                        color-classes: "nav-pills-primary", "nav-pills-info", "nav-pills-success", "nav-pills-warning","nav-pills-danger"
                    -->
                       <c:forEach var="SubCategoryDTO" items="${sublist}">
               <li class=""><a href="#description-1" role="tab"
                  data-toggle="tab" aria-expanded="false" class="clicksub" id="${SubCategoryDTO.subcateCode}" > 
                  
                  <i class="material-icons">reorder</i> ${SubCategoryDTO.subcateCode}
               </a></li>
                  </c:forEach>
          
               <li class="active"><a href="#description-2" role="tab"
                  data-toggle="tab" aria-expanded="false" > <!--                                            <i class="material-icons">exposure_plus_1</i> -->
                     <button class="btn btn-raised btn-round btn-white"
                        id="add">+</button>
                 <i]></i><br> ADD
               </a>
             
               </li>
            </ul>
            <div id="selectdatatable">
   </div>
         </div>

   
   </div>

   
   </div>

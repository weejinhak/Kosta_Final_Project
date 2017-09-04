<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<br>
<br>
<br>
<br>
   <div align="center">
      <h3>
         교사 통합 관리 페이지
      </h3>
   </div>
   <div class="container-fluid">

      <div class="row">

         <div class="col-md-12">

            <div class="card">
               <div class="card-header card-header-icon"
                  data-background-color="purple">
                  <i class="material-icons">assignment</i>
               </div>
               <div class="card-content">
                  <h4 class="card-title">integrated management system</h4>
                  <div class="toolbar">
                     <!--        Here you can write extra buttons/actions for the toolbar              -->
                  </div>
                  <div class="material-datatables">

                     <!-- 카테고리 select start -->
                     <div class="dataTables_length" id="datatables_length">
                        <label class="form-group">카테고리 선택<select
                           name="datatables_length" aria-controls="datatables"
                           class="form-control input-sm"><option value="10">Web</option>
                              <option value="25">Spring</option>
                              <option value="50">Java</option>
                              <option value="-1">Detabases</option></select> 
                        </label>
                     </div>
                     <!-- 카테고리 select end -->
                     <table id="datatables"
                        class="table table-striped table-no-bordered table-hover"
                        cellspacing="0" width="100%" style="width: 100%">
                        <thead>
                           <tr>
                              <th class="text-center">글번호</th>
                              <th class="text-center">글내용</th>
                              <th class="text-center">글종류</th>
                              <th class="text-center">작성날짜</th>
                              <th class="text-center">Actions</th>
                           </tr>
                        </thead><!-- 
                        <tfoot>
                           <tr>
                              <th class="text-center">글번호</th>
                              <th class="text-center">글내용</th>
                              <th class="text-center">글종류</th>
                              <th class="text-center">작성날짜</th>
                              <th class="text-center">Actions</th>
                           </tr>
                        </tfoot> -->
                        <tbody>
                           <tr>
                              <td class="text-center">Tiger Nixon</td>
                              <td class="text-center">System Architect</td>
                              <td class="text-center">Edinburgh</td>
                              <td class="text-center" >2011/04/25</td>
                              <td class="text-center"><a href="#"
                                 class="btn btn-simple btn-info btn-icon like"><i
                                    class="material-icons">favorite</i></a> <a href="#"
                                 class="btn btn-simple btn-danger btn-icon remove"><i
                                    class="material-icons">close</i></a></td>
                           </tr>
                           <tr>
                              <td class="text-center">Tasd</td>
                              <td class="text-center">Sysadt</td>
                              <td class="text-center">Edasdurgh</td>
                              <td class="text-center">2013/05/25</td>
                              <td class="text-center"><a href="#"
                                 class="btn btn-simple btn-info btn-icon like"><i
                                    class="material-icons">favorite</i></a> <a href="#"
                                 class="btn btn-simple btn-danger btn-icon remove"><i
                                    class="material-icons">close</i></a></td>
                           </tr>
                           
                        </tbody>
                     </table>
                  </div>
               </div>
               <!-- end content-->
            </div>
            <!--  end card  -->
         </div>
         <!-- end col-md-12 -->
      </div>
      <!-- end row -->
   </div>



<script type="text/javascript">
   $(document).ready(
         function() {
            $('#datatables').DataTable(
                  {
                     "pagingType" : "full_numbers",
                     "lengthMenu" : [ [ 10, 25, 50, -1 ],
                           [ 10, 25, 50, "All" ] ],
                     responsive : true,
                     language : {
                        search : "_INPUT_",
                        searchPlaceholder : "Search records",
                     }

                  });

            var table = $('#datatables').DataTable();

            // Edit record
            table.on('click', '.edit', function() {
               $tr = $(this).closest('tr');

               var data = table.row($tr).data();
               alert('You press on Row: ' + data[0] + ' ' + data[1] + ' '
                     + data[2] + '\'s row.');
            });

            // Delete a record
            table.on('click', '.remove', function(e) {
               $tr = $(this).closest('tr');
               table.row($tr).remove().draw();
               e.preventDefault();
            });

            //Like record
            table.on('click', '.like', function() {
               alert('You clicked on Like button');
            });

            $('.card .material-datatables label').addClass('form-group');
         });
</script>

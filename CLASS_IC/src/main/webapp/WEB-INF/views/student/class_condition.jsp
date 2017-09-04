<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <div class="content">
       <div class="container-fluid">
      	 <!-- 내용물  contents  -->
      	 <div class="header text-center">
                     <!--    <h3 class="title">교실상태</h3> -->
                   
                    </div>
                    <div class="row">
                   
                    <div class="col-md-4">
                            <div class="card">
                                <div class="card-header card-header-icon" data-background-color="rose">
                                    <i class="material-icons">wb_sunny</i>
                                </div>
                                <div class="card-content">
                                    <h4 class="card-title">기온</h4>
                                    <div class="form-group">
                                      <!-- 기온 표시  -->
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header card-header-icon" data-background-color="rose">
                                    <i class="material-icons">error_outline</i>
                                </div>
                                <div class="card-content">
                                    <h4 class="card-title">이산화탄소 수치</h4>
                                    <div class="form-group">
                                     <!-- 이산화 탄소 수치 표시  -->
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                        
                        <div class="col-md-10">
                             
               
                            <div class="card">
                                <div class="card-header card-header-icon" data-background-color="blue">
                                    <i class="material-icons">timeline</i>
                                </div>
                                <div class="card-content">
                                    <h4 class="card-title">Coloured Bars Chart
                                        <small> - Rounded</small>
                                    </h4>
                                </div>
                                <div id="colouredBarsChart" class="ct-chart"></div>
                            </div>
                        </div>
                       
                    </div>
      	 </div>
      	</div>
 
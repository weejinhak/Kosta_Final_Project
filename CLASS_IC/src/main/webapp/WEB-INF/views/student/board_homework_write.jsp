<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <div class="content">
       <div class="container-fluid">
      	 <!-- 내용물  contents  -->
      	 
<div class="col-md-12">
                            <div class="card">
                                <form method="get" action="/" class="form-horizontal">
                                    <div class="card-header card-header-text" data-background-color="rose">
                                        <h4 class="card-title">과제 입력하기</h4>
                                    </div>
                                    <div class="card-content">
                                        <div class="row">
                                            <label class="col-sm-2 label-on-left">제목 : </label>
                                            <div class="col-sm-10">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <input type="text" class="form-control" value="" style="width: 90%">
                                                    <span class="help-block">과제의 제목을 입력해 주세요.</span>
                                                <span class="material-input"></span></div>
                                            </div>
                                        </div>
                                            <div class="row">
                                            <label class="col-sm-2 label-on-left">내용 : </label>
                                            <div class="col-sm-10">
                                                <div class="form-group label-floating is-empty">
                                                    <label class="control-label"></label>
                                                    <textarea  cols="50" style="width: 90%; height: 300px; color: gray"></textarea>

                                                    <span class="help-block">과제의 제목을 입력해 주세요.</span>
                                                <span class="material-input"></span></div>
                                            </div>
                                        </div>
                                        
                                       파일첨부 기능은 석환상이 나중에 하신다고 해서 비워 놨슴당.
                                           
                                       <div class="td-actions text-center">
                                                        <button type="button" rel="tooltip" class="btn btn-info btn-round" data-original-title="" title="">
                                                            <i class="material-icons">list</i>
                                                        </button>
                                                        <button type="button" rel="tooltip" class="btn btn-success btn-round" data-original-title="" title="">
                                                            <i class="material-icons">edit</i>
                                                        </button>
                                                        <button type="button" rel="tooltip" class="btn btn-danger btn-round" data-original-title="" title="">
                                                            <i class="material-icons">close</i>
                                                        </button>
                                                    </div>
                                                    <br>
                                                    <br>
                                                    <br>
                                        </div>
                                 
                                    </div>
                           
                            </div>
      	 </div>
</div>
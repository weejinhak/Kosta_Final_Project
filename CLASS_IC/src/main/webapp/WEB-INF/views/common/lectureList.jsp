<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="http://code.jquery.com/jquery-1.7.2.min.js"></script>

<script type="text/javascript">
console.log('jsp까지 들어옴');
</script>

              <c:forEach items="${lecturelist}" var="n">
                  <div class="col-md-4">
                              <div class="card card-chart" data-count="3">
                              
                                    <div class="card-header" data-background-color="blue"
                                       data-header-animation="true" >
                                       <div align="center">
                                       <h3 class="card-title" >

                                          <br>${n.classCode}

                                       </h3></div>
                                    </div>
                                    
                                    <div class="card-content">
                                          <div class="card-actions">
                                             <form action="teacher/main.htm" method="POST">
                                             <input type="hidden" value="${n.classCode }" name="classCode"/>
                                             <button type="submit" class="btn btn-info btn-simple"
                                                rel="tooltip" data-placement="bottom" title=""
                                                data-original-title="go!" >
                                                <i class="material-icons">input</i>                                       
                                             </button>
                                          </form>
                                          </div>                                 
                                             <br>
                                          <p class="category">
                                             ${n.classTitle}
                                          </p>
                                    </div>
                                    
                                    <div class="card-footer">
                                       <div class="stats">
                                          <i class="material-icons">access_time</i> campaign sent 2 days ago
                                       </div>
                                    </div>
                              </div>
               </div>
            </c:forEach>

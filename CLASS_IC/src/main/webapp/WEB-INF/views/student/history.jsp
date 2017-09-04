<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.class_ic.vo.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="content">
	<div class="container-fluid">
		<!-- 내용물  contents  -->

		<div class="col-md-12">
			<div class="card card-plain">
				<div class="card-content">
					<ul class="timeline">
		
					
					<c:forEach var="list" items="${list}">
				<c:if test="${list.calNo%4==0}">
						<li class="timeline-inverted">
                     <div class="timeline-badge danger">
                        <i class="material-icons">wb_sunny</i>
                     </div>
                     <div class="timeline-panel">
                        <div class="timeline-heading">
                            <span class="label label-danger">
                           		${list.calTitle}
                           	</span>
                           	<div class="historydate">
                           	 <p> ${list.calStart}   ~   ${list.calEnd} </p>
                        	</div>
                        </div>
                        <div class="timeline-body">
                           <p>	${list.calContent}</p>
                           <hr>
                        </div>
                     </div>		
                  </li>
                  </c:if>
				
						  <c:if test="${list.calNo%4==1}">
						<li>
							<div class="timeline-badge success">
								<i class="material-icons">extension</i>
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<span class="label label-success">
										${list.calTitle}
									</span>
									<div class="historydate">
									 <p> ${list.calStart}   ~   ${list.calEnd} </p>
									</div>
								</div>
								<div class="timeline-body">
									<p>
										${list.calContent}
									</p>
									<hr>
								</div>
							</div>
						</li>
					</c:if>
					
					
				     <c:if test="${list.calNo%4==2}">
						<li class="timeline-inverted">
                     <div class="timeline-badge info">
                        <i class="material-icons">sentiment_very_satisfied</i>
                     </div>
                     <div class="timeline-panel">
                        <div class="timeline-heading">
                            <span class="label label-info">
                           		${list.calTitle}
                           	</span>
                           	<div class="historydate">
                           	 <p> ${list.calStart}   ~   ${list.calEnd} </p>
                           	 </div>
                        </div>
                        <div class="timeline-body">
                           <p>	${list.calContent}</p>
                           <hr>
                        </div>
                     </div>		
                  </li>
                  </c:if>
                  
                  
				
				<c:if test="${list.calNo%4==3}">
				  <li>
                     <div class="timeline-badge warning">
                        <i class="material-icons">beach_access</i>
                     </div>
                     <div class="timeline-panel">
                        <div class="timeline-heading">
                     
                          <span class="label label-warning">
										${list.calTitle}
							</span>
							<div class="historydate">
							<p> ${list.calStart}   ~   ${list.calEnd} </p>
                        	</div>
                        </div>
                        <div class="timeline-body">
                  				<p>
										${list.calContent}
								</p>
                           <hr>
                        </div>
                     </div>
                  </li>
				</c:if>
				
				
            
                  </c:forEach>
                  
					</ul>
				</div>
			</div>
		</div>


	</div>
</div>
<script type="text/javascript">
    $().ready(function() {
        demo.checkFullPageBackgroundImage();

        setTimeout(function() {
            // after 1000 ms we add the class animated to the login/register card
            $('.card').removeClass('card-hidden');
        }, 700)
    });
    
   
</script>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<div id="history" class="container wrapper">

    <div class="row">
        <div class="col">
            <h2 class="title">Your booking history</h2>
            <c:forEach items="${bookings}" var="b">
                   <div class="history-item row">
                    
                    
                    
                          <div class="col-sm-6 right-box">
                        
                               <div class="pickup-point">
                                   <span><i class="fa fa-play-circle" aria-hidden="true"></i> <b>Pick-up point:</b> </span><spring:eval expression="b.ride.pickupPoint" />
                               </div>
                               <div class="dropoff-point">
                                   <span><i class="fa fa-stop-circle-o" aria-hidden="true"></i> <b>Drop-off point:</b> </span><spring:eval expression="b.ride.dropoffPoint" />
                               </div>
                               
                              
                          </div>
                            <div class="col-sm-6 left-box">
                           
                       
                        <p class="date">
                            <i class="fa fa-calendar" aria-hidden="true"></i> <b>Departure time:</b> <spring:eval expression="b.ride.departureAt" /> 
                        </p>
                        
                        <p class="date">
                            <i class="fa fa-calendar" aria-hidden="true"></i> <b>Arrival time:</b> <spring:eval expression="b.ride.arrivalAt" />  
                        </p>
                           <p class="date">
                            <i class="fa fa-calendar" aria-hidden="true"></i> <b>Booking time:</b> <spring:eval expression="b.bookingAt" /> 
                        </p>
                      
                        <p class="price">
                            <i class="fa fa-usd" aria-hidden="true"></i> <b>Price:</b>  <spring:eval expression="b.ride.pricePerSeat" /> 
                        </p>
                    </div>
                    </div>
              
            </c:forEach>
        </div>
    </div>
    
    </div>




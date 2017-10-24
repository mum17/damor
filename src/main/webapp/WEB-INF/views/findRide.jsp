<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>


<form class="form-horizontal">
 <div class="form-group">
    <label  class="col-sm-2 control-label" name="pickupLat">Pickup latitude</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" value="41.0178238">
    </div>
  </div>
  <div class="form-group">
    <label  class="col-sm-2 control-label" name="pickupLng">Pickup latitude</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" value="-91.9672906">
    </div>
  </div>
  
   <div class="form-group">
    <label  class="col-sm-2 control-label" name="pickupRadius">Pickup radius</label>
    <div class="col-sm-10">
     <label> <input type="text" class="form-control" value="1">(in miles)</label>
    </div>
  </div>
   <div class="form-group">
    <label  class="col-sm-2 control-label" name="dropoffLat" >Drop-off latitude</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" value="41.016029">
    </div>
  </div>
  
     <div class="form-group">
    <label  class="col-sm-2 control-label" name="dropoffLng" >Drop-off longitude</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" value="-92.408302">
    </div>
  </div>
  
   <div class="form-group">
    <label  class="col-sm-2 control-label" name="dropoffRadius">Drop-off radius</label>
    <div class="col-sm-10">
     <label> <input type="text" class="form-control" value="1">(in miles)</label>
    </div>
  </div>
    <div class="form-group">
    <label  class="col-sm-2 control-label" name="departureAtFrom">Departure time</label>
    <div class="col-sm-10">
 <input type="text" class="form-control" value="10/22/2017 12:30">
    </div>
  </div>
  
    <div class="form-group">
    <label  class="col-sm-2 control-label" name="departureAtTo">Arrival time</label>
    <div class="col-sm-10">
     <input type="text" class="form-control" value="10/22/2017 12:30">
    </div>
  </div>
   <div class="form-group">
    <label  class="col-sm-2 control-label" name="departureAtTo">Price from</label>
    <div class="col-sm-10">
     <input type="text" class="form-control" value="0">
    </div>
  </div>
  
   <div class="form-group">
    <label  class="col-sm-2 control-label" name="departureAtTo">Price to</label>
    <div class="col-sm-10">
     <input type="text" class="form-control" value="100">
    </div>
  </div>
  
   
      <button type="button" value="Find ride" onclick="api.findRide(this.form)"></button>
   
  <div>
  <a href="<spring:url value="/myBookings"/>">My bookings</a>
  </div>
</form>



<fieldset><legend>Found rides</legend>
<div id="foundRides"></div>
</fieldset>
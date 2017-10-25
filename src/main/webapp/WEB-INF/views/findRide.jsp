<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<legend>Find a ride</legend>

<form>

<div class="container" >
      <div id="row">
		
        <div class="col-sm-8">
          <div class="panel panel-primary">
          <div class="panel-heading">Pick-up and Drop-off points</div>
          <div class="panel-body">
          <div class="form-group ">
			  <label class="control-label " for="origin-input">
			   Pick Up Point
			  </label>
			  <div class="input-group">
			   <div class="input-group-addon">
				<span class="glyphicon glyphicon-log-in"></span> 
			   </div>
			   <input id="origin-input"  class="form-control" placeholder="Example : Fairfield, Iowa" name="pickupPoint" size=100 />
			  </div>
			 </div>
			 
			 <div class="form-group ">
			  <label class="control-label " for="pickupRadius">
			   Pick up Radius (in miles)
			  </label>
			  <div class="input-group">
			   <div class="input-group-addon">
				<span class="glyphicon glyphicon-time"></span> 
			   </div>
			   <input type=number  id="pickupRadius" name="pickupRadius" class="form-control" value="1" />
			  </div>
			 </div>
			 
			 
          <div class="form-group ">
			  <label class="control-label " for="destination-input">
			   Drop off Point
			  </label>
			  <div class="input-group">
			   <div class="input-group-addon">
				<span class="glyphicon glyphicon-log-out"></span> 
			   </div>
			   <input id="destination-input" class="form-control" placeholder="Example : Des Moines, Iowa" name="dropoffPoint" size=100  />
			  </div>
			 </div>
			
			
			 <div class="form-group ">
			  <label class="control-label " for="dropoffRadius">
			   Drop off Radius (in miles)
			  </label>
			  <div class="input-group">
			   <div class="input-group-addon">
				<span class="glyphicon glyphicon-time"></span> 
			   </div>
			   <input type=number  id="dropoffRadius" name="dropoffRadius" class="form-control" value="1" />
			  </div>
			 </div>
			 
			 <div class="form-group ">
			  <label class="control-label " for="departureAt">
			   Departure (After)
			  </label>
			  <div class="input-group">
			   <div class="input-group-addon">
				<span class="glyphicon glyphicon-time"></span> 
			   </div>
			   <input id="departureAt" name="departureAtFrom" class="form-control" value="${today} 10:00" />
			  </div>
			 </div>
			 
			 <div class="form-group ">
			  <label class="control-label " for="arrivalAt">
			   Departure (Before)
			  </label>
			  <div class="input-group">
			   <div class="input-group-addon">
				<span class="glyphicon glyphicon-time"></span> 
			   </div>
			   <input id="arrivalAt" name="departureAtTo" class="form-control" value="${today} 18:00" />
			  </div>
			 </div>
			 
			 <div class="form-group ">
			  <label class="control-label " for="priceFrom">
			   Price min
			  </label>
			  <div class="input-group">
			   <div class="input-group-addon">
				<span class="glyphicon glyphicon-usd"></span> 
			   </div>
			   <input type=number id="priceFrom" name="priceFrom" class="form-control" value="0" />
			  </div>
			 </div>
 
			 <div class="form-group ">
			  <label class="control-label " for="priceTo">
			   Price max
			  </label>
			  <div class="input-group">
			   <div class="input-group-addon">
				<span class="glyphicon glyphicon-usd"></span> 
			   </div>
			   <input type=number id="priceTo" name="priceTo" class="form-control" value="100" />
			  </div>
			 </div>

			
			<div>
			
				<input type="button" class="btn btn-primary" value="Find ride" onclick="api.findRide(this.form)" />
				<a href="<spring:url value="/myBookings"/>">My bookings</a>

            </div>
            
            <div id="mode-selector" class="controls" hidden="true">
		      <input type="radio" name="type" id="changemode-walking" checked="checked">
		      <label for="changemode-walking">Walking</label>
		
		      <input type="radio" name="type" id="changemode-transit">
		      <label for="changemode-transit">Transit</label>
		
		      <input type="radio" name="type" id="changemode-driving" >
		      <label for="changemode-driving">Driving</label>
		    </div>
            
            </div>
            
        </div>
        
      </div>
		<div class="col-sm-4" >
          <div id="map"  style="width: 400px; height: 400px;"></div>
          <br>
          
          <div>
          
          <div class="form-group ">
			  <label class="control-label " for="pickLat">
			   Pick Up Latitude
			  </label>
			  <div class="input-group">
			   <div class="input-group-addon">
				<span class="glyphicon glyphicon-time"></span> 
			   </div>
			   <input id="pickLat" name="pickupLat" class="form-control" value="0" readonly />
			  </div>
			 </div>

            <div class="form-group ">
			  <label class="control-label " for="pickLng">
			   Pick Up Longitude
			  </label>
			  <div class="input-group">
			   <div class="input-group-addon">
				<span class="glyphicon glyphicon-time"></span> 
			   </div>
			   <input id="pickLng" name="pickupLng" class="form-control" value="0" readonly />
			  </div>
			 </div>
			 
			 <div class="form-group ">
			  <label class="control-label " for="destLat">
			   Drop-off Latitude
			  </label>
			  <div class="input-group">
			   <div class="input-group-addon">
				<span class="glyphicon glyphicon-time"></span> 
			   </div>
			   <input id="destLat" name="dropoffLat" class="form-control" value="0" readonly />
			  </div>
			 </div>
			 
			 <div class="form-group ">
			  <label class="control-label " for="destLng">
			   Drop-off Longitude
			  </label>
			  <div class="input-group">
			   <div class="input-group-addon">
				<span class="glyphicon glyphicon-time"></span> 
			   </div>
			   <input id="destLng" name="dropoffLng" class="form-control" value="0" readonly />
			  </div>
			 </div>

            </div>
            
            
            <div class="form-group ">
			  <label class="control-label " for="distance">
			   Distance (in miles)
			  </label>
			  <div class="input-group">
			   <div class="input-group-addon">
				<span class="glyphicon glyphicon-time"></span> 
			   </div>
			   <input id="distance" name="distance" class="form-control" value="0" disabled />
			  </div>
			 </div>
        </div>

  </div>

    </div>
      </form>


<fieldset><legend>Found rides</legend>
<div id="foundRides"></div>
</fieldset>
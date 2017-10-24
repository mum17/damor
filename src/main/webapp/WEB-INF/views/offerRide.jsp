<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<legend>Offer ride</legend>
	<form>
	<div class="container" style="padding:30px">
      <div id="row">
		
        <div class="col-md-8">
          <div class="panel panel-default">
          <div class="panel-heading">Pick-up and Drop-off points</div>
          <div class="panel-body">
          	<div>
                  <h6>Pick Up Point</h6>
                  <input id="origin-input" style="width: 650px;" class="controls" placeholder="Example : Fairfield, Iowa" name="pickupPoint" size=100 value="2701 W Burlington Ave, Fairfield, IA 52556, USA" />
            </div>
            
            <br>
			<div>
                  <h6>Drop off Point</h6>
                  <input id="destination-input" style="width: 650px;" class="controls" placeholder="Example : Des Moines, Iowa" name="dropoffPoint" size=100 value="Ottumwa, IA 52501, USA" />
            </div>
            
            <br>
			<div>
                  <h6>Departure at</h6>
                  <input name="departureAt" value="10/22/2017 10:30"/>
            </div>
            <br>
			<div>
                  <h6>Arrival at</h6>
                  <input name="arrivalAt" value="10/26/2017 14:35"/>
            </div>
            <br>
			<div>
                  <h6>Note</h6>
                  <input name="note" value="hello note"/>
            </div>
			<br>
			<div>
                  <h6>Luggage size:</h6>
                  <label><input type="radio" name="luggageSize" value="S" checked/> Small</label>
					<label><input type="radio" name="luggageSize" value="M"/> Medium</label>
					<label><input type="radio" name="luggageSize" value="F"/> Large</label>
            </div>
			<br>
			<div>
                  <h6>Pickup flexibility</h6>
                  <input name="pickupFlexibilityInMinutes" value="30"/> (in minutes)
            </div>
            <br>
			<div>
                  <h6>Price per seats</h6>
                  <input name="pricePerSeat" value="10"/>
            </div>
            <br>
			<div>
                  <h6>Max number of seats</h6>
                  <input name="maxNumberOfSeats" value="3"/>
            </div>
			
            <br>
			<div>
                  <input type="button" value="Offer ride" onclick="api.offerRide(this.form)" />
					<a href="<spring:url value="/myRides"/>">My rides</a>
            </div>
            
            <div id="mode-selector" class="controls" hidden="true">
      <input type="radio" name="type" id="changemode-walking" checked="checked">
      <label for="changemode-walking">Walking</label>

      <input type="radio" name="type" id="changemode-transit">
      <label for="changemode-transit">Transit</label>

      <input type="radio" name="type" id="changemode-driving" >
      <label for="changemode-driving">Driving</label>
    </div>
    <br>
            
            </div>
            
        </div>
        
      </div>
		<div class="col-md-4" >
          <div id="map"  style="width: 400px; height: 400px;"></div>
          <br>
            <div>
                  <h6>Pick Up Latitude</h6>
                  <input id="pickupLat" name="pickupLat" value="0" />
            </div>
            <br>
			<div>
                  <h6>Pick Up Longitude</h6>
                  <input name="pickupLng" value="0" />
            </div>
            <br>
			<div>
                  <h6>Drop-off Latitude</h6>
                  <input name="dropoffLat" value="0" />
            </div>
            <br>
			<div>
                  <h6>Drop-off Longitude</h6>
                  <input name="dropoffLng" value="0" />
            </div>
            <br>
			<div>
                  <h6>Distance</h6>
                  <input name="distanceInMile" value="0"/>(in miles)
            </div>
        </div>

  </div>

    </div>
      </form>
	
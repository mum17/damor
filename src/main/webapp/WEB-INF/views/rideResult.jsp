<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<table border=1 cellspacing=0>
<tr><th rowspan=2>ID<th colspan=5>Pickup<th colspan=4>Drop off<th colspan=6>&nbsp;<th rowspan=2>&nbsp;
<tr><th>Point<th>Latitude<th>Longitude<th>Time<th>Flexibility<th>Point<th>Latitude<th>Longitude<th>Time
<th>Note<th>Luggage<th>Status<th>Price<th>Distance<th>Seats
<c:forEach items="${rides}" var="r">
<tr><td>${r.id}
<td>${r.pickupPoint}<td>${r.pickupLat}<td>${r.pickupLng}<td>${r.departureAt}<td>${r.pickupFlexibilityInMinutes}
<td>${r.dropoffPoint}<td>${r.dropoffLat}<td>${r.dropoffLng}<td>${r.arrivalAt}
<td>${r.note}<td>${r.luggageSize}<td>${r.status}<td>${r.pricePerSeat}<td>${r.distanceInMile}<td>${r.maxNumberOfSeats}
<td><input type="button" value="Book seat" onclick="api.bookSeat(${r.id}, 1)" />
</c:forEach>
</table>
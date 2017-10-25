<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<c:set var="title"><tiles:getAsString name="title" /></c:set>			
<title><spring:message code="${title}"/> - Damor</title>
<link href="<spring:url value="/resources/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet">
<style>
body { padding-top: 70px; }
/* Rounded avatars */
.avatar {
  object-fit: cover;
  border-radius:30%;
  width: 28px;
  height: 28px;
  -webkit-box-shadow: 0 0 0 2px #fff, 0 0 0 3px #999, 0 2px 5px 4px rgba(0,0,0,.2);
  -moz-box-shadow: 0 0 0 2px #fff, 0 0 0 3px #999, 0 2px 5px 4px rgba(0,0,0,.2);
  box-shadow: 0 0 0 2px #fff, 0 0 0 3px #999, 0 2px 5px 4px rgba(0,0,0,.2);
  position: relative;
  top: -5px;
  float: left;
  left: -5px;
}
.profile-image  {
	padding-top: 0px;
	padding-bottom: 0px;
}
</style>
<script type="text/javascript">
	var contextPath = '<spring:url value="/"/>';
</script>
<script type="text/javascript" src="<spring:url value="/resources/jquery-3.2.1.min.js"/>"></script>
<script type="text/javascript" src="<spring:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
<script type="text/javascript" src="<spring:url value="/resources/app.js"/>"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC--CCm_LCH5EjljCkZuMIlCvKHQCU85jc&libraries=places&callback=initMap"
        async defer></script>
<script type="text/javascript" src="<spring:url value="/resources/gmaps.js"/>"></script>
</head>

<body>
<tiles:insertAttribute name="header" />
<tiles:insertAttribute name="jumbotron" />
<div class="container">
<tiles:insertAttribute name="body" />
<tiles:insertAttribute name="footer" />
</div>
</body>
</html>

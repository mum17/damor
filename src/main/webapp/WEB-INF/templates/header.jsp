<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="<spring:url value="/"/>">Damor</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <security:authorize access="isAnonymous()">
      <form class="navbar-form navbar-right">
        <div class="form-group">
          <input name="email" type="text" placeholder="Email" class="form-control">
        </div>
        <div class="form-group">
          <input name="password" type="password" placeholder="Password" class="form-control">
        </div>
        <button type="button" class="btn btn-success" onclick="api.login(this.form)">Sign in</button>
        <a class="btn btn-info" href="<spring:url value="/signup"/>">Sign up</a>
      </form>
      </security:authorize>
      <security:authorize access="isAuthenticated()">
	      <ul class="nav navbar-nav navbar-right">
		<li><a href="<spring:url value="/offerRide" />">Offer ride</a></li>
		<li><a href="<spring:url value="/findRide" />">Find ride</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle profile-image" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
          <img class="avatar" src="<spring:url value="/photos/${user.id}.png"/>" 
          onerror="if (this.src != '<spring:url value="/resources/no_avatar.png"/>') this.src = '<spring:url value="/resources/no_avatar.png"/>';"/>
          ${user.getName()} 
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<spring:url value="/myBookings"/>">My bookings</a></li>
            <li><a href="<spring:url value="/myRides"/>">My rides</a></li>
            <security:authorize access="hasAuthority('ADMIN')">
            <li><a href="<spring:url value="/users"/>">Users</a></li>
            </security:authorize>
            <li role="separator" class="divider"></li>
            <li><a href="<spring:url value="/doLogout"/>">Sign out</a></li>
          </ul>
        </li>
      </ul>
	  </security:authorize>
    </div><!--/.navbar-collapse -->
  </div>
</nav>

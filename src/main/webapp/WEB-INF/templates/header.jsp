<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<security:authorize access="isAnonymous()">
	<a href="<spring:url value="/signup" />">Sign up</a>
	<a href="<spring:url value="/login" />">Login</a>
</security:authorize>
<security:authorize access="isAuthenticated()">
	${user.getName()}
	<a href="<spring:url value="/doLogout"/>">Logout</a>
</security:authorize>
<a href="<spring:url value="/offerRide" />">Offer ride</a>
<a href="<spring:url value="/findRide" />">Find ride</a>
<hr/>
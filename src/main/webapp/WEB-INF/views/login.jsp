<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<fieldset><legend>Login</legend>
<form action="<spring:url value="/postLogin"></spring:url>" method="post">
<%= (String) request.getSession().getAttribute("SPRING_SECURITY_LAST_USERNAME") %>
<table>
	<tr><td>Email<td><input name="email" value="jsmith@gmail.com" />
	<tr><td>Password<td><input name="password" value="1234"/>
	<tr><td><td><input type="button" value="Login" onclick="api.login(this.form)" >
</table>
</form>
</fieldset>
 	

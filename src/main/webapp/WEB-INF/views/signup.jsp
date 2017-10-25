<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<div class="page-header">
  <h1>Sign up</small></h1>
</div>

<form:form modelAttribute="user" class="form-horizontal" enctype="multipart/form-data">
 <div class="form-group">
    <label class="col-sm-2 control-label">First name</label>
    <div class="col-sm-4">
      <form:input path="firstName" class="form-control"/>
      <div class="help-block"><form:errors path="firstName" class="text-danger"/></div>
    </div>
  </div>

  <div class="form-group">
    <label class="col-sm-2 control-label">Last name</label>
    <div class="col-sm-4">
      <form:input path="lastName" class="form-control"/>
      <div class="help-block"><form:errors path="lastName" class="text-danger"/></div>
    </div>
  </div>
  
  <div class="form-group">
    <label class="col-sm-2 control-label">Email</label>
    <div class="col-sm-4">
      <form:input path="email" class="form-control"/>
      <div class="help-block"><form:errors path="email" class="text-danger"/></div>
    </div>
  </div>
  
   <div class="form-group">
    <label class="col-sm-2 control-label">Password</label>
    <div class="col-sm-4">
      <form:password path="password" class="form-control"/>
    </div>
  </div>
  
  <div class="form-group">
    <label class="col-sm-2 control-label">Birth date</label>
    <div class="col-sm-4">
      <form:input path="birthdate" class="form-control"/>
      <div class="help-block"><form:errors path="birthdate" class="text-danger"/></div>
    </div>
  </div>

  <div class="form-group">
    <label class="col-sm-2 control-label">Gender</label>
    <div class="col-sm-4">
   	<label class="radio-inline"><form:radiobutton path="gender" value="M"/> Males</label>
	<label class="radio-inline"><form:radiobutton path="gender" value="F"/> Females</label>
	</div>
   </div>
   
  <div class="form-group">
    <label class="col-sm-2 control-label">Select photo</label>
    <div class="col-sm-4">
	   <form:input path="photo" type="file" />
    </div>
  </div>

   <div class="col-sm-3 control-label">
	<button type="submit" value="Sign up" class="btn btn-primary">Sign up</button>
   </div>


</form:form>            
  
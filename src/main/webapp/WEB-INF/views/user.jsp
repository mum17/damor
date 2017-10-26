<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<div class="page-header">
  <h1>Edit user</h1>
</div>

<form:form modelAttribute="theUser" class="form-horizontal" enctype="multipart/form-data">
<form:hidden path="id" />
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
    <label class="col-sm-2 control-label">Authority</label>
    <div class="col-sm-4"><div class="checkbox">
   	<label class="radio-inline"><form:checkbox path="authority" value="ADMIN"/> Administrator</label>
	</div></div>
  </div>
   
  <div class="form-group">
    <label class="col-sm-2 control-label">Select photo</label>
    <div class="col-sm-4">
 	   <form:input path="photo" type="file" />
    </div>
  </div>

  <div class="form-group">
    <div class="col-sm-5">
       <div style="margin: 0 auto; width: 60px;text-align:left"><img class="avatar" style="width:60px;height:60px;" 
			src="<spring:url value="/photos/${theUser.id}.png"/>" 
          onerror="if (this.src != '<spring:url value="/resources/no_avatar.png"/>') this.src = '<spring:url value="/resources/no_avatar.png"/>';"/></div>
    </div>
  </div>

   <div class="col-sm-4 control-label">
	<input type="submit" value="Save" class="btn btn-primary" />
	<a href="<spring:url value="/users" />" class="btn">Close</a>
   </div>


</form:form>            
  
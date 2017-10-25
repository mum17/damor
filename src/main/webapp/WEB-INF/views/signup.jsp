<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<div class="page-header">
  <h1>Sign up</small></h1>
</div>

<form:form modelAttribute="user" class="form-horizontal">

 <div class="form-group">
    <label class="col-sm-2 control-label">First name</label>
    <div class="col-sm-4">
      <form:input path="firstName" class="form-control" value="John"/>
    </div>
  </div>

  <div class="form-group">
    <label  class="col-sm-2 control-label">Last name</label>
    <div class="col-sm-4">
      <form:input path="lastName" class="form-control" value="Smith"/>
    </div>
  </div>
  
  <div class="form-group">
    <label class="col-sm-2 control-label">Email</label>
    <div class="col-sm-4">
      <form:input path="email" class="form-control" value="jsmith@gmail.com"/>
    </div>
  </div>
  
   <div class="form-group">
    <label  class="col-sm-2 control-label">Password</label>
    <div class="col-sm-4">
      <form:password path="password" class="form-control"  value="1234"/>
    </div>
  </div>
  
  <div class="form-group">
    <label  class="col-sm-2 control-label">Gender</label>
    <div class="col-sm-4">
   	<label class="radio-inline"><form:radiobutton path="gender" value="M"/> Males</label>
	<label class="radio-inline"><form:radiobutton path="gender" value="F"/> Females</label>
	</div>
   </div>

   <div class="offset-sm-2 col-sm-2 control-label">
	<button type="button"  value="Sign up" onclick="api.signUp(this.form)"  class="btn btn-primary">Sign Up</button>
   </div>


</form:form>            
  
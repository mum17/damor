<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>


<div class="page-header">
  <h1>Sign up</small></h1>
</div>

<form class="form-horizontal">



 <div class="form-group">
    <label class="col-sm-2 control-label">First name</label>
    <div class="col-sm-10">
      <input type="text" name="firstName" class="form-control"   value="John"/>
    </div>
  </div>

  <div class="form-group">
    <label  class="col-sm-2 control-label">Last name</label>
    <div class="col-sm-10">
      <input type="text" name="lastName" class="form-control"   value="Smith"/>
    </div>
  </div>
  
  <div class="form-group">
    <label class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
      <input type="email" name="email" class="form-control"  value="jsmith@gmail.com">
    </div>
  </div>
  
   <div class="form-group">
    <label  class="col-sm-2 control-label">Password</label>
    <div class="col-sm-10">
      <input type="password" name="password" class="form-control"  value="1234">
    </div>
  </div>
  
  <div class="form-group">
    <label  class="col-sm-2 control-label">Gender</label>
  
   <label class="radio-inline">
  <input type="radio" name="gender"  value="M" checked> Male
</label>
<label class="radio-inline">
  <input type="radio" name="gender"  value="F"> Female
</label>
   </div>

      <div class="col-sm-2 control-label">


   <button type="button"  value="Sign up" onclick="api.signUp(this.form)"  class="btn btn-primary">Sign Up</button>
  </div>


</form>            
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>


<form class="form-horizontal">



 <div class="form-group">
    <label for="fname" class="col-sm-2 control-label">First name</label>
    <div class="col-sm-10">
      <input type="text" name="firstName" class="form-control" id="inputEmail3"  value="John"/>
    </div>
  </div>

  <div class="form-group">
    <label for="lname" class="col-sm-2 control-label">Last name</label>
    <div class="col-sm-10">
      <input type="text" name="lastName" class="form-control" id="inputEmail3"  value="Smith"/>
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" id="inputEmail3" value="jsmith@gmail.com">
    </div>
  </div>
  
   <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="inputPassword3" value="1234">
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">Gender</label>
  
   <label class="radio-inline">
  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="M"> Male
</label>
<label class="radio-inline">
  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="F"> Female
</label>
   </div>

      <div class="col-sm-2 control-label">


   <button type="button"  value="Sign up" onclick="api.signUp(this.form)"  class="btn btn-primary">Sign Up</button>
  </div>


</form>    
        
        
     
   

   
   

 


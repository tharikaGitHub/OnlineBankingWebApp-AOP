<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	 <head>
	 <title>Lanka Bank</title>
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" type="text/css" />
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom.css" type="text/css" />
	 <script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<body>
	<div class="middlePage">
		<div class="page-header">
		  <h1 class="logo">Lanka Bank <small>Welcome to our online banking portal!</small></h1>
		</div>
		
		<div class="panel panel-info">
		  <div class="panel-heading">
		    <h3 class="panel-title">Please Sign In</h3>
		  </div>
		  <div class="panel-body">
		  	<div class="row">
				<div class="col-md-5" >
				<br/>
				<img src="<%=request.getContextPath()%>/resources/img/banner-online.jpg" class="img-thumbnail" width="304" height="236"/>
				<br/>
				<hr/>
				<p>Are you new to our Banking Portal? Then you can register yourself <a href="registerForm">here</a>.</p>
				</div>
			    <div class="col-md-7" style="border-left:1px solid #ccc;height:160px">
					<form class="form-horizontal" action="login" method="post">
						<fieldset>
						  <input id="userName" name="userName" type="text" placeholder="Enter User Name" class="form-control input-md">
						  <br>
						  <input id="pass" name="password" type="password" placeholder="Enter Password" class="form-control input-md">
						  <br/>
						  <c:if test="${error != null}">
   							<small><font color="red">
    							Your UserName or Password is incorrect. Please try again.
   							</font></small>
						  </c:if>
						  <c:if test="${regSuccess != null}">
   							<small><font color="green">
    							Registration successful. Now you can sign in.
   							</font></small>
						  </c:if>
						  <hr>
						  <button id="login" name="login" class="btn btn-info btn-sm pull-right">Sign In</button>
						</fieldset>
					</form>
				</div>
			</div>    
		   </div>
		</div>
	</div>
</body>
</html>
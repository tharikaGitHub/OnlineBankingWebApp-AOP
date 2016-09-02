<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	 <head>
	 <title>Lanka Bank</title>
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" type="text/css" />
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom.css" type="text/css" />
	 <script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	</head>
<body>
	<div class="middlePage">
    <h1 style="color:white;">Registration Form</h1>
		<div class="col-lg-12 well">
			<div class="row">
					<form action="register" method="post">
						<div class="col-sm-12">
							<div class="row">
								<c:if test="${regError != null}">
	   							<p align="center"><small><font color="red">
	    							Registration Unsuccessful. The user name provided already exists. Try another user name.
	   							</font></small></p>
							  	</c:if>
								<div class="col-sm-12 form-group">
									<label>Full Name</label>
									<input type="text" placeholder="Enter your full name here.." class="form-control" name="fullName">
								</div>
								<div class="col-sm-6 form-group">
									<label>Email Address</label>
									<input type="email" placeholder="Enter your email address here.." class="form-control" name="email">
								</div>
								<div class="col-sm-6 form-group">
									<label>User Name</label>
									<input type="text" placeholder="Enter your user name here.." class="form-control" name="userName"> <!-- Check uniqueness -->
								</div>
								<div class="col-sm-6 form-group">
									<label>Password</label>
									<input type="password" placeholder="Enter password here.." class="form-control" name="password">
								</div>	
								<div class="col-sm-6 form-group">
									<label>NIC</label>
									<input type="text" placeholder="Enter NIC number here.." class="form-control" name="nic">
								</div>	
								<div class="col-sm-6 form-group">
									<label>Address</label>
									<textarea placeholder="Enter your address here.." rows="3" class="form-control" name="address"></textarea>
								</div>
							</div>					
						<button type="submit" class="btn btn-md btn-primary">Submit</button>
						<a href="loginForm"><button type="button" class="btn btn-md btn-primary pull-right">Cancel</button></a>					
						</div>
					</form> 
				</div>
		</div>
	</div>
</body>
</html>
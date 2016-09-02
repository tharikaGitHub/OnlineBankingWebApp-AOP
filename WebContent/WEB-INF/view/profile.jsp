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
    <h1 style="color:white;">Edit My Profile</h1>
		<div class="col-lg-12 well">
			<div class="row">
					<form action="editProfile" method="post">
						<div class="col-sm-12">
							<div class="row">
								<c:if test="${editSuccess != null}">
		   							<p align="center"><small><font color="green">
		    							Your profile was edited successfully.
		   							</font></small></p>
							  	</c:if>
								<div class="col-sm-12 form-group">
									<label>Full Name</label>
									<input type="text" value="${theUser.fullName}" placeholder="Enter your full name here.." class="form-control" name="fullName">
								</div>
								<div class="col-sm-6 form-group">
									<label>Email Address</label>
									<input type="email" value="${theUser.email}" placeholder="Enter your email address here.." class="form-control" name="email">
								</div>
								<!-- div class="col-sm-6 form-group"-->
									<input type="hidden" value="${theUser.userName}" placeholder="Enter your user name here.." class="form-control" name="userName">
								<!-- /div-->
								<div class="col-sm-6 form-group">
									<label>Password</label>
									<input type="password" value="${theUser.password}" placeholder="Enter password here.." class="form-control" name="password">
								</div>	
								<div class="col-sm-6 form-group">
									<label>NIC</label>
									<input type="text" value="${theUser.nic}" placeholder="Enter NIC number here.." class="form-control" name="nic">
								</div>	
								<div class="col-sm-6 form-group">
									<label>Address</label>
									<textarea placeholder="Enter your address here.." rows="3" class="form-control" name="address">${theUser.address}</textarea>
								</div>
							</div>					
						<button type="submit" class="btn btn-md btn-primary">Submit</button>
						<a href="home"><button type="button" class="btn btn-md btn-primary pull-right">Cancel</button></a>					
						</div>
					</form> 
				</div>
		</div>
	</div>
</body>
</html>
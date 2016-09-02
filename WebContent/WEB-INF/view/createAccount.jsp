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
    <h1 style="color:white;">Create Account</h1>
		<div class="col-lg-12 well">
			<div class="row">
					<form action="createAccount" method="post">
						<div class="col-sm-12">
							<div class="row">
								<c:if test="${accSuccess != null}">
		   							<p align="center"><small><font color="green">
		    							Account creation was successful. Your account number is <c:out value="${accNumber}"></c:out> 
		   							</font></small></p>
							  	</c:if>
							  	<c:if test="${accError != null}">
		   							<p align="center"><small><font color="red">
		    							Account creation was unsuccessful. Please try again.
		   							</font></small></p>
							  	</c:if>
							  	<c:if test="${permissionDenied == true}">
		   							<p align="center"><small><font color="red">
		    							Your NIC number is invalid.
		   							</font></small></p>
							  	</c:if>
								<div class="col-sm-12 form-group">
									<label>Account Holders Name</label>
									<input type="text" placeholder="Enter your full name here.." class="form-control" name="accHolderName">
								</div>
								<div class="col-sm-12 form-group">
									<label>NIC number</label>
									<input type="text" placeholder="Enter your NIC number here.." class="form-control" name="nicNumber">
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
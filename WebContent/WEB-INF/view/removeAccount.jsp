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
    <h1 style="color:white;">Remove Account</h1>
		<div class="col-lg-12 well">
			<div class="row">
					<form action="removeAccount" method="post">
						<div class="col-sm-12">
							<div class="row">
								<c:if test="${delSuccess != null}">
		   							<p align="center"><small><font color="green">
		    							The account was successfully removed. 
		   							</font></small></p>
							  	</c:if>
							  	<c:if test="${delError != null}">
		   							<p align="center"><small><font color="red">
		    							Account removal was unsuccessful. Please try again.
		   							</font></small></p>
							  	</c:if>
							  	<c:if test="${permissionDeniedForDelete != null}">
		   							<p align="center"><small><font color="red">
		    							Permission Denied.
		   							</font></small></p>
							  	</c:if>
								<div class="col-sm-12 form-group">
									<label>Account Number</label>
									<input type="text" placeholder="Enter account number here.." class="form-control" name="accNumber">
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
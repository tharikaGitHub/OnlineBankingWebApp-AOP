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
    <h1 style="color:white;">Deposit</h1>
		<div class="col-lg-12 well">
			<div class="row">
					<form action="creditAccount" method="post">
						<div class="col-sm-12">
							<div class="row">
								<c:if test="${creditSuccess != null}">
		   							<p align="center"><small><font color="green">
		    							Your account was successfully credited. 
		   							</font></small></p>
							  	</c:if>
							  	<c:if test="${creditError != null}">
		   							<p align="center"><small><font color="red">
		    							Account crediting was unsuccessful. Please try again.
		   							</font></small></p>
							  	</c:if>
							  	<c:if test="${creditDenied != null}">
		   							<p align="center"><small><font color="red">
		    							You don't have permission to deposit money in this account.
		   							</font></small></p>
							  	</c:if>
							  	<c:if test="${nullObject != null}">
		   							<p align="center"><small><font color="red">
		    							The account number is invalid.
		   							</font></small></p>
							  	</c:if>
								<div class="col-sm-12 form-group">
									<label>Account Number</label>
									<input type="text" placeholder="Enter the account number here.." class="form-control" name="accNumber">
								</div>
								<div class="col-sm-12 form-group">
									<label>Amount to credit in LKR</label>
									<input type="number" placeholder="Enter the amount you need to deposit to your account.." class="form-control" name="amount">
								</div>
							</div>					
						<button type="submit" class="btn btn-md btn-primary">Credit</button>
						<a href="home"><button type="button" class="btn btn-md btn-primary pull-right">Cancel</button></a>					
						</div>
					</form> 
				</div>
		</div>
	</div>
</body>
</html>
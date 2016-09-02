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
    <h1 style="color:white;">Transfer Money</h1>
		<div class="col-lg-12 well">
			<div class="row">
					<form action="moneyTransfer" method="post">
						<div class="col-sm-12">
							<div class="row">
								<c:if test="${trSuccess != null}">
		   							<p align="center"><small><font color="green">
		    							The money transfer was successful. 
		   							</font></small></p>
							  	</c:if>
							  	<c:if test="${trError != null}">
		   							<p align="center"><small><font color="red">
		    							Money transfer was unsuccessful. Please try again.
		   							</font></small></p>
							  	</c:if>
								<div class="col-sm-12 form-group">
									<label>Transfer From</label>
									<input type="text" placeholder="Enter account number here.." class="form-control" name="accNumber1">
								</div>
								<div class="col-sm-12 form-group">
									<label>Transfer To</label>
									<input type="text" placeholder="Enter account number here.." class="form-control" name="accNumber2">
								</div>
								<div class="col-sm-12 form-group">
									<label>Amount to transfer in LKR</label>
									<input type="number" placeholder="Enter the amount you need to transfer.." class="form-control" name="amount">
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
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
    <h1 style="color:white;">Account Details</h1>
		<div class="col-lg-12 well">
			<div class="row">
				<table class="table table-striped">
				    <thead>
					    <tr>
						    <th></th>
						    <th></th>
					    </tr>
				    </thead>
				    <tbody>
				      <tr>
				        <td><b>Account Number</b></td>
				        <td>${accNumber}</td>
				      </tr>
				      <tr>
				        <td><b>Account Holder's Name</b></td>
				        <td>${accHolderName}</td>
				      </tr>
				      <tr>
				        <td><b>NIC Number</b></td>
				        <td>${nicNumber}</td>
				      </tr>
				      <tr>
				        <td><b>Account Balance</b></td>
				        <td>${accBalance}</td>
				      </tr>
				    </tbody>
				  </table>
			</div>					
		<a href="home"><button type="button" class="btn btn-md btn-primary pull-right">OK</button></a>					 
		</div>
	</div>
</body>
</html>
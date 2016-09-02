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
    <h1 style="color:white;">Account Transaction History</h1>
		<div class="col-lg-12 well">
			<div class="row">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Transaction Made By</th>
							<th>Transaction Type</th>
							<th>Transaction Details</th>
							<th>Date of Transaction</th>
							<th>Time of Transaction</th>
						</tr>
					</thead>
				    <tbody>
				      <c:forEach items="${history}" var="transaction">
					    <tr>
					        <td><c:out value="${transaction.user}"/></td>
					        <td><c:out value="${transaction.transactionType}"/></td> 
					        <td><c:out value="${transaction.transactionDetails}"/></td>  
					        <td><c:out value="${transaction.dateOfTransaction}"/></td>
					        <td><c:out value="${transaction.timeOfTransaction}"/></td> 
					    </tr>
					  </c:forEach>
				    </tbody>
				  </table>
			</div>					
		<a href="home"><button type="button" class="btn btn-md btn-primary pull-right">OK</button></a>					 
		</div>
	</div>
</body>
</html>
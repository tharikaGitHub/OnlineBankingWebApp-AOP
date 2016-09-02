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
    <h1 style="color:white;">Contact us</h1>
		<div class="col-lg-12 well">
			<div class="row">
					<form action="contactSubmit" method="post">
						<div class="col-sm-12">
							<div class="row">
								<c:if test="${successSubmit != null}">
		   							<p align="center"><small><font color="green">
		    							Your message is successfully sent. We will reply to you soon.
		   							</font></small></p>
							  	</c:if>
								<div class="col-sm-12 form-group">
									<label>Your Email</label>
									<input type="email" placeholder="Enter your email address here.." class="form-control" name="email">
								</div>
								<div class="col-sm-12 form-group">
									<label>Subject</label>
									<input type="text" placeholder="Enter the subject of your message.." class="form-control" name="subject">
								</div>	
								<div class="col-sm-12 form-group">
									<label>Message</label>
									<textarea placeholder="Enter your message here.." rows="6" class="form-control" name="message"></textarea>
								</div>
							</div>					
						<button type="submit" class="btn btn-md btn-primary">Send</button>	
						<a href="home"><button type="button" class="btn btn-md btn-primary pull-right">Cancel</button></a>			
						</div>
					</form> 
				</div>
		</div>
	</div>
</body>
</html>
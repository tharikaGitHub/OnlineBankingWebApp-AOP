<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	 <head>
	 <title>Lanka Bank</title>
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	 <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" type="text/css" />
	 <!-- script src="<%=request.getContextPath()%>/resources/js/jquery.min.js" type="text/javascript"></script-->
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	 <script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	 
<body>
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">Lanka Bank</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li class="active"><a href="home">Home</a></li>
      	  <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Account actions <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="createAccountForm">Create Account</a></li>
              <li><a href="removeAccountForm">Remove Account</a></li>
              <li><a href="creditAccountForm">Deposit</a></li>
              <li><a href="debitAccountForm">Withdraw</a></li>
            </ul>
          </li>
	    </ul>
	    <ul class="nav navbar-nav navbar-right">
         <li class="dropdown">
           <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">< c:out value='${user}' /><span class="caret"></span></a>
           <ul class="dropdown-menu">
             <li><a href="profile">Edit Profile</a></li>
             <li><a href="loginForm">Logout</a></li>
           </ul>
         </li> 
        </ul>
	  </div>
	</nav>
	  
	<div class="container">
        <div class="row">
            <div class="col-md-6">
                <img class="img-responsive img-rounded" src="<%=request.getContextPath()%>/resources/img/bankMain.jpg" alt="" width="500" height="250">
            </div>
            <div class="col-md-6">
                <h1>Lanka Bank Online Banking Portal</h1>
                <br/>
                <hr/>
                <h4 align="center">All your financial needs fulfilled at the click of a button.</h4>
                <h4 align="center">We are the bank of your heart</h4>
            </div>
        </div>

        <hr>

        <div class="row">
            <div class="col-lg-12">
                <div class="well text-center">
                    <a href="contact">Contact us.</a> We are here to help you in your financial matters. Banking Made easy.
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4">
                <h2>Money Transfer</h2>
                <p>Transfer Money between accounts. It is secure and fast.</p>
                <a class="btn btn-primary" href="moneyTransferAccountForm">Money Transfer</a>
            </div>
            <div class="col-md-4">
                <h2>Account Inquiry</h2>
                <p>Check account balance and other details of your accounts.</p>
                <a class="btn btn-primary" href="inquiryForm">Account Inquiry</a>
            </div>
            <div class="col-md-4">
                <h2>Account History Inquiry</h2>
                <p>Check the transaction history of your accounts.</p>
                <a class="btn btn-primary" href="getTransHistoryForm">Account History Inquiry</a>
            </div>
        </div>
        <br/>
        <hr/>
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Lanka Bank Online Banking Portal 2016</p>
                </div>
            </div>
        </footer>
    </div>
</body>
</html>
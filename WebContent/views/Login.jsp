<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login</title>
<!-- <link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css"> -->

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/Login.css">

</head>
<body>
	<div class="background">
	    <img src="img/STOCKtrade1.png" width="200" height="175" alt="logo">
	</div>
	<div class="cicle-1"></div>
	<div class="cicle-2"></div>
	<div class="page">
		<div class="container">
			<div class="left">
				<div class="login">Login</div>
				<div class="eula">By logging in you agree to the ridiculously long terms that you didn't bother to read</div>
			</div>
			<div class="right">
				<form action="Login" method="post" class="form-login" id="form-login"
								name="form"
								onsubmit="return validate();email_Verify();password_Verify()">
						<div class="form-group">
							<input class="form-control" placeholder="User ID" name="userId"
								id="userId" type="text" maxlength="50" autocomplete="off">
							<div id="email_error">Please fill you email</div>
							<div id="email_error1">Email requires 10 characters</div>
						</div>
						<div class="form-group">
							<input class="form-control" placeholder="Password"
								autocomplete="off" id="password" name="password"
								type="password" value="" maxlength="50">
							<div id="password_error">Please fill you password</div>
							<div id="password_error1">Password requires 6 characters</div>
						</div>
            			<hr>
						<button onclick="validate();email_Verify();password_Verify()"
							class="btn btn-lg btn-success btn-block" type="submit"
							id="twofuns">Login</button>
					<a href="Register" type="link">Create your account</a>
				</form>
			</div>
			
		</div>
		
	</div>
		<script language="javascript"
		src="<%=request.getContextPath()%>/js/Login.js"></script>

</body>
</html>
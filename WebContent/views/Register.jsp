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
	href="<%=request.getContextPath()%>/css/Register.css">

</head>

</head>
<body>
	<div class="background">
		<img src="<%=request.getContextPath()%>/img/STOCKtrade1.png"
			width="150px" height="150px" alt="logo">
	</div>
	<div class="cicle-1"></div>
	<div class="cicle-2"></div>
	<div class="page">
		<div class="container">
			<div class="left">
				<div class="login">Register</div>
				<div class="eula">By registering you can get a personal account</div>
			</div>
			<div class="right">
				<form action="Register" method="post" class="form-login"
					id="form-login" name="form"
					onsubmit="return validate();email_Verify();password_Verify()">
					<div class="form-group">
						<input class="form-control" placeholder="User ID" name="userId"
							id="userId" type="text" maxlength="50" autocomplete="off">
						<div id="userId_error" class="error"></div>
						<div id="userId_error1" class="error"></div>
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="Password"
							autocomplete="off" id="password" name="password" type="password"
							value="" maxlength="50">
						<div id="password_error" class="error"></div>
						<div id="password_error1" class="error"></div>
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="Confirm Password"
							autocomplete="off" id="confirmPassword" name="confirmPassword"
							type="password" value="" maxlength="50">
						<div id="rePassword_error" class="error"></div>
						<div id="rePassword_error1" class="error"></div>
						<div id="match" class="error"></div>
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="User Name"
							name="userName" id="userName" type="text" maxlength="50"
							autocomplete="off">
						<div id="name_error" class="error"></div>
						<div id="name_error1" class="error"></div>
					</div>
					<hr>
					<button
						onclick="validate();userId_validate();password_validate();rePassword_validate();userName_validate()"
						class="btn btn-lg btn-success btn-block" type="submit"
						id="twofuns">Register</button>
					<a href="Login" type="link">Return Login</a>
				</form>
			</div>
		</div>
	</div>

	<script language="javascript"
		src="<%=request.getContextPath()%>/js/Register.js"></script>

</body>
</html>
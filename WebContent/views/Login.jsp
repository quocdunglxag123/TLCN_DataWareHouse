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
		<img src="<%=request.getContextPath()%>/img/STOCKtrade1.png" width="150px" height="150px"  alt="logo">
	</div>
	<div class="cicle-1"></div>
	<div class="cicle-2"></div>
	<div class="page">
		<div class="container">
			<div class="left">
				<div class="login">Login</div>
				<div class="eula">By logging in, you can monitor and manage data.</div>
			</div>
			<div class="right">
				<form action="Login" method="post" class="form-login" id="form-login"
								name="form"
								onsubmit="return validate()">
						<div class="error">${errorLogin}</div>
						<div class="form-group">
							<input class="form-control" placeholder="User ID" name="userId"
								id="userId" type="text" maxlength="50" autocomplete="off" required>
							<div id="userId_error" class="error"></div>
							<div id="userId_error1" class="error"></div>
						</div>
						<div class="form-group">
							<input class="form-control" placeholder="Password"
								autocomplete="off" id="password"  name="password"
								type="password" value="" maxlength="50" >
							<div id="password_error" class="error"></div>
							<div id="password_error1" class="error"></div>
						</div>
            			<hr>
						<button onclick="validate();userId_validate();password_validate()"
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
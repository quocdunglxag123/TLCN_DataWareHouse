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
            <p style="margin: 0; padding: 0; color: red">${message}</p>
            <div class="form" action="Login" method="post" id="form-login"
							name="form"
							onsubmit="return validate();email_Verify();password_Verify()">
              <input type="text" id="user" placeholder="User ID">
              <input type="password" id="password" placeholder="Passwork">
              <button type="submit" id="submit" value="Submit">Submit</button>
              <p><a href="register.html">Create your account</a></p>
            </div>
          </div>
        </div>
    </div>      
	<script language="javascript"
		src="<%=request.getContextPath()%>/js/Login.js"></script>

</body>
</html>
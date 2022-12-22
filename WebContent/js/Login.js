/*var password = document.forms['form']['password'];

var userId_error = document.getElementById('userId_error');
var password_error = document.getElementById('password_error');
var userId_error1 = document.getElementById('userId_error1');
var password_error1 = document.getElementById('password_error1');
userId.addEventListener('textInput', userId_Verify);
password.addEventListener('textInput', password_Verify);

function validate() {
	var userId = document.getElementById('userId').value;
	if (userId.value.length == ""|| userId.value == "null") {
		document.getElementById('userId').innerHTML = "Please fill your User ID";
		userId_error.style.display = "block";
		userId_error1.style.display = "none";
		userId.focus();
		return false;
	} else if (userId.value.length < 3) {
		document.getElementById('userId').style.border = "User ID requires 3 characters";
		userId_error.style.display = "none";
		userId_error1.style.display = "block";
		userId.focus();
		return false;
	}
	if (password.value.length == "" || password.value == "null") {
		document.getElementById('password').style.border = "2px solid red";
		password_error.style.display = "block";
		password_error1.style.display = "none";
		password.focus();
		return false;
	} else if (password.value.length < 8) {
		document.getElementById('password').style.border = "2px solid red";
		password_error.style.display = "none";
		password_error1.style.display = "block";
		password.focus();
		return false;
	}
}

function userId_Verify() {
	if (userId.value.length >= 3) {
		document.getElementById('userId').style.border = "2px solid green";
		userId_error.style.display = "none";
		userId_error1.style.display = "none";
		return true;
	}
}
function password_Verify() {
	if (password.value.length >= 8) {
		document.getElementById('password').style.border = "2px solid green";
		password_error.style.display = "none";
		password_error1.style.display = "none";
		return true;
	}
}*/





var userId_error = document.getElementById('userId_error');
var userId_error1 = document.getElementById('userId_error1');

var password_error = document.getElementById('password_error');
var password_error1 = document.getElementById('password_error1');
userId.addEventListener('textInput', userId_validate);
password.addEventListener('textInput', password_validate);

function validate(){
	var emp = false;
	var userId = document.getElementById('userId').value;
	if (userId.length == 0|| userId == "null") {
		userId_error.innerHTML = "Please fill your User ID";
		userId_error.style.display = "block";
		userId_error1.style.display = "none";
		emp = true;
	} 
	else if (userId.length < 3) {
		userId_error1.innerHTML = "User ID requires 3 characters";
		userId_error.style.display = "none";
		userId_error1.style.display = "block";
		emp = true;
	}
	var password = document.getElementById('password').value;
	
	if (password.length == 0|| userId == "null") {
		password_error.innerHTML = "Please fill your password";
		password_error.style.display = "block";
		password_error1.style.display = "none";
		emp = true;
	} 
	else if (password.length < 6) {
		password_error1.innerHTML = "Password requires 6 characters";
		password_error.style.display = "none";
		password_error1.style.display = "block";
		emp = true;
	}
	return false;
	
}

function userId_validate() {
	var userId = document.getElementById('userId').value;
	if (userId.length >= 3) {
		userId_error.style.display = "none";
		userId_error1.style.display = "none";
		return true;
	} 
}
function password_validate() {
	var password = document.getElementById('password').value;
	if (password.length >= 6) {
		password_error.style.display = "none";
		password_error1.style.display = "none";
		return true;
	} 
}






























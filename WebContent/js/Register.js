
var userId_error = document.getElementById('userId_error');
var userId_error1 = document.getElementById('userId_error1');

var password_error = document.getElementById('password_error');
var password_error1 = document.getElementById('password_error1');

var rePassword_error = document.getElementById('rePassword_error');
var rePassword_error1 = document.getElementById('rePassword_error1');
var match = document.getElementById('match');

var name_error = document.getElementById('name_error');
var name_error1 = document.getElementById('name_error1');

userId.addEventListener('textInput', userId_validate);
password.addEventListener('textInput', password_validate);
confirmPassword.addEventListener('textInput', rePassword_validate);
//match.addEventListener('textInput', match_validate);
userName.addEventListener('textInput', userId_validate);

//kiểm tra các điều kiện sai
function validate() {
	var emp = false;
	var userId = document.getElementById('userId').value;
	if (userId.length == 0 || userId == "null") {
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

	if (password.length == 0 || password == "null") {
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
	//var rePassword = document.getElementById('rePassword').value;
	var confirmPassword = document.getElementById('confirmPassword').value;

	if (confirmPassword.length == 0 || confirmPassword == "null") {
		rePassword_error.innerHTML = "Please fill your password";
		rePassword_error.style.display = "block";
		rePassword_error1.style.display = "none";
		match.style.display = "none";
		emp = true;
	}
	else if (confirmPassword.length < 6) {
		rePassword_error1.innerHTML = "Password requires 6 characters";
		rePassword_error.style.display = "none";
		rePassword_error1.style.display = "block";
		match.style.display = "none";
		emp = true;
	}
	else if (password != confirmPassword) {
		match.innerHTML = "Don't match, please re-enter";
		rePassword_error.style.display = "none";
		rePassword_error1.style.display = "none";
		match.style.display = "block";
		emp = true;
	}

	var userName = document.getElementById('userName').value;
	if (userName.length == 0 || userName == "null") {
		name_error.innerHTML = "Please fill your User Name";
		name_error.style.display = "block";
		name_error1.style.display = "none";
		emp = true;
	}
	else if (userName.length < 6) {
		name_error1.innerHTML = "User Name requires 6 characters";
		name_error.style.display = "none";
		name_error1.style.display = "block";
		emp = true;
	}

	if(emp)
	{	
		return false;
	}

}

//xác nhận điều kiện userId hợp lệ
function userId_validate() {
	var userId = document.getElementById('userId').value;
	if (userId.length >= 3) {
		userId_error.style.display = "none";
		userId_error1.style.display = "none";
		return true;
	}
}

//xác nhận điều kiện password hợp lệ
function password_validate() {
	var password = document.getElementById('password').value;
	if (password.length >= 6) {
		password_error.style.display = "none";
		password_error1.style.display = "none";
		return true;
	}
}

//xác nhận điều kiện confirm password 
function rePassword_validate() {
	var confirmPassword = document.getElementById('confirmPassword').value;
	if (confirmPassword.length >= 6) {
		rePassword_error.style.display = "none";
		rePassword_error1.style.display = "none";
		match.style.display = "none";
		return true;
	}
}

//xác nhận userName hợp lệ
function userName_validate() {
	var userName = document.getElementById('userName').value;
	if (userName.length >= 6) {
		name_error.style.display = "none";
		name_error1.style.display = "none";
		return true;
	}
}





























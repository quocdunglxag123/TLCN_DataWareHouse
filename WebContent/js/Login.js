
var userId_error = document.getElementById('userId_error');
var userId_error1 = document.getElementById('userId_error1');

var password_error = document.getElementById('password_error');
var password_error1 = document.getElementById('password_error1');
userId.addEventListener('textInput', userId_validate);
password.addEventListener('textInput', password_validate);

//kiểm tra các điều kiện bị sai
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
	if(emp){
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






























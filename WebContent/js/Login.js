var email = document.forms['form']['email'];
		var password = document.forms['form']['password'];

		var email_error = document.getElementById('email_error');
		var password_error = document.getElementById('password_error');

		email.addEventListener('textInput', email_Verify);
		password.addEventListener('textInput', password_Verify);

		function validate() {
			if (email.value.length == "") {
				document.getElementById('email').style.border = "2px solid red";
				email_error.style.display = "block";
				email_error1.style.display = "none";
				email.focus();
				return false;
			} else if (email.value.length < 10) {
				document.getElementById('email').style.border = "2px solid red";
				email_error.style.display = "none";
				email_error1.style.display = "block";
				email.focus();
				return false;
			}
			if (password.value.length == "") {
				document.getElementById('password').style.border = "2px solid red";
				password_error.style.display = "block";
				password_error1.style.display = "none";
				password.focus();
				return false;
			} else if (password.value.length < 10) {
				document.getElementById('password').style.border = "2px solid red";
				password_error.style.display = "none";
				password_error1.style.display = "block";
				password.focus();
				return false;
			}
		}

		function email_Verify() {
			if (email.value.length >= 10) {
				document.getElementById('email').style.border = "2px solid green";
				email_error.style.display = "none";
				email_error1.style.display = "none";
				return true;
			}
		}
		function password_Verify() {
			if (password.value.length >= 6) {
				document.getElementById('password').style.border = "2px solid green";
				password_error.style.display = "none";
				password_error1.style.display = "none";
				return true;
			}
		}
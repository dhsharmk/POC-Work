//SIGNUP FORM
$(document).ready(function() {
	$("#password").keyup(validate);
	$("#cpassword").keyup(validate);
});

function validate() {
	var password1 = $("#password").val();
	var password2 = $("#cpassword").val();

	if (password1 == password2) {
		$("#match").text("Passwords match");
		$("#match").css("color", "green");
	} else {
		$("#match").text("Passwords do not match");
		$("#match").css("color", "red");
	}
}

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

$("#preview-btn")
		.click(
				function() {
					var str = $("#input-items").val();

					// Remove whitespaces from beginning and ending
					str = str.trim();

					// Change multiple spaces to single space between words
					str = str.replace("( )+", " ");

					// Convert string to Array
					var strArray = str.split(" ");

					// Clear passed string
					str = "";

					if (strArray.length % 5 == 0) {
						$("#error").empty();
						$("#preview-table").empty();
						$("#preview-table")
								.append(
										"<thead><th>Stuff</th><th>Quantity</th><th>Unit</th><th>Price</th></thead>");
						for (var i = 0; i < strArray.length - 2; i = i + 5) {
							str = "<tr><td>" + strArray[i] + "</td><td>"
									+ strArray[i + 1] + "</td><td>"
									+ strArray[i + 2] + "</td><td>Rs. "
									+ strArray[i + 3] + "</td></tr>";
							$("#preview-table").append(str);
							str = "";
						}
					} else {
						$("#preview-table").empty();
						$("#error").empty();
						$("#error")
								.append(
										"<h1>Please give particular information of items</h1>");
					}
				})
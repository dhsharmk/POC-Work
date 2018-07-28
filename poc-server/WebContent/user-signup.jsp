<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">

<title>POC App</title>
</head>
<body>
	<div class="container">
		<div class="container text-center">
			<h3>Sign Up</h3>
			<form action="UserController" method="POST">
				<input class="form-control my-1" type="hidden" name="command"
					value="SIGNUP" /> <input class="form-control my-1" type="text"
					name="firstName" placeholder="First Name" /> <input
					class="form-control my-1" type="text" name="lastName"
					placeholder="Last Name" /> <input class="form-control my-1"
					type="text" name="email" placeholder="E-mail" /> <input
					class="form-control my-1" type="number" name="mobile"
					placeholder="Mobile" /> <input class="form-control my-1"
					type="password" id="password" name="password" placeholder="Password" /> <input
					class="form-control my-1" id="cpassword" type="password" name="cpassword"
					placeholder="Confirm Password" />
					<div id="match"></div>
					<input
					class="btn btn-success my-1" type="submit" value="Save"
					class="save" />
			</form>
		</div>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/jquery-3.3.1.slim.min.js"></script>
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/script-signup.js"></script>
</body>
</html>
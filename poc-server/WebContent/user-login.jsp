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
			<h3>Log In</h3>
			<form action="UserController" method="POST">
				<input class="form-control my-1" type="hidden" name="command"
					value="LOGIN" /> <input class="form-control my-1" type="text"
					name="username" placeholder="E-mail or Mobile" /> <input class="form-control my-1" type="password"
					name="password" placeholder="Password" /> <input class="btn btn-success my-1"
					type="submit" value="Log In" />
			</form>
		</div>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/jquery-3.3.1.slim.min.js"></script>
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>
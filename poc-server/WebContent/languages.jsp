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
		<div class="row">
			<div class="col-md-3">
				<form action="UserController">
					<input type="hidden" name="command" value="LANGUAGE">
					<input type="hidden" name="language" value="English">
					<input type="submit" class="btn btn-primary" value="English">			
				</form>
			</div>
			
			<div class="col-md-3">
				<form action="UserController">
					<input type="hidden" name="command" value="LANGUAGE">
					<input type="hidden" name="language" value="Hindi">
					<input type="submit" class="btn btn-primary" value="Hindi">			
				</form>
			</div>
			
			<div class="col-md-3">
				<form action="UserController">
					<input type="hidden" name="command" value="LANGUAGE">
					<input type="hidden" name="language" value="Tamil">
					<input type="submit" class="btn btn-primary" value="Tamil">			
				</form>
			</div>
		</div>
	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/jquery-3.3.1.slim.min.js"></script>
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>
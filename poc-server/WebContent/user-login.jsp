<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="assets/css/mdb.min.css" rel="stylesheet">
<!-- Your custom styles (optional) -->
<link href="assets/css/styles.css" rel="stylesheet">

<title>POC App</title>
</head>
<body> 
	<div class="container">
		<div class="container text-center">
			<div class="row mt-5">
				<div class="col-md-5 mx-auto">
					<!-- Material form login -->
					<div class="card">
						<h5 class="card-header info-color white-text text-center py-4">
							<strong>Sign in</strong>
						</h5>
						<!--Card content-->
						<div class="card-body px-lg-5 pt-0">
							<!-- Form -->
							<form class="text-center" style="color: #757575;"
								action="UserController" method="POST">
								<input class="form-control my-1" type="hidden" name="command"
									value="LOGIN" />
								<!-- Email -->
								<div class="md-form">
									<input type="text" id="email" class="form-control"
										name="username"> <label for="email">E-mail or
										Phone</label>
								</div>
								<!-- Password -->
								<div class="md-form">
									<input type="password" id="password" class="form-control"
										name="password"> <label for="password">Password</label>
								</div>
								<div class="d-flex justify-content-around">
									<div>
										<!-- Remember me -->
										<div class="form-check">
											<input type="checkbox" class="form-check-input"
												id="materialLoginFormRemember"> <label
												class="form-check-label" for="materialLoginFormRemember">Remember
												me</label>
										</div>
									</div>
									<div>
										<!-- Forgot password -->
										<a href="">Forgot password?</a>
									</div>
								</div>

								<!-- Sign in button -->
								<button
									class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0"
									type="submit">Sign in</button>

								<!-- Register -->
								<p>
									Not a member? <a href="user-signup.jsp">Register</a>
								</p>

								<!-- Social login -->
								<p>or sign in with:</p>
								<a type="button" class="btn-floating btn-fb btn-sm"> <i
									class="fa fa-facebook"></i>
								</a> <a type="button" class="btn-floating btn-tw btn-sm"> <i
									class="fa fa-twitter"></i>
								</a> <a type="button" class="btn-floating btn-li btn-sm"> <i
									class="fa fa-linkedin"></i>
								</a> <a type="button" class="btn-floating btn-git btn-sm"> <i
									class="fa fa-github"></i>
								</a>

							</form>
							<!-- Form -->

						</div>

					</div>
					<!-- Material form login -->
				</div>
			</div>
		</div>
	</div>

	<!-- SCRIPTS -->
	<!-- JQuery -->
	<script type="text/javascript" src="assets/js/jquery-3.3.1.min.js"></script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript" src="assets/js/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript" src="assets/js/mdb.min.js"></script>
</body>
</html>
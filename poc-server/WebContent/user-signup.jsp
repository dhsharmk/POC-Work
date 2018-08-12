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
		<div class="row mt-5">
			<div class="col-md-5 mx-auto">
				<!-- Material form register -->
				<div class="card">

					<h5 class="card-header info-color white-text text-center py-4">
						<strong>Sign up</strong>
					</h5>

					<!--Card content-->
					<div class="card-body px-lg-5 pt-0">

						<!-- Form -->
						<form class="text-center" style="color: #757575;"
							action="UserController" method="POST">
							<input class="form-control my-1" type="hidden" name="command"
								value="SIGNUP" />
							<div class="form-row">
								<div class="col">
									<!-- First name -->
									<div class="md-form">
										<input type="text" id="fname" class="form-control"
											name="firstName"> <label for="fname">First
											name</label>
									</div>
								</div>
								<div class="col">
									<!-- Last name -->
									<div class="md-form">
										<input type="text" id="lname" class="form-control"
											name="lastName"> <label for="lname">Last name</label>
									</div>
								</div>
							</div>

							<!-- E-mail -->
							<div class="md-form mt-0">
								<input type="email" id="email" class="form-control" name="email">
								<label for="email">E-mail</label>
							</div>

							<!-- Password -->
							<div class="md-form">
								<input type="password" id="password" class="form-control"
									aria-describedby="password" name="password"> <label
									for="password">Password</label>
							</div>

							<div class="md-form">
								<input type="password" id="cpassword" class="form-control"
									aria-describedby="cpassword" name="cpassword"> <label
									for="cpassword">Confirm Password</label> <small id="cpassword"
									class="form-text text-muted mb-4"> At least 8
									characters and 1 digit </small>
							</div>
							<div id="match"></div>

							<!-- Phone number -->
							<div class="md-form">
								<input type="number" id="mobile" class="form-control"
									aria-describedby="mobile" name="mobile"> <label
									for="mobile">Phone number</label> <small id="mobile"
									class="form-text text-muted mb-4"> For two step
									authentication </small>
							</div>

							<!-- Newsletter -->
							<div class="form-check">
								<input type="checkbox" class="form-check-input" id="newsletter">
								<label class="form-check-label" for="newsletter">Subscribe
									to our newsletter</label>
							</div>

							<!-- Sign up button -->
							<button
								class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0"
								type="submit">Sign up</button>

							<!-- Social register -->
							<p>or sign up with:</p>

							<a type="button" class="btn-floating btn-fb btn-sm"> <i
								class="fa fa-facebook"></i>
							</a> <a type="button" class="btn-floating btn-tw btn-sm"> <i
								class="fa fa-twitter"></i>
							</a> <a type="button" class="btn-floating btn-li btn-sm"> <i
								class="fa fa-linkedin"></i>
							</a> <a type="button" class="btn-floating btn-git btn-sm"> <i
								class="fa fa-github"></i>
							</a>

							<hr>

							<!-- Terms of service -->
							<p>
								By clicking <em>Sign up</em> you agree to our <a href=""
									target="_blank">terms of service</a> and <a href=""
									target="_blank">terms of service</a>.
							</p>

						</form>
						<!-- Form -->

					</div>

				</div>
				<!-- Material form register -->
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
	<script src="assets/js/script-signup.js"></script>
</body>
</html>
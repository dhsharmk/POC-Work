<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Dashboard</title>
</head>
<body>
	<jsp:include page="side-nav.html" />
	<!--  <div class="container text-center mt-5 my-3">
		<form action="ItemController" method="GET">
			<div class="container my-3" id="input-div">
				<input type="hidden" name="command" value="PREVIEW">
				<div class="form-row">
					<div class="col-5">
						<input type="text" class="form-control my-1" name="customerName"
							placeholder="Customer's Name">
					</div>
					<div class="col-1">
						<button type="button" id="cnamemic">
							<i class="fa fa-microphone" aria-hidden="true"></i>
						</button>
					</div>
					<div class="col-5">
						<input type="number" class="form-control my-1"
							name="customerMobile" placeholder="Customer's Mobile Number">
					</div>
					<div class="col-1"></div>
					<div class="col-10">
						<textarea class="form-control my-1" name="input-items"
							id="input-items" placeholder="Enter here" rows="10"></textarea>
					</div>
					<div class="col-1">
						<button type="button" id="itemsmic">
							<i class="fa fa-microphone" aria-hidden="true"></i>
						</button>
					</div>
				</div>
			</div>
			<div id="btn-preview">
				<button class="btn btn-primary my-2" type="submit">Preview</button>
			</div>
		</form>
	</div>  -->

	<div class="container">
		<div class="container text-center">
			<div class="row my-5">
				<div class="col-md-5 mx-auto">
					<div class="card">
						<h5 class="card-header info-color white-text text-center py-4">
							<strong>Create Bill</strong>
						</h5>
						<!--Card content-->
						<div class="card-body px-lg-5 pt-0">
							<!-- Form -->
							<form class="text-center" style="color: #757575;"
								action="ItemController" method="GET">
								<input class="form-control my-1" type="hidden" name="command"
									value="PREVIEW" />
								<!-- Customer Name -->
								<div class="md-form">
									<input type="text" id="cname" class="form-control"
										name="customerName"> <label for="cname">Customer
										Name</label>
									<button type="button" id="cnamemic">
										<i class="fa fa-microphone" aria-hidden="true"></i>
									</button>
								</div>
								<!-- Mobile -->
								<div class="md-form">
									<input type="number" id="cmob" class="form-control"
										name="customerMobile"> <label for="cmob">Customer
										Mobile</label>
								</div>

								<!-- Input Items -->
								<div class="md-form">
									<textarea class="form-control" name="input-items"
										id="input-items" rows="5"></textarea>
									<label for="input-items">Enter Items Here!!!</label>
									<button type="button" id="itemsmic">
										<i class="fa fa-microphone" aria-hidden="true"></i>
									</button>
								</div>

								<!-- Preview button -->
								<button
									class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0"
									type="submit">Preview</button>
							</form>
							<!-- Form -->

						</div>

					</div>
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
	<script src="assets/js/script-dash.js"></script>

</body>
</html>
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

<title>Update Profile</title>
</head>

<body>
	<jsp:include page="side-nav.html" />
	<div class="container">
		<div class="container text-center">
			<h3>Update Profile</h3>
			<form action="UserController" method="POST">
				<input class="form-control my-1" type="hidden" name="command"
					value="UPDATE" /> <input class="form-control my-1" type="hidden"
					name="email"
					value="<%=session.getAttribute("CURRENT_USER_EMAIL")%>" /> <input
					class="form-control my-1" type="text" name="firstName"
					placeholder="First Name"
					value="<%=session.getAttribute("CURRENT_USER_FIRST_NAME")%>" />
				<input class="form-control my-1" type="text" name="lastName"
					placeholder="Last Name"
					value="<%=session.getAttribute("CURRENT_USER_LAST_NAME")%>" /> <input
					class="form-control my-1" type="number" name="mobile"
					placeholder="Mobile"
					value="<%=session.getAttribute("CURRENT_USER_MOBILE")%>" /> <input
					class="form-control my-1" type="password" name="password"
					placeholder="Password"
					value="<%=session.getAttribute("CURRENT_USER_PASSWORD")%>" />
				<div id="match"></div>
				<input class="btn btn-success my-1" type="submit"
					value="Update Profile" class="save" />
			</form>
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
	<script src="assets/js/script.js"></script>
</body>

</html>
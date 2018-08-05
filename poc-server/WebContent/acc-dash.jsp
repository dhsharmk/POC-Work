<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="assets/css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="assets/css/styles.css" rel="stylesheet">
<title>Dashboard</title>
</head>
<body>
	<nav role="navigation">
		<div id="menuToggle">
			<input type="checkbox" /> <span></span> <span></span> <span></span>
			<ul id="menu">
				<li>
					<form action="ItemController" method="GET">
						<input type="hidden" name="command" value="VIEWBILL">
						<button>Bill</button>
					</form>
				</li>
				<li><form action="ItemController" method="GET">
						<input type="hidden" name="command" value="LISTACCOUNTS">
						<button>Accounts</button>
					</form></li>
				<li><form action="UserController" method="GET">
						<input type="hidden" name="command" value="UPDATEPROFILE">
						<button>Profile</button>
					</form></li>
				<li><form action="UserController" method="GET">
						<input type="hidden" name="command" value="LOGOUT">
						<button>Logout</button>
					</form></li>
			</ul>
		</div>
	</nav>
	<div class="container text-center mt-5 my-3">
		<h1 class="my-2">
			Welcome
			<%=session.getAttribute("CURRENT_USER_FIRST_NAME")%></h1>
		<hr>
		<form action="ItemController" method="GET">
			<div class="container my-3" id="input-div">
				<p>Example: Atta 10 kilo 50 rupye Shakkar 5 kilo 25 rupye ...</p>
				<input type="hidden" name="command" value="PREVIEW">
				<div class="form-row">
					<div class="col-11">
						<input type="text" class="form-control my-1" name="customerName"
							placeholder="Customer's Name" value="<%= request.getAttribute("CUSTOMER_NAME") %>">
					</div>
					<div class="col-1">
						<button type="button" id="cnamemic">
							<i class="fa fa-microphone" aria-hidden="true"></i>
						</button>
					</div>
					<div class="col-11">
						<input type="number" class="form-control my-1" name="customerMobile"
					placeholder="Customer's Mobile Number" value="<%= request.getAttribute("CUSTOMER_MOB") %>">
					</div>
					<div class="col-1"></div>
					<div class="col-11">
						<textarea class="form-control my-1" name="input-items"
					id="input-items" placeholder="Enter here"></textarea>
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
		<hr>

		<form action="ItemController" method="GET">
			<h1 class="text-center">View List</h1>
			<input type="hidden" name="command" value="LIST"> <input
				class="form-control" type="date" name="date" required>
			<button class="btn btn-primary my-2">List</button>
		</form>
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
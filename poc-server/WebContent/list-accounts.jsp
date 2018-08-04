<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>Items List</title>
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
	<div class="container">
		<div class="row">
			<c:forEach var="tempAccount" items="${ACCOUNT_LIST}">

				<div class="col-md-3">
					<div
						class="text-white text-center d-flex align-items-center rgba-indigo-strong py-5 px-4">
						<div>
							<h3 class="card-title pt-2">
								<strong>${tempAccount.cname}</strong>
							</h3>
							<p>Mobile: ${tempAccount.cmob}</p>
							<p>Outstanding: ${tempAccount.outstanding}</p>
							<form action="ItemController" method="GET">
								<input type="hidden" name="command" value="VIEWACCOUNT">
								<input type="hidden" name="mobile" value="${tempAccount.cmob}">
								<button class="btn btn-deep-orange waves-effect waves-light">
									<i class="fa fa-clone left"></i> View Account
								</button>
							</form>
							<form action="ItemController" method="GET">
								<input type="hidden" name="command" value="VIEWACCOUNTDASH">
								<input type="hidden" name="name" value="${tempAccount.cname}">
								<input type="hidden" name="mobile" value="${tempAccount.cmob}">
								<button class="btn btn-deep-orange waves-effect waves-light">
									<i class="fa fa-clone left"></i> Generate Bill
								</button>
							</form>
							<form action="ItemController" method="POST">
								<input type="hidden" name="command" value="DELETEACCOUNT">
								<input type="hidden" name="mobile" value="${tempAccount.cmob}">
								<button class="btn btn-deep-orange waves-effect waves-light">DELETE
									Account</button>
							</form>
						</div>
					</div>
				</div>
			</c:forEach>
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









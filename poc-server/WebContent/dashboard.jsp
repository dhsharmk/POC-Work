<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">

<title>Dashboard</title>
</head>
<body>
	<div class="container text-center">
		<div class="row my-2">
			<div class="col-md-4">
				<div class="list group" id="list-group">
					<form action="ItemController" method="GET">
						<input type="hidden" name="command" value="VIEWBILL">
						<button class="list-group-item list-group-item-action">Bill</button>
					</form>
					<form action="ItemController" method="GET">
						<input type="hidden" name="command" value="LISTACCOUNTS">
						<button class="list-group-item list-group-item-action">Accounts</button>
					</form>
					<a href="user-update-profile.jsp" class="list-group-item list-group-item-action">Profile</a>
					<form action="UserController" method="GET">
						<input type="hidden" name="command" value="LOGOUT">
						<button class="list-group-item list-group-item-action">Logout</button>
					</form>
				</div>
			</div>
			<div class="col-md-8">
				<h1 class="my-2">Welcome <%=session.getAttribute("CURRENT_USER_FIRST_NAME")%></h1>
				<hr>

				<form action="ItemController" method="GET">
					<div class="container my-3" id="input-div">
						<p>Example: Atta 10 kilo 50 rupye Shakkar 5 kilo 25 rupye ...</p>
						<input type="hidden" name="command" value="PREVIEW"> <input
							type="text" class="form-control my-1" name="customerName"
							placeholder="Customer's Name"> <input type="number"
							class="form-control my-1" name="customerMobile"
							placeholder="Customer's Mobile Number">
						<textarea class="form-control my-1" name="input-items"
							id="input-items" placeholder="Enter here"></textarea>
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
		</div>

	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/jquery-3.3.1.slim.min.js"></script>
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/script-dash.js"></script>

</body>
</html>
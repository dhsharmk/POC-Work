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
			<div class="col-4">
				<div class="list-group" id="list-tab" role="tablist">
					<a class="list-group-item list-group-item-action active"
						id="list-home-list" data-toggle="list" href="#list-home"
						role="tab" aria-controls="home">Bill</a> <a
						class="list-group-item list-group-item-action"
						id="list-profile-list" data-toggle="list" href="#list-profile"
						role="tab" aria-controls="profile">Accounts</a> <a
						class="list-group-item list-group-item-action"
						id="list-messages-list" data-toggle="list" href="#list-messages"
						role="tab" aria-controls="messages">Messages</a> <a
						class="list-group-item list-group-item-action"
						id="list-settings-list" data-toggle="list" href="#list-settings"
						role="tab" aria-controls="settings">Settings</a>
				</div>
			</div>
			<div class="col-8">
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="list-home"
						role="tabpanel" aria-labelledby="list-home-list">
						<div class="row">
							<div class="col-md-4">
								<h1 class="my-2">
									Welcome
									<%=session.getAttribute("CURRENT_USER_FIRST_NAME")%></h1>
							</div>
							<div class="col-md-4">
								<a href="user-update-profile.jsp" class="btn btn-primary my-2">Update
									Profile</a>
							</div>
							<div class="col-md-4">
								<form action="UserController" method="GET">
									<input type="hidden" name="command" value="LOGOUT">
									<button type="submit" class="btn btn-primary my-2">Log
										Out</button>
								</form>
							</div>
						</div>

						<hr>

						<form action="ItemController" method="GET">
							<div class="container my-3" id="input-div">
								<p>Example: Atta 10 kilo 50 rupye Shakkar 5 kilo 25 rupye
									...</p>
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
					<div class="tab-pane fade" id="list-profile" role="tabpanel"
						aria-labelledby="list-profile-list">
						.........			
						</div>
					<div class="tab-pane fade" id="list-messages" role="tabpanel"
						aria-labelledby="list-messages-list">...</div>
					<div class="tab-pane fade" id="list-settings" role="tabpanel"
						aria-labelledby="list-settings-list">...</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/jquery-3.3.1.slim.min.js"></script>
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/script.js"></script>

</body>
</html>
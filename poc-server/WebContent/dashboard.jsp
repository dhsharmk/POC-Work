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
		<h1 class="my-2">
			Welcome
			<%=session.getAttribute("CURRENT_USER_FIRST_NAME")%></h1>
		<div class="text-center my-2">
			<a href="user-update-profile.jsp" class="btn btn-primary my-2">Update
				Profile</a>
			<form action="UserController" method="GET">
				<input type="hidden" name="command" value="LOGOUT">
				<button type="submit" class="btn btn-primary my-2">LOG OUT</button>
			</form>
		</div>
		<form action="ItemController" method="GET">
			<div class="container my-3" id="input-div">
				<p>example: Atta 10 kilo Shakkar 5 kilo ...</p>
				<input type="hidden" name="command" value="SAVE"> <input
					type="text" class="form-control my-1" name="customerName"
					placeholder="Customer's Name"> <input type="number"
					class="form-control my-1" name="customerMobile"
					placeholder="Customer's Mobile Number">
				<textarea class="form-control my-1" name="input-items"
					id="input-items" placeholder="Enter here"></textarea>
			</div>
			<div id="preview-items">
				<table id="preview-table" class="table">

				</table>
				<h1 id="error"></h1>
			</div>
			<button class="btn btn-primary my-2" type="submit">Save</button>
		</form>

		<button class="btn btn-primary text-white my-2" id="preview-btn">Preview</button>
		
		<form action="ItemController" method="GET">
			<input type="hidden" name="command" value="LIST">
			<button class="btn btn-primary my-2">List</button>
		</form>

	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/jquery-3.3.1.slim.min.js"></script>
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/script.js"></script>

</body>
</html>
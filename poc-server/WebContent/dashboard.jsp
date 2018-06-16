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
		<h1>
			Welcome
			<%=session.getAttribute("CURRENT_USER_FIRST_NAME")%></h1>
		<div class="text-center my-2">
			<a href="user-update-profile.jsp" class="btn btn-primary">Update
				Profile</a>
			<form action="UserController" method="GET">
				<input type="hidden" name="command" value="LOGOUT">
				<button type="submit" class="btn btn-primary">LOG OUT</button>
			</form>
		</div>
		<form action="ItemController" method="GET">
			<div class="container my-3" id="input-div">
				<p>example: Atta 10 kilo Shakkar 5 kilo ...</p>
				<input type="hidden" name="command"value="SAVE">
				<textarea class="form-control" name="input-items" id="input-items"
					placeholder="Enter here"></textarea>
			</div>
			<div id="preview-items">
				<table id="preview-table" class="table">

				</table>
				<h1 id="error"></h1>
			</div>
			<div class="row">
				<div class="col-md-4 col-sm-4">
					<a class="btn btn-primary text-white" id="preview-btn">Preview</a>
				</div>

				<div class="col-md-4 col-sm-4">
					<button class="btn btn-primary" type="submit">Save</button>
				</div>	
				
				<div class="col-md-4 col-sm-4">
					<a class="btn btn-primary text-white">List</a>
				</div>
			</div>
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
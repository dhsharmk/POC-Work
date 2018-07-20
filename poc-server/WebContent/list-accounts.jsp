<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">

<title>Items List</title>
</head>

<body>
	<div class="container">
		<div class="row">
			<c:forEach var="tempAccount" items="${ACCOUNT_LIST}">
				<div class="col-md-3">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">${tempAccount.cname}</h5>
							<p class="card-text">Mobile: ${tempAccount.cmob}</p>
							<p class="card-text">Outstanding: ${tempAccount.outstanding}</p>
							<form action="ItemController" method="GET">
								<input type="hidden" name="command" value="VIEWACCOUNT">
								<input type="hidden" name="mobile" value="${tempAccount.cmob}">
								<button class="btn btn-primary">View Account</button>							
							</form>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<button onclick="window.location.href='dashboard.jsp'; return false;"
			class="btn btn-primary">Back</button>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/jquery-3.3.1.slim.min.js"></script>
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</body>
</html>









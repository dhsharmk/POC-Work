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

			<table class="table">

				<tr>
					<th>Customer Name</th>
					<th>Customer Mobile</th>
					<th>Stuff</th>
					<th>Quantity</th>
					<th>Unit</th>
					<th>Price</th>
				</tr>

				<c:forEach var="tempItem" items="${ITEM_LIST}">
					<tr>
						<td>${tempItem.cname}</td>
						<td>${tempItem.cmob}</td>
						<td>${tempItem.stuff}</td>
						<td>${tempItem.quantity}</td>
						<td>${tempItem.unit}</td>
						<td>Rs. ${tempItem.price}</td>
					</tr>

				</c:forEach>

			</table>
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









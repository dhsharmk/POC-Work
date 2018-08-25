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
	<jsp:include page="side-nav.html" />
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









<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!doctype html>
	<html lang="en">

	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<!-- Bootstrap CSS -->
		<link rel="stylesheet" href="assets/css/bootstrap.min.css">

		<title>POC App</title>
	</head>

	<body>
		<div id="container">

			<div id="content">
				<table class="table">

					<tr>
						<th>Customer Name</th>
						<th>Customer Mobile</th>
						<th>Stuff</th>
						<th>Quantity</th>
						<th>Unit</th>
						<th>Price</th>
					</tr>

					<c:forEach var="tempItem" items="${ITEMS_PREVIEW}">
						<tr>
							<td>${tempItem.cname}</td>
							<td>${tempItem.cmob}</td>
							<td>${tempItem.stuff}</td>
							<td>${tempItem.quantity}</td>
							<td>${tempItem.unit}</td>
							<td>Rs. ${tempItem.price}</td>
						</tr>

					</c:forEach>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>Total</td>
						<td><%= request.getAttribute("TOTAL_AMOUNT")%></td>
					</tr>
				</table>

				<form action="ItemController" method="POST">
					<div class="container my-3" id="input-div">
						<input type="hidden" name="command" value="SAVE">
						<input type="hidden" class="form-control my-1" name="customerName" placeholder="Customer's Name" value="<%= request.getAttribute("CUSTOMER_NAME") %>">
						<input type="hidden" class="form-control my-1" name="customerMobile" placeholder="Customer's Mobile Number" value="<%= request.getAttribute("CUSTOMER_MOB") %>">
						<input type="hidden" class="form-control my-1" name="input-items" id="input-items" placeholder="Enter here" value="<%= request.getAttribute("INPUT_ITEMS") %>">
					</div>
					<button class="btn btn-primary my-2" type="submit">Save</button>
				</form>


				<button onclick="window.location.href='dashboard.jsp'; return false;" class="btn btn-primary mx-auto">Back</button>
			</div>

		</div>

		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="assets/js/jquery-3.3.1.slim.min.js"></script>
		<script src="assets/js/popper.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
	</body>

	</html>
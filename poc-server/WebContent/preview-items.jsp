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

<title>Items Preview</title>
</head>

<body>
	<div class="container">
		<form action="ItemController" method="POST">
			<table class="table">
				<tr>
					<th>S No.</th>
					<th>Stuff</th>
					<th>Quantity</th>
					<th>Unit</th>
					<th>Price</th>
				</tr>
				<c:forEach var="tempItem" items="${ITEMS_PREVIEW}" varStatus="loop">
					<tr>
						<td>${loop.count}</td>
						<td><input name="stuff${loop.count }" type="text"
							value="${tempItem.stuff}"></td>
						<td><input name="quantity${loop.count }" type="text"
							value="${tempItem.quantity}"></td>
						<td><input name="unit${loop.count }" type="text"
							value="${tempItem.unit}"></td>
						<td>Rs. <input name="price${loop.count }" type="text"
							value="${tempItem.price}"></td>
					</tr>
				</c:forEach>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td>Total</td>
					<td><%= request.getAttribute("TOTAL_AMOUNT") %></td>
				</tr>
			</table>

			<div class="container my-3" id="input-div">
				<input type="hidden" name="command" value="SAVE"> <input
					type="hidden" class="form-control my-1" name="customerName"
					placeholder="Customer's Name"
					value="<%= request.getAttribute("CUSTOMER_NAME") %>"> <input
					type="hidden" class="form-control my-1" name="customerMobile"
					placeholder="Customer's Mobile Number"
					value="<%= request.getAttribute("CUSTOMER_MOB") %>"> <input
					type="hidden" class="form-control my-1" name="input-items"
					id="input-items" placeholder="Enter here"
					value="<%= request.getAttribute("INPUT_ITEMS") %>"> <input
					type="number" name="paid" placeholder="Paid Amount"
					class="form-control" required>
			</div>
			<button class="btn btn-primary my-2" type="submit">Save</button>
		</form>


		<button onclick="window.location.href='dashboard.jsp'; return false;"
			class="btn btn-primary mx-auto">Back</button>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="assets/js/jquery-3.3.1.slim.min.js"></script>
	<script src="assets/js/popper.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
</body>

</html>
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
<title>Items Preview</title>
</head>

<body>
	<jsp:include page="side-nav.html" />
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
			</table> 
			<table>
				<tr>
					<td><button type="button" id="addrow" class="btn btn-primary">Add
							row</button></td>
					<td>Total</td>
					<td id="total">0</td>
					<td><button type="button" id="reload">
							<i class="fa fa-refresh" aria-hidden="true"></i>
						</button></td>
						<td>
							<button type="button" class="btn btn-block btn-deep-orange waves-effect waves-light mt-1"><i class="fa fa-whatsapp" aria-hidden="true"></i>
								SHARE</button>
						</td>
				</tr>
			</table>
			<div class="container my-3" id="input-div">
				<input type="hidden" name="command" value="SAVE">
				<% if(request.getAttribute("CUSTOMER_NAME")!=null){%>
				<input type="text" class="form-control my-1" name="customerName" placeholder="Customer's Name" value="<%=request.getAttribute("CUSTOMER_NAME")%>">
				<input type="text" class="form-control my-1" name="customerMobile" placeholder="Customer's Mobile Number" value="<%=request.getAttribute("CUSTOMER_MOB")%>">
				<%} else { %>
				<input type="text" class="form-control my-1" name="customerName" placeholder="Customer's Name">
				<input type="text" class="form-control my-1" name="customerMobile" placeholder="Customer's Mobile Number">
				<%} %>
				<input type="text" class="form-control my-1" name="input-items" id="input-items" placeholder="Enter here">
				<input type="number" name="paid" placeholder="Paid Amount" class="form-control" required>
			</div>
			<button class="btn btn-primary my-2" type="submit">Save</button>
		</form>

		<button onclick="window.location.href='dashboard.jsp'; return false;"
			class="btn btn-primary mx-auto">Back</button>
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
	<script type="text/javascript" src="assets/js/preview-items.js"></script>
</body>

</html>
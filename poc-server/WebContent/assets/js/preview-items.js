var items = document.querySelector("#input-items");
var reload = document.querySelector("#reload");
var itemsArray = items.value.split(" ");

reload.addEventListener("click", function() {
	var j = 1;
	var amount = 0;
	var total = 0;
	for (var i = 0; i < itemsArray.length - 2; i = i + 5) {
		var qc = "quantity" + j;
		var pc = "price" + j;
		j++;
		quantity = document.querySelector("#" + qc).value;
		price = document.querySelector("#" + pc).value;
		amount = quantity * price;
		total += amount;
	}

	document.querySelector("#total").textContent = total;
})

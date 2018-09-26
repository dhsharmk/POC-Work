var reload = document.querySelector("#reload");
var addrow = document.querySelector("#addrow");
var table = document.querySelector(".table");

var itemsArray = null, j=1, rows=0, str = null;

reload.addEventListener("click", function(){
	j = 1;
	var amount = 0;
	var total = 0;
	for (var i = 0; i < rows; i++) {
		var qc = "quantity" + j;
		var pc = "price" + j;
		j++;
		quantity = document.querySelector("#" + qc).value;
		price = document.querySelector("#" + pc).value;
		amount = quantity * price;
		total += amount;
	}

	document.querySelector("#total").textContent = total;
});

addrow.addEventListener("click", function(){
	arrayHandling();
	addRow();
	insertValues();
});

function addRow(){
	rows++;
    var html = '<tr>' +
    '<td>' + rows + '</td>' +
    '<td><input name="stuff' + rows + '" id="stuff' + rows + '" type="text"></td></td>' +
    '<td><input name="quantity' + rows + '" id="quantity' + rows + '" type="text"></td></td>' +
    '<td><input name="unit' + rows + '" id="unit' + rows + '" type="text"></td></td>' +
    '<td>Rs. <input name="price' + rows + '" id="price' + rows + '" type="text"></td></td>' +
    '</tr>';
    table.innerHTML += html;
}

addRow();

function arrayHandling(){
	itemsArray = [];
	j=1;
	for (var i = 0; i < rows; i++) {
		var qc = "quantity" + j;
		var pc = "price" + j;
		var st = "stuff" + j;
		var un = "unit" + j;
		j++;
		
		quantity = document.querySelector("#" + qc).value;
		price = document.querySelector("#" + pc).value;
		stuff = document.querySelector("#" + st).value;
		unit = document.querySelector("#" + un).value;
		
		itemsArray.push(stuff);
		itemsArray.push(quantity);
		itemsArray.push(unit);
		itemsArray.push(price);
		itemsArray.push("rupye");
	}
	str = itemsArray.join(" ");
	document.querySelector("#input-items").value = str;
}

function insertValues(){
	j=1,i=0;
	while(i < itemsArray.length) {
		var qc = "quantity" + j;
		var pc = "price" + j;
		var st = "stuff" + j;
		var un = "unit" + j;
		j++;
		
		document.querySelector("#" + st).value = itemsArray[i];
		document.querySelector("#" + qc).value = itemsArray[i+1];
		document.querySelector("#" + un).value = itemsArray[i+2];
		document.querySelector("#" + pc).value = itemsArray[i+3];
		
		i=i+5;
	}
}
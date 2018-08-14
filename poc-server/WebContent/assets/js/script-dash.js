var cnamemic = document.querySelector("#cnamemic");
var itemsmic = document.querySelector("#itemsmic");

document.getElementById("input-items").textContent = "10 kilo Atta 50 rupye 5 kilo Shakkar 25 rupye";

cnamemic.addEventListener("click", function(){
	console.log("Customer Name Mic Clicked");
	alert("Customer Name Mic Clicked");
})

itemsmic.addEventListener("click", function(){
	alert("Items List Mic Clicked");
})
  
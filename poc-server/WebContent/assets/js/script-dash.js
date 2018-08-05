var cnamemic = document.querySelector("#cnamemic");
var itemsmic = document.querySelector("#itemsmic");

document.getElementById("input-items").textContent = "Atta 10 kilo 50 rupye Shakkar 5 kilo 25 rupye";

cnamemic.addEventListener("click", function(){
	console.log("Customer Name Mic Clicked");
	alert("Customer Name Mic Clicked");
})

itemsmic.addEventListener("click", function(){
	alert("Items List Mic Clicked");
})
  
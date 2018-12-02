var reload = document.querySelector("#reload");
var addrow = document.querySelector("#addrow");
var table = document.querySelector("#table");
var save = document.querySelector("#save");

save.addEventListener("click", function(){
	setrowcount();
})


var itemsArray = null, j=1, str = null, i=1,rows=1;


$(document).ready(function () {
    $("#addrow").click(function (e) {
    	 e.preventDefault();
    	

         var newRow = jQuery('<tr>' +
        		    '<td>' + rows + '</td>' +
        		    '<td><input name="stuff' + rows + '" id="stuff' + rows + '" type="text"></td></td>' +
        		    '<td><input name="quantity' + rows + '" id="quantity' + rows + '" type="text"></td></td>' +
        		    '<td><input name="unit' + rows + '" id="unit' + rows + '" type="text"></td></td>' +
        		    '<td>Rs. <input name="rate' + rows + '" id="rate' + rows + '" type="text"></td></td>' +
        		    '<td>Rs. <input name="price' + rows + '" id="price' + rows + '" type="text"></td></td>' +
        		    '</tr>');
             rows++;
         jQuery('table.table').append(newRow);
        
         additem();
    });
});





function additem(){ 
	 i=rows-1;
  	st = "stuff"+i;
  	qc="quantity"+i;
      un="unit"+i;
      rp="rate"+i;
      pc="price"+i;
        MainActivityInterface.insertItems();	
}


function setrowcount(){
var rowcount = $('table tr').length
document.getElementById('input-items').value= rowcount-2;
}
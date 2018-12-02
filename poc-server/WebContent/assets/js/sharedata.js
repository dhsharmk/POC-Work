var share = document.querySelector("#share");
share.addEventListener("click", function(){
	var data= printTable();
	MainActivityInterface.shareData(data);
})

	function printTable() {
  var rows = document.querySelectorAll("tbody tr");
  var str= "";
  var arr= [];
  for (i=0;i<rows.length;i++){
	  str += rows[i].innerText; 
  }
  alert(str);
  return str;
  }

  
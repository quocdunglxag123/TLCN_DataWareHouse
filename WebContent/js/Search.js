
//--------------------------Xu Ly Check Box---------------------------------------
//Kiem tra check Root
function checkRoot() {
	const node = document.querySelectorAll("#node");
	if (document.getElementById("root").checked == true) {
		//Truong hop check root duoc check
		for (i = 0; i < node.length; i++) {
			node[i].checked = true;
		}
	} else {
		//Truong hop check root chua duoc check hoac bo check
		for (i = 0; i < node.length; i++) {
			node[i].checked = false;
		}
	}
}
//Kiem tra tat ca node duoc check de check Root
function checkNode() {
	const node = document.querySelectorAll("#node");
	var flag = true;
	for (i = 0; i < node.length; i++) {
		if (node[i].checked == false) {
			//Ton tai node chua duoc check
			flag = false;
		}
	}
	if (flag) {
		//Truong hop tat ca node duoc check
		document.getElementById("root").checked = true;
	} else {
		//Truong hop ton tai node duoc check
		document.getElementById("root").checked = false;
	}
}
//--------------------------List Node Checked and Send list node to servlet---------------------------------------
function listNodeCheckedLogic(){
	
	var ids='';
	const node = document.querySelectorAll("#node");
	for (i = 0; i < node.length; i++) {
		if (node[i].checked == true) {
			if(ids !==''){
				ids=ids+","+ node[i].value;
			}else
			{
				ids=ids+node[i].value;
			}
		}
	}
	document.getElementById("listNodeChecked").value=ids;
}



//--------------------------Xu Ly Next & Prevoius---------------------------------------
//Xu ly nut firstPage
function firstPageLogic() {
	document.getElementById("page").value = 0
	document.getElementById("ViewCompany").submit();
}
//Xu ly nut previousPage
function previousPageLogic() {
	let page = document.getElementById("page").value;
	if (parseInt(page) > 0) {
		document.getElementById("page").value = parseInt(page) - 1;
	}
	document.getElementById("ViewCompany").submit();
}
//Xu ly nut nextPage
function nextPageLogic(endPage) {
	let page = document.getElementById("page").value;
	if ( parseInt(page) <  parseInt(endPage)) {
		document.getElementById("page").value = parseInt(page) + 1;
	}
	document.getElementById("ViewCompany").submit();
}
//Xu ly nut lastPage
function lastPageLogic(endPage) {
	document.getElementById("page").value = parseInt(endPage);
	document.getElementById("ViewCompany").submit();
}
function enableFirstPage(){
	document.getElementById("firstPage").disabled = false;
	document.getElementById("previousPage").disabled = false;
	document.getElementById("nextPage").disabled = true;
	document.getElementById("lastPage").disabled = true;
}
function enableLastPage(){
	document.getElementById("firstPage").disabled = true;
	document.getElementById("previousPage").disabled = true;
	document.getElementById("nextPage").disabled = false;
	document.getElementById("lastPage").disabled = false;
}
function disableAllButtonNextPrevious(){
	document.getElementById("firstPage").disabled = true;
	document.getElementById("previousPage").disabled = true;
	document.getElementById("nextPage").disabled = true;
	document.getElementById("lastPage").disabled = true;
}
//--------------------------Xu Ly selected check view---------------------------------------
function checkView(chooseView, endPage){
	var selected= document.getElementById("chooseView");
	let page = document.getElementById("page").value;
	if(chooseView==='viewCompany'){
		selected.options.selectedIndex=0;
	}
	if(chooseView==='viewDateTrade'){
		selected.options.selectedIndex=1;
	}
	if(chooseView==='viewFactTrade'){
		selected.options.selectedIndex=2;
	}
	if(parseInt(page)===0){
		enableLastPage();
	}
	if(parseInt(endPage) === parseInt(page)){
		enableFirstPage();
	}
	if(parseInt(page)===0 && parseInt(endPage) === parseInt(page)){
		disableAllButtonNextPrevious()
	}
}

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
	if(chooseView==='viewExchange'){
		selected.options.selectedIndex=1;
	}
	if(chooseView==='viewDateTrade'){
		selected.options.selectedIndex=2;
	}
	if(chooseView==='viewFactTrade'){
		selected.options.selectedIndex=3;
	}
	if(chooseView==='viewFactBusinessResult'){
		selected.options.selectedIndex=4;
	}
	if(chooseView==='viewFactStockOrder'){
		selected.options.selectedIndex=5;
	}
	if(chooseView==='viewFactForeignInvestorAuction'){
		selected.options.selectedIndex=6;
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



		function openNav() {
		  document.getElementById("mySidenav").style.width = "25%";
		}
		
		function closeNav() {
		  document.getElementById("mySidenav").style.width = "0";
		}

      const popupContainer = document.querySelector(".popup-container");
      const statsBtn = document.querySelector(".stats-btn");
      const closeBtn = document.querySelector(".popup-container .close-btn");

      statsBtn.addEventListener("click", () => {
        popupContainer.classList.add("active");
      });

      closeBtn.addEventListener("click", () => {
        popupContainer.classList.remove("active");
      });

      const popupContainer1 = document.querySelector(".popup-container1");
      const statsBtn1 = document.querySelector(".stats-btn1");
      const closeBtn1 = document.querySelector(".popup-container1 .close-btn1");

      statsBtn1.addEventListener("click", () => {
        popupContainer1.classList.add("active");
      });

      closeBtn1.addEventListener("click", () => {
        popupContainer1.classList.remove("active");
      });

      const popupContainer2 = document.querySelector(".popup-container2");
      const statsBtn2 = document.querySelector(".stats-btn2");
      const closeBtn2 = document.querySelector(".popup-container2 .close-btn2");

      statsBtn2.addEventListener("click", () => {
        popupContainer2.classList.add("active");
      });

      closeBtn2.addEventListener("click", () => {
        popupContainer2.classList.remove("active");
      });

      const popupContainer3 = document.querySelector(".popup-container3");
      const statsBtn3 = document.querySelector(".stats-btn3");
      const closeBtn3 = document.querySelector(".popup-container3 .close-btn3");

      statsBtn3.addEventListener("click", () => {
        popupContainer3.classList.add("active");
      });

      closeBtn3.addEventListener("click", () => {
        popupContainer3.classList.remove("active");
      });

      const popupContainer4 = document.querySelector(".popup-container4");
      const statsBtn4 = document.querySelector(".stats-btn4");
      const closeBtn4 = document.querySelector(".popup-container4 .close-btn4");

      statsBtn4.addEventListener("click", () => {
        popupContainer4.classList.add("active");
      });

      closeBtn4.addEventListener("click", () => {
        popupContainer4.classList.remove("active");
      });
      const popupContainer5 = document.querySelector(".popup-container5");
      const statsBtn5 = document.querySelector(".stats-btn5");
      const closeBtn5 = document.querySelector(".popup-container5 .close-btn5");

      statsBtn5.addEventListener("click", () => {
        popupContainer5.classList.add("active");
      });

      closeBtn5.addEventListener("click", () => {
        popupContainer5.classList.remove("active");
      });

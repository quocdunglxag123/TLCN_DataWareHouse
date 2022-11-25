function checkStatus() {
	if (document.getElementById("companyId").value == "") {
		document.getElementById("status").innerHTML = "Add Company";
		document.getElementById('companySymbol').readOnly = false;
	} else {
		document.getElementById("status").innerHTML = "Edit Company";
		document.getElementById('companySymbol').readOnly = true;
	}
}

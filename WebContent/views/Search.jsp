<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>View Data</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/Search.css">
<script language="javascript"
	src="<%=request.getContextPath()%>/js/Search.js"></script>
	
	
<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

</head>
<body onload="checkView('${chooseView}','${endPage}')">
	<form action="SearchCompany" id="ViewCompany" method="post"
		onsubmit="listNodeCheckedLogic()" class="form-login">
		<nav class="navbar navbar-light bg-light justify-content-between">
			<a class="navbar-brand">Hello ${userName}</a>
			<div class="form-inline">
				<a href="Login" class="logout">Logout</a>
			</div>
		</nav>
		<input type="hidden" id="page" name="page" ReadOnly value="${page}" />
		<input type="hidden" id="endPage" name="endPage" ReadOnly
			value="${endPage}" /> <input type="hidden" id="listNodeChecked"
			name="listNodeChecked" ReadOnly value="" />
		<div class="select">
			<label for="cars">ChooseView:</label> 
			<select name="chooseView" id="chooseView" class="form-select" aria-label="Default select example">
				<option value="viewCompany">View Company</option>
				<option value="viewDateTrade">View Date</option>
				<option value="viewFactTrade">View Fact</option>
			</select>
			<button type="submit" class="btn btn-outline-secondary">Choose</button>
		</div>

		<div class="crud">
			<a href="EditCompany">
			<button type="button" class="btn btn-primary" name="buttonAddDelete" value="add">Add new</button>
			</a>
			<button type="submit" class="btn btn-danger" name="buttonAddDelete" value="delete">Delete</button>
		</div>
		<br></br>
		
		<div class="btn-page">
			<div class="gr-1">
				<button onClick="firstPageLogic()" id="firstPage" type="button"  class="btn">&lt;&lt;</button>
				<button onClick="previousPageLogic()" id="previousPage"  class="btn"
					type="button">&lt;</button>
			</div>

			<div class="gr-2">
				<button onClick="nextPageLogic('${endPage}')" id="nextPage" class="btn"
					type="button">&gt;</button>
				<button onClick="lastPageLogic('${endPage}')" id="lastPage" class="btn"
					type="button">&gt;&gt;</button>
			</div>
		</div>
		<!-- Hide All Chart -->
		<button type="button" onClick="hideChart()">hide</button>


		<!-- View Company -->
		<c:if test="${chooseView == 'viewCompany'}">

			<div class="form w-100">
				<h2>View Company List</h2>
				<table class="table ">
					<thead>
						<tr class="table-header">
							<th scope="col"><input type="checkbox" id="root" name="root"
								onChange="checkRoot()"></th>
							<th scope="col">ID</th>
							<th scope="col">Symbol</th>
							<th scope="col">Name</th>
							<th scope="col">Major</th>
							<th scope="col">Phone</th>
							<th scope="col">Info</th>
							<th scope="col">Address</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="item">

							<tr class="tr-son">
								<td scope="row"><input type="checkbox" id="node"
									onChange="checkNode()" name="node" value="${item.id}"></td>
								<td class="td-son"><a
									href="EditCompany?companyId=${item.id}">${item.id}</a></td>
								<td scope="row"><p>${item.symbol}</p></td>
								<td scope="row"><p>${item.name} </p> </td>
								<td scope="row"> <p>${item.major} </p> </td>
								<td scope="row"><p>${item.phone} </p> </td>
								<td scope="row"><p>${item.info} </p> </td>
								<td scope="row"><p> ${item.address}</p> </td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>

		</c:if>

		<!-- View Date -->
		<c:if test="${chooseView == 'viewDateTrade'}">

			<div class="from w-100">
				<h2>View Date Trade List</h2>
				<table class="table ">
					<thead>
						<tr class="table-header">
							<th scope="col"><input type="checkbox" id="root" name="root"
								onChange="checkRoot()"></th>
							<th scope="col">ID</th>
							<th scope="col">Date Trade</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="item">

							<tr class="tr-son">
								<td scope="row"><input type="checkbox" id="node"
									onChange="checkNode()" name="node" value="${item.id}"></td>
								<td scope="row"><a href="EditCompany?dateId=${item.id}">${item.id}</a></td>
								<td scope="row">${item.dateTrade}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</c:if>

		<!-- View Company -->
		<c:if test="${chooseView == 'viewFactTrade'}">

			<!-- Area Chart Analysis -->
			<div>
			<button type="button" onClick="totalVolumePieChart()">totalVolumePieChart</button>
			<button type="button" onClick="totalPricePieChart()">totalPriceChart</button>
			<button type="button" onClick="totalMarketCapitalizationPieChart()">totalMarketCapitalizationChart</button>
			<button type="button" onClick="totalVolumeBarChart()">totalVolumeBarChart</button>
			<button type="button" onClick="totalPriceBarChart()">totalPriceBarChart</button>
			<button type="button" onClick="totalMarketCapitalizationBarChart()">totalMarketCapitalizationBarChart</button>
			
			
		
			
			<div id="totalVolumePieChartArea" style="width:100%; max-width:600px; height:500px;display:none"></div>
			<div id="totalPricePieChartArea" style="width:100%; max-width:600px; height:500px;display:none"></div>
			<div id="totalMarketCapitalizationPieChartArea" style="width:100%; max-width:600px; height:500px;display:none"></div>
			<div id="totalVolumeBarChartArea"  style="width:100%;max-width:700px;display:none"></div>
			<div id="totalPriceBarChartArea"  style="width:100%;max-width:700px;display:none"></div>
			<div id="totalMarketCapitalizationBarChartArea"  style="width:100%;max-width:700px;display:none"></div>
			
			
			
			
			</div>
			<!-- Area Table Data -->
			<div class="form w-100">
				<h2>View Fact Trade List</h2>
				<table class="table ">
					<thead class="table-header">
						<tr>
							<th scope="col"><input type="checkbox" id="root" name="root"
								onChange="checkRoot()"></th>
							<th scope="col">ID</th>
							<th scope="col">Id Date</th>
							<th scope="col">Id Company</th>
							<th scope="col">Price Reference</th>
							<th scope="col">Price Open</th>
							<th scope="col">Price Close</th>
							<th scope="col">Price Ceiling</th>
							<th scope="col">Price Floor</th>
							<th scope="col">Mean</th>
							<th scope="col">Volatility</th>
							<th scope="col">Volatility Percent</th>
							<th scope="col">Total Volume</th>
							<th scope="col">Total Price</th>
							<th scope="col">Total Marketcapitalization</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="item">

							<tr class="tr-son">
								<td scope="row"><input type="checkbox" id="node"
									onChange="checkNode()" name="node" value="${item.id}"></td>
								<td class="td-son"><a
									href="EditCompany?factTradeId=${item.id}">${item.id}</a></td>
								<td scope="row">${item.id_date}</td>
								<td scope="row">${item.id_company}</td>
								<td scope="row">${item.price_reference}</td>
								<td scope="row">${item.price_open}</td>
								<td scope="row">${item.price_close}</td>
								<td scope="row">${item.price_ceiling}</td>
								<td scope="row">${item.price_floor}</td>
								<td scope="row">${item.mean}</td>
								<td scope="row">${item.volatility}</td>
								<td scope="row">${item.volatility_percent}</td>
								<td scope="row">${item.total_volume}</td>
								<td scope="row">${item.total_price}</td>
								<td scope="row">${item.total_marketcapitalization}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</c:if>
	</form>
	
<div id="totalVolumePieChartArea" style="width:100%; max-width:600px; height:500px;display:none"></div>
			<div id="totalPricePieChartArea" style="width:100%; max-width:600px; height:500px;display:none"></div>
			<div id="totalMarketCapitalizationPieChartArea" style="width:100%; max-width:600px; height:500px;display:none"></div>
			<div id="totalVolumeBarChartArea"  style="width:100%;max-width:700px;display:none"></div>
			<div id="totalPriceBarChartArea"  style="width:100%;max-width:700px;display:none"></div>
			<div id="totalMarketCapitalizationBarChartArea"  style="width:100%;max-width:700px;display:none"></div>
<script>
//Hide all chart
function hideChart(){
	document.getElementById("totalVolumePieChartArea").style.display="none";
	document.getElementById("totalPricePieChartArea").style.display="none";
	document.getElementById("totalMarketCapitalizationPieChartArea").style.display="none";
	document.getElementById("totalVolumeBarChartArea").style.display="none";
	document.getElementById("totalPriceBarChartArea").style.display="none";
	document.getElementById("totalMarketCapitalizationBarChartArea").style.display="none";

}

/* --------------Pie Chart Fact--------------*/
// In Here Have: Total Volume Chart, total Price Pie Chart and total Market Capitalization Pie Chart

//Show Total Volume Pie 
function totalVolumePieChart(){
	//Show Chart VoulmePie
	document.getElementById("totalVolumePieChartArea").style.display="block";
	//Hide Chart Con Lai
	document.getElementById("totalPricePieChartArea").style.display="none";
	document.getElementById("totalMarketCapitalizationPieChartArea").style.display="none";
	document.getElementById("totalVolumeBarChartArea").style.display="none";
	document.getElementById("totalPriceBarChartArea").style.display="none";
	document.getElementById("totalMarketCapitalizationBarChartArea").style.display="none";
	
	//Get String companyNameChart and add to array
	var companyNameChart = new Array();
	var companyNameTemp= "<%=request.getAttribute("companyNameDataChart") %>";
	companyNameChart = companyNameTemp.split(',');
	//Get String totalVolumeChart and add to array
	var totalVolumeChart = new Array();
	var totalVolumeChartTemp= "<%=request.getAttribute("totalVolumeDataChart") %>";

	totalVolumeChart = totalVolumeChartTemp.split(',');
	totalVolumeChart =totalVolumeChart.map(parseFloat); 
	
	//Mege 2 array tren thanh 1 array
	var chartFact = new Array();
	chartFact[0]= ['Company Name','Total Volume'];
	for (let i = 0; i < companyNameChart.length; i++) {
	chartFact[i+1] = [companyNameChart[i], totalVolumeChart[i]];
	}
	//Create chart Total Volume Pie
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable(chartFact,false);
		var options = {
	  	title:'All Total Volumn Company', 	
	};
	var chart = new google.visualization.PieChart(document.getElementById('totalVolumePieChartArea'));
  	chart.draw(data, options);
	}
}
	
//Show total Price Pie Chart 
function totalPricePieChart(){
	//Show total Price Pie Chart 
	document.getElementById("totalPricePieChartArea").style.display="block";
	//Hide Chart Con Lai
	document.getElementById("totalVolumePieChartArea").style.display="none";
	document.getElementById("totalMarketCapitalizationPieChartArea").style.display="none";
	document.getElementById("totalVolumeBarChartArea").style.display="none";
	document.getElementById("totalPriceBarChartArea").style.display="none";
	document.getElementById("totalMarketCapitalizationBarChartArea").style.display="none";
	//Get String companyNameChart and add to array
	var companyNameChart = new Array();
	var companyNameTemp= "<%=request.getAttribute("companyNameDataChart") %>";
	companyNameChart = companyNameTemp.split(',');
	//Get String totalVolumeChart and add to array
	var totalPriceChart = new Array();
	var totalPriceChartTemp= "<%=request.getAttribute("totalPriceDataChart") %>";
	totalPriceChart = totalPriceChartTemp.split(',');
	totalPriceChart =totalPriceChart.map(parseFloat); 
    //Mege 2 array tren thanh 1 array
	var chartFact = new Array();
	chartFact[0]= ['Company Name','Total Price'];
	for (let i = 0; i < companyNameChart.length; i++) {
	chartFact[i+1] = [companyNameChart[i], totalPriceChart[i]];
	}
	//Create chart
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable(chartFact,false);
		var options = {
		 title:'All Total Price Company', 	
		};
	var chart = new google.visualization.PieChart(document.getElementById('totalPricePieChartArea'));
	chart.draw(data, options);
	}	
}

//Show total MarketCapitalization Pie Chart 
function totalMarketCapitalizationPieChart(){
	//Show total MarketCapitalization Pie Chart 
	document.getElementById("totalMarketCapitalizationPieChartArea").style.display="block";
	
	//Hide Chart Con Lai
	document.getElementById("totalVolumePieChartArea").style.display="none";
	document.getElementById("totalPricePieChartArea").style.display="none";
	document.getElementById("totalVolumeBarChartArea").style.display="none";
	document.getElementById("totalPriceBarChartArea").style.display="none";
	document.getElementById("totalMarketCapitalizationBarChartArea").style.display="none";
		
	//Get String companyNameChart and add to array
	var companyNameChart = new Array();
	var companyNameTemp= "<%=request.getAttribute("companyNameDataChart") %>";
	companyNameChart = companyNameTemp.split(',');
	//Get String totalMarketCapitalizationChart and add to array
	var totalMarketCapitalizationChart = new Array();
	var totalMarketCapitalizationChartTemp= "<%=request.getAttribute("totalMarketCapitalizationDataChart") %>";
	totalMarketCapitalizationChart = totalMarketCapitalizationChartTemp.split(',');
	totalMarketCapitalizationChart =totalMarketCapitalizationChart.map(parseFloat); 
    //Mege 2 array tren thanh 1 array
	var chartFact = new Array();
	chartFact[0]= ['Company Name','Total Price'];
	for (let i = 0; i < companyNameChart.length; i++) {
	chartFact[i+1] = [companyNameChart[i], totalMarketCapitalizationChart[i]];
	}
	
	//Create chart
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable(chartFact,false);
		var options = {
		 title:'All Total MarketCapitalization Company', 	
		};
	var chart = new google.visualization.PieChart(document.getElementById('totalMarketCapitalizationPieChartArea'));
	chart.draw(data, options);
	}	
}
/* -------------------End Pie Chart Fact--------------------- */
 
 /* --------------Bar Chart Fact--------------*/
// In Here Have: Top 10: Total Volume , total Price  and total Market Capitalization bar chart

//Show Top 10 Total Volume Bar Chart 
function totalVolumeBarChart(){
	//Show Chart VoulmePie
	document.getElementById("totalVolumeBarChartArea").style.display="block";
	//Hide Chart Con Lai
	document.getElementById("totalVolumePieChartArea").style.display="none";
	document.getElementById("totalPricePieChartArea").style.display="none";
	document.getElementById("totalMarketCapitalizationPieChartArea").style.display="none";
	document.getElementById("totalPriceBarChartArea").style.display="none";
	document.getElementById("totalMarketCapitalizationBarChartArea").style.display="none";
	//Get String companyNameChart and add to array
	var companyNameChart = new Array();
	var companyNameTemp= "<%=request.getAttribute("companyNameDataChart") %>";
	companyNameChart = companyNameTemp.split(',');
	//Get String totalVolumeChart and add to array
	var totalVolumeChart = new Array();
	var totalVolumeChartTemp= "<%=request.getAttribute("totalVolumeDataChart") %>";
	totalVolumeChart = totalVolumeChartTemp.split(',');
	totalVolumeChart =totalVolumeChart.map(parseFloat); 
	totalVolumeChartArrayTemp = totalVolumeChart.map(parseFloat); 
	//var max_totalVolumeChart = Math.max.apply(Math, totalVolumeChart);
	var countTop=0;
	var top10IndexTotalVolumeChart= new Array();
	
	//Loop get top 10 index with is max total volume
	while(countTop<10){
		var maxIndex= -1;
		var max_totalVolumeChart =totalVolumeChartArrayTemp[0];
		for(let i=0;i<totalVolumeChartArrayTemp.length;i++){
			if(max_totalVolumeChart<=totalVolumeChartArrayTemp[i] ){
				//Truong hop trong co phan tu >= max value
				max_totalVolumeChart = totalVolumeChartArrayTemp[i];
				maxIndex=i;
			}
		}
		if(maxIndex != -1){
			//Truong hop co maxIndex
			console.log(maxIndex);
			top10IndexTotalVolumeChart[countTop]= maxIndex;
			totalVolumeChartArrayTemp[maxIndex] = -1;
			countTop++;
		}
	}
	
	var data = [{
	  x: [
		  companyNameChart[top10IndexTotalVolumeChart[9]],
		  companyNameChart[top10IndexTotalVolumeChart[8]],
		  companyNameChart[top10IndexTotalVolumeChart[7]],
	      companyNameChart[top10IndexTotalVolumeChart[6]],
	      companyNameChart[top10IndexTotalVolumeChart[5]],
	      companyNameChart[top10IndexTotalVolumeChart[4]],
	      companyNameChart[top10IndexTotalVolumeChart[3]],
	      companyNameChart[top10IndexTotalVolumeChart[2]],
		  companyNameChart[top10IndexTotalVolumeChart[1]],
		  companyNameChart[top10IndexTotalVolumeChart[0]],
		  ],
	  y: [
		  totalVolumeChart[top10IndexTotalVolumeChart[9]],
		  totalVolumeChart[top10IndexTotalVolumeChart[8]],
		  totalVolumeChart[top10IndexTotalVolumeChart[7]],
		  totalVolumeChart[top10IndexTotalVolumeChart[6]],
		  totalVolumeChart[top10IndexTotalVolumeChart[5]],
		  totalVolumeChart[top10IndexTotalVolumeChart[4]],
		  totalVolumeChart[top10IndexTotalVolumeChart[3]],
		  totalVolumeChart[top10IndexTotalVolumeChart[2]],
		  totalVolumeChart[top10IndexTotalVolumeChart[1]],
		  totalVolumeChart[top10IndexTotalVolumeChart[0]],
	  	],
	  type: "bar"  }];
	var layout = {title:"Top 10 Total Volume"};

	Plotly.newPlot("totalVolumeBarChartArea", data, layout);  
}


//Show Top 10 Total Price Bar Chart 
function totalPriceBarChart(){
	//Show Chart VoulmePie
	document.getElementById("totalPriceBarChartArea").style.display="block";
	//Hide Chart Con Lai
	document.getElementById("totalVolumePieChartArea").style.display="none";
	document.getElementById("totalPricePieChartArea").style.display="none";
	document.getElementById("totalMarketCapitalizationPieChartArea").style.display="none";
	document.getElementById("totalVolumeBarChartArea").style.display="none";
	document.getElementById("totalMarketCapitalizationBarChartArea").style.display="none";
	//Get String companyNameChart and add to array
	var companyNameChart = new Array();
	var companyNameTemp= "<%=request.getAttribute("companyNameDataChart") %>";
	companyNameChart = companyNameTemp.split(',');
	//Get String totalPriceChart and add to array
	var totalChart = new Array();
	var totalPriceChartTemp= "<%=request.getAttribute("totalPriceDataChart") %>";
	totalPriceChart = totalPriceChartTemp.split(',');
	totalPriceChart =totalPriceChart.map(parseFloat); 
	totalPriceChartArrayTemp = totalPriceChart.map(parseFloat); 

	var countTop=0;
	var top10IndexTotalPriceChart= new Array();
	
	//Loop get top 10 index with is max total Price
	while(countTop<10){
		var maxIndex= -1;
		var max_totalPriceChart =totalPriceChartArrayTemp[0];
		for(let i=0;i<totalPriceChartArrayTemp.length;i++){
			if(max_totalPriceChart<=totalPriceChartArrayTemp[i] ){
				//Truong hop trong co phan tu >= max value
				max_totalPriceChart = totalPriceChartArrayTemp[i];
				maxIndex=i;
			}
		}
		if(maxIndex != -1){
			//Truong hop co maxIndex
			console.log(maxIndex);
			top10IndexTotalPriceChart[countTop]= maxIndex;
			totalPriceChartArrayTemp[maxIndex] = -1;
			countTop++;
		}
	}
	
	var data = [{
	  x: [
		  companyNameChart[top10IndexTotalPriceChart[9]],
		  companyNameChart[top10IndexTotalPriceChart[8]],
		  companyNameChart[top10IndexTotalPriceChart[7]],
	      companyNameChart[top10IndexTotalPriceChart[6]],
	      companyNameChart[top10IndexTotalPriceChart[5]],
	      companyNameChart[top10IndexTotalPriceChart[4]],
	      companyNameChart[top10IndexTotalPriceChart[3]],
	      companyNameChart[top10IndexTotalPriceChart[2]],
		  companyNameChart[top10IndexTotalPriceChart[1]],
		  companyNameChart[top10IndexTotalPriceChart[0]],
		  ],
	  y: [
		  totalPriceChart[top10IndexTotalPriceChart[9]],
		  totalPriceChart[top10IndexTotalPriceChart[8]],
		  totalPriceChart[top10IndexTotalPriceChart[7]],
		  totalPriceChart[top10IndexTotalPriceChart[6]],
		  totalPriceChart[top10IndexTotalPriceChart[5]],
		  totalPriceChart[top10IndexTotalPriceChart[4]],
		  totalPriceChart[top10IndexTotalPriceChart[3]],
		  totalPriceChart[top10IndexTotalPriceChart[2]],
		  totalPriceChart[top10IndexTotalPriceChart[1]],
		  totalPriceChart[top10IndexTotalPriceChart[0]],
	  	],
	  type: "bar"  }];
	var layout = {title:"Top 10 Total Price"};

	Plotly.newPlot("totalPriceBarChartArea", data, layout);  
}


//Show Top 10 Total MarketCapitalization Bar Chart 
function totalMarketCapitalizationBarChart(){
	//Show Chart VoulmePie
	document.getElementById("totalMarketCapitalizationBarChartArea").style.display="block";
	//Hide Chart Con Lai
	document.getElementById("totalVolumePieChartArea").style.display="none";
	document.getElementById("totalPricePieChartArea").style.display="none";
	document.getElementById("totalMarketCapitalizationPieChartArea").style.display="none";
	document.getElementById("totalVolumeBarChartArea").style.display="none";
	document.getElementById("totalPriceBarChartArea").style.display="none";
	//Get String companyNameChart and add to array
	var companyNameChart = new Array();
	var companyNameTemp= "<%=request.getAttribute("companyNameDataChart") %>";
	companyNameChart = companyNameTemp.split(',');
	//Get String totalMarketCapitalizationChart and add to array
	var totalChart = new Array();
	var totalMarketCapitalizationChartTemp= "<%=request.getAttribute("totalMarketCapitalizationDataChart") %>";
	totalMarketCapitalizationChart = totalMarketCapitalizationChartTemp.split(',');
	totalMarketCapitalizationChart =totalMarketCapitalizationChart.map(parseFloat); 
	totalMarketCapitalizationChartArrayTemp = totalMarketCapitalizationChart.map(parseFloat); 

	var countTop=0;
	var top10IndexTotalMarketCapitalizationChart= new Array();
	
	//Loop get top 10 index with is max total Price
	while(countTop<10){
		var maxIndex= -1;
		var max_totalMarketCapitalizationChart =totalMarketCapitalizationChartArrayTemp[0];
		for(let i=0;i<totalMarketCapitalizationChartArrayTemp.length;i++){
			if(max_totalMarketCapitalizationChart<=totalMarketCapitalizationChartArrayTemp[i] ){
				//Truong hop trong co phan tu >= max value
				max_totalMarketCapitalizationChart = totalMarketCapitalizationChartArrayTemp[i];
				maxIndex=i;
			}
		}
		if(maxIndex != -1){
			//Truong hop co maxIndex
			console.log(maxIndex);
			top10IndexTotalMarketCapitalizationChart[countTop]= maxIndex;
			totalMarketCapitalizationChartArrayTemp[maxIndex] = -1;
			countTop++;
		}
	}
	
	var data = [{
	  x: [
		  companyNameChart[top10IndexTotalMarketCapitalizationChart[9]],
		  companyNameChart[top10IndexTotalMarketCapitalizationChart[8]],
		  companyNameChart[top10IndexTotalMarketCapitalizationChart[7]],
	      companyNameChart[top10IndexTotalMarketCapitalizationChart[6]],
	      companyNameChart[top10IndexTotalMarketCapitalizationChart[5]],
	      companyNameChart[top10IndexTotalMarketCapitalizationChart[4]],
	      companyNameChart[top10IndexTotalMarketCapitalizationChart[3]],
	      companyNameChart[top10IndexTotalMarketCapitalizationChart[2]],
		  companyNameChart[top10IndexTotalMarketCapitalizationChart[1]],
		  companyNameChart[top10IndexTotalMarketCapitalizationChart[0]],
		  ],
	  y: [
		  totalMarketCapitalizationChart[top10IndexTotalMarketCapitalizationChart[9]],
		  totalMarketCapitalizationChart[top10IndexTotalMarketCapitalizationChart[8]],
		  totalMarketCapitalizationChart[top10IndexTotalMarketCapitalizationChart[7]],
		  totalMarketCapitalizationChart[top10IndexTotalMarketCapitalizationChart[6]],
		  totalMarketCapitalizationChart[top10IndexTotalMarketCapitalizationChart[5]],
		  totalMarketCapitalizationChart[top10IndexTotalMarketCapitalizationChart[4]],
		  totalMarketCapitalizationChart[top10IndexTotalMarketCapitalizationChart[3]],
		  totalMarketCapitalizationChart[top10IndexTotalMarketCapitalizationChart[2]],
		  totalMarketCapitalizationChart[top10IndexTotalMarketCapitalizationChart[1]],
		  totalMarketCapitalizationChart[top10IndexTotalMarketCapitalizationChart[0]],
	  	],
	  type: "bar"  }];
	var layout = {title:"Top 10 Total MarketCapitalization"};

	Plotly.newPlot("totalMarketCapitalizationBarChartArea", data, layout);  
}
</script>
</body>

</html>


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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/Chart.css">

<script language="javascript"
	src="<%=request.getContextPath()%>/js/Search.js"></script>


<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Raleway:wght@700;900&display=swap"
	rel="stylesheet" />


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body onload="checkView('${chooseView}','${endPage}')">
	<form action="SearchCompany" id="ViewCompany" method="post"
		onsubmit="listNodeCheckedLogic()" class="form-login">
		<!-- menucustorm -->
		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<ul>
				<li><a class="navbar-brand">Hello ${userName}</a></li>
				<li><a class="navbar-brand">Menu Chart</a>
					<ul>
						<li><button type="button" id="btn-chart" class="stats-btn"
								onClick="totalVolumePieChart()">Total Volume Pie Chart</button></li>
						<li><button type="button" id="btn-chart" class="stats-btn1"
								onClick="totalPricePieChart()">Total Price Chart</button></li>
						<li><button type="button" id="btn-chart" class="stats-btn2"
								onClick="totalMarketCapitalizationPieChart()">Total Market Capitalization Chart</button></li>
						<li><button type="button" id="btn-chart" class="stats-btn3"
								onClick="totalVolumeBarChart()">Total Volume Bar Chart</button></li>
						<li><button type="button" id="btn-chart" class="stats-btn4"
								onClick="totalPriceBarChart()">Total Price Bar Chart</button></li>
						<li><button type="button" id="btn-chart" class="stats-btn5"
								onClick="totalMarketCapitalizationBarChart()">Total Market Capitalization Bar Chart</button></li>
						<li><button type="button" id="btn-chart" class="stats-btn6"
								onClick="totalOrderBuySellPieChart()">Total Order Buy Sell Pie Chart</button></li>
						<li><button type="button" id="btn-chart" class="stats-btn7"
								onClick="totalVolumeBuySellPieChart()">Total Volume Buy Sell Pie Chart</button></li>
						<li><button type="button" id="btn-chart" class="stats-btn8"
								onClick="totalRoomRoomAvailablePieChart()">Total Room Available Pie Chart</button></li>
					</ul></li>
				<li><a href="Login" class="logout navbar-brand">Logout</a></li>
			</ul>
		</div>




		<div class="popup-container" id="popup-container">
			<div class="popup-content" id="popup-content">
				<div class="chart-container" id="chart-container">
					<div id="totalVolumePieChartArea" class="pieChart"></div>
				</div>
				<div class="close-btn" id="close-btn">
					<button class="btn-quick" onclick="hideChart()">&times;</button>
				</div>
			</div>
		</div>

		<div class="popup-container1" id="popup-container1">
			<div class="popup-content1">
				<div class="chart-container1">
					<div id="totalPricePieChartArea" class="pieChart"></div>
				</div>
				<div class="close-btn1" id="close-btn1">
					<button class="btn-quick" onclick="hideChart()">&times;</button>
				</div>
			</div>
		</div>

		<div class="popup-container2" id="popup-container2">
			<div class="popup-content2">
				<div class="chart-container2">
					<div id="totalMarketCapitalizationPieChartArea" class="pieChart"></div>
				</div>
				<div class="close-btn2" id="close-btn2">
					<button class="btn-quick" onclick="hideChart()">&times;</button>
				</div>
			</div>
		</div>
		<div class="popup-container3" id="popup-container3">
			<div class="popup-content3">
				<div class="chart-container3">
					<div id="totalVolumeBarChartArea" class="barChart"></div>
				</div>
				<div class="close-btn3" id="close-btn3">
					<button class="btn-quick" onclick="hideChart()">&times;</button>
				</div>
			</div>
		</div>
		<div class="popup-container4" id="popup-container4">
			<div class="popup-content4">
				<div class="chart-container4">
					<div id="totalPriceBarChartArea" class="barChart"></div>
				</div>
				<div class="close-btn4" id="close-btn4">
					<button class="btn-quick" onclick="hideChart()">&times;</button>
				</div>
			</div>
		</div>
		<div class="popup-container5" id="popup-container5">
			<div class="popup-content5">
				<div class="chart-container5">
					<div id="totalMarketCapitalizationBarChartArea" class="barChart"></div>
				</div>
				<div class="close-btn5" id="close-btn5">
					<button class="btn-quick" onclick="hideChart()">&times;</button>
				</div>
			</div>
		</div>

		<div class="popup-container6" id="popup-container6">
			<div class="popup-content6">
				<div class="chart-container6">
					<div id="totalOrderBuySellPieChartArea" class="pieChart"></div>
				</div>
				<div class="close-btn6" id="close-btn6">
					<button class="btn-quick" onclick="hideChart()">&times;</button>
				</div>
			</div>
		</div>

		<div class="popup-container7" id="popup-container7">
			<div class="popup-content7">
				<div class="chart-container7">
					<div id="totalVolumeBuySellPieChartArea" class="pieChart"></div>
				</div>
				<div class="close-btn7" id="close-btn7">
					<button class="btn-quick" onclick="hideChart()">&times;</button>
				</div>
			</div>
		</div>

		<div class="popup-container8" id="popup-container8">
			<div class="popup-content8">
				<div class="chart-container8">
					<div id="totalRoomRoomAvailablePieChartArea" class="pieChart"></div>
				</div>
				<div class="close-btn8" id="close-btn8">
					<button class="btn-quick" onclick="hideChart()">&times;</button>
				</div>
			</div>
		</div>

		<input type="hidden" id="page" name="page" ReadOnly value="${page}" />
		<input type="hidden" id="endPage" name="endPage" ReadOnly
			value="${endPage}" /> <input type="hidden" id="listNodeChecked"
			name="listNodeChecked" ReadOnly value="" />
		<div class="select">
			<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776;</span>
			<img src="<%=request.getContextPath()%>/img/STOCKtrade1.png"
				width="75px" height="75px" alt="logo"> <label for="cars">ChooseView:</label>
			<select name="chooseView" id="chooseView" class="form-select"
				aria-label="Default select example">
				<option value="viewCompany">View Company</option>
				<option value="viewExchange">View Exchange</option>
				<option value="viewDateTrade">View Date</option>
				<option value="viewFactTrade">View Fact Trade</option>
				<option value="viewFactBusinessResult">View Business Result</option>
				<option value="viewFactStockOrder">View Stock Order</option>
				<option value="viewFactForeignInvestorAuction">View Fact
					Foreign Investor Auction</option>
			</select>
			<button type="submit" class="btn btn-choose">Choose</button>
			<div class="crud">
				<a href="EditCompany">
					<button type="button" class="btn btn-primary"
						name="buttonAddDelete">Add new</button>
				</a>
				<button type="submit" class="btn btn-danger" name="buttonDelete"
					value="delete">Delete</button>
			</div>
		</div>

		<div class="btn-page">
			<div class="gr-1">
				<button onClick="firstPageLogic()" id="firstPage" type="button"
					class="btn">&lt;&lt;</button>
				<button onClick="previousPageLogic()" id="previousPage" class="btn"
					type="button">&lt;</button>
			</div>

			<div class="gr-2">
				<button onClick="nextPageLogic('${endPage}')" id="nextPage"
					class="btn" type="button">&gt;</button>
				<button onClick="lastPageLogic('${endPage}')" id="lastPage"
					class="btn" type="button">&gt;&gt;</button>
			</div>

			<!-- Search Page -->

			<div class="search-container">
				<form>
					<input type="text" name="search" placeholder="Search"
						id="input-search" />
					<button type="submit">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</div>

			<!-- View Company -->
			<c:if test="${chooseView == 'viewCompany'}">

				<div class="form w-100 animate-bottom" id="myDiv">
					<h2>View Company List</h2>
					<table class="table ">
						<thead>
							<tr class="table-header">
								<th scope="col"><input type="checkbox" id="root"
									name="root" onChange="checkRoot()"></th>
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
									<td scope="row"><p>${item.name}</p></td>
									<td scope="row">
										<p>${item.major}</p>
									</td>
									<td scope="row"><p>${item.phone}</p></td>
									<td scope="row"><p>${item.info}</p></td>
									<td scope="row"><p>${item.address}</p></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>

				</div>
		</div>

		</c:if>
		<!-- View Exchange -->
		<c:if test="${chooseView == 'viewExchange'}">

			<div class="form w-100 animate-bottom" id="myDiv">
				<h2>View Exchange List</h2>
				<table class="table ">
					<thead>
						<tr class="table-header">
							<th scope="col"><input type="checkbox" id="root" name="root"
								onChange="checkRoot()"></th>
							<th scope="col">ID</th>
							<th scope="col">Symbol</th>
							<th scope="col">Name</th>
							<th scope="col">Info</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="item">

							<tr class="tr-son">
								<td scope="row"><input type="checkbox" id="node"
									onChange="checkNode()" name="node" value="${item.id}"></td>
								<td class="td-son"><a
									href="EditCompany?exchangeId=${item.id}">${item.id}</a></td>
								<td scope="row"><p>${item.symbol}</p></td>
								<td scope="row"><p>${item.name}</p></td>
								<td scope="row"><p>${item.info}</p></td>

							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>

		</c:if>

		<!-- View Date -->
		<c:if test="${chooseView == 'viewDateTrade'}">

			<div class="form w-100 animate-bottom" id="myDiv">
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
								<td scope="row"><a
									href="EditCompany?dateTradeId=${item.id}">${item.id}</a></td>
								<td scope="row">${item.dateTrade}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</c:if>

		<!-- View Fact Trade -->
		<c:if test="${chooseView == 'viewFactTrade'}">

			<div class="form w-100 animate-bottom" id="myDiv">
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
								<td scope="row">${item.dateTrade}</td>
								<td scope="row">${item.companyName}</td>
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
		<!-- View Fact BusinessResult -->
		<c:if test="${chooseView == 'viewFactBusinessResult'}">

			<div class="form w-100 animate-bottom" id="myDiv">
				<h2>View Fact Business Result List</h2>
				<table class="table ">
					<thead class="table-header">
						<tr>
							<th scope="col"><input type="checkbox" id="root" name="root"
								onChange="checkRoot()"></th>
							<th scope="col">ID</th>
							<th scope="col">Date Trade</th>
							<th scope="col">Company Name</th>
							<th scope="col">Exchange Name</th>
							<th scope="col">Status</th>
							<th scope="col">Profit</th>
							<th scope="col">Previous Period</th>
							<th scope="col">Same Period</th>
							<th scope="col">Profit Cummulative</th>
							<th scope="col">Eps Profit</th>
							<th scope="col">Eps Cummulative</th>
							<th scope="col">Price Earning Ratio</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="item">

							<tr class="tr-son">
								<td scope="row"><input type="checkbox" id="node"
									onChange="checkNode()" name="node" value="${item.id}"></td>
								<td class="td-son"><a
									href="EditCompany?factBusinessResultId=${item.id}">${item.id}</a></td>
								<td scope="row">${item.dateTrade}</td>
								<td scope="row">${item.companyName}</td>
								<td scope="row">${item.exchangeName}</td>
								<td scope="row">${item.status}</td>
								<td scope="row">${item.profit}</td>
								<td scope="row">${item.previous_period}</td>
								<td scope="row">${item.same_period}</td>
								<td scope="row">${item.profit_cummulative}</td>
								<td scope="row">${item.eps_profit}</td>
								<td scope="row">${item.eps_cummulative}</td>
								<td scope="row">${item.price_earning_ratio}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</c:if>

		<!-- View Fact StockOrder -->
		<c:if test="${chooseView == 'viewFactStockOrder'}">

			<div class="form w-100 animate-bottom" id="myDiv">
				<h2>View Fact Stock Order List</h2>
				<table class="table ">
					<thead class="table-header">
						<tr>
							<th scope="col"><input type="checkbox" id="root" name="root"
								onChange="checkRoot()"></th>
							<th scope="col">ID</th>
							<th scope="col">Date Stock Order</th>
							<th scope="col">Company Name</th>
							<th scope="col">Price Close</th>
							<th scope="col">Total Volume Auction</th>
							<th scope="col">Total Price Auction</th>
							<th scope="col">Best Buy Price</th>
							<th scope="col">Best Buy Volume</th>
							<th scope="col">Best Sell Price</th>
							<th scope="col">Best Sell Volume</th>
							<th scope="col">Total Order Buy</th>
							<th scope="col">Total Order Sell</th>
							<th scope="col">Total Order Buy Minus Sell</th>
							<th scope="col">Total Volume Buy</th>
							<th scope="col">Total Volume Sell</th>
							<th scope="col">Total Volume Buy Minus Sell</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="item">

							<tr class="tr-son">
								<td scope="row"><input type="checkbox" id="node"
									onChange="checkNode()" name="node" value="${item.id}"></td>
								<td class="td-son"><a
									href="EditCompany?factStockOrderId=${item.id}">${item.id}</a></td>
								<td scope="row">${item.dateStockOrder}</td>
								<td scope="row">${item.companyName}</td>
								<td scope="row">${item.price_close}</td>
								<td scope="row">${item.total_volume_auction}</td>
								<td scope="row">${item.total_price_auction}</td>
								<td scope="row">${item.best_buy_price}</td>
								<td scope="row">${item.best_buy_volume}</td>
								<td scope="row">${item.best_sell_price}</td>
								<td scope="row">${item.best_sell_volume}</td>
								<td scope="row">${item.total_order_buy}</td>
								<td scope="row">${item.total_order_sell}</td>
								<td scope="row">${item.total_order_buy_minus_sell}</td>
								<td scope="row">${item.total_volume_buy}</td>
								<td scope="row">${item.total_volume_sell}</td>
								<td scope="row">${item.total_volume_buy_minus_sell}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</c:if>

		<!-- View Fact Foreign Investor Auction -->
		<c:if test="${chooseView == 'viewFactForeignInvestorAuction'}">

			<div class="form w-100 animate-bottom" id="myDiv">
				<h2>View Fact Foreign Investor Auction List</h2>
				<table class="table ">
					<thead class="table-header">
						<tr>
							<th scope="col"><input type="checkbox" id="root" name="root"
								onChange="checkRoot()"></th>
							<th scope="col">ID</th>
							<th scope="col">Date Auction</th>
							<th scope="col">Company Name</th>
							<th scope="col">Room</th>
							<th scope="col">Percent Owned</th>
							<th scope="col">Room Available</th>
							<th scope="col">Percent Room Available</th>
							<th scope="col">Buy Volume Auction</th>
							<th scope="col">Percent Buy Volume Auction Market</th>
							<th scope="col">Sell Volume Auction</th>
							<th scope="col">Percent Sell Volume Auction Market</th>
							<th scope="col">Buy Price Auction</th>
							<th scope="col">Percent Buy Price Auction Market</th>
							<th scope="col">Sell Price Auction</th>
							<th scope="col">Percent Sell Price Auction Market</th>
							<th scope="col">Difference Volume</th>
							<th scope="col">Difference Price</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="item">

							<tr class="tr-son">
								<td scope="row"><input type="checkbox" id="node"
									onChange="checkNode()" name="node" value="${item.id}"></td>
								<td class="td-son"><a
									href="EditCompany?factForeignInvestorAuctionId=${item.id}">${item.id}</a></td>
								<td scope="row">${item.dateAuction}</td>
								<td scope="row">${item.companyName}</td>
								<td scope="row">${item.room}</td>
								<td scope="row">${item.percent_owned}</td>
								<td scope="row">${item.room_available}</td>
								<td scope="row">${item.percent_room_available}</td>
								<td scope="row">${item.buy_volume_auction}</td>
								<td scope="row">${item.percent_buy_volume_auction_market}</td>
								<td scope="row">${item.sell_volume_auction}</td>
								<td scope="row">${item.percent_sell_volume_auction_market}</td>
								<td scope="row">${item.buy_price_auction}</td>
								<td scope="row">${item.percent_buy_price_auction_market}</td>
								<td scope="row">${item.sell_price_auction}</td>
								<td scope="row">${item.percent_sell_price_auction_market}</td>
								<td scope="row">${item.difference_volume}</td>
								<td scope="row">${item.difference_price}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</c:if>

	</form>



	<script>
//Hide all chart
function hideChart(){
	document.getElementById("totalVolumePieChartArea").style.display="none";
	document.getElementById("totalPricePieChartArea").style.display="none";
	document.getElementById("totalMarketCapitalizationPieChartArea").style.display="none";
	document.getElementById("totalVolumeBarChartArea").style.display="none";
	document.getElementById("totalPriceBarChartArea").style.display="none";
	document.getElementById("totalMarketCapitalizationBarChartArea").style.display="none";
	document.getElementById("totalOrderBuySellPieChartArea").style.display="none";
	document.getElementById("totalVolumeBuySellPieChartArea").style.display="none";
	document.getElementById("totalRoomRoomAvailablePieChartArea").style.display="none";
	
}
//Hide chart loai tru chart duoc truyen vao
function hideChartByValue(notHideChart){
	const charts = ["totalVolumePieChartArea", "totalPricePieChartArea", "totalMarketCapitalizationPieChartArea", "totalVolumeBarChartArea", 
		"totalPriceBarChartArea", "totalMarketCapitalizationBarChartArea","totalOrderBuySellPieChartArea", 
		"totalVolumeBuySellPieChartArea","totalRoomRoomAvailablePieChartArea"];
	for (let i = 0; i < charts.length; i++) {
	  if(notHideChart !== charts[i]){
		  document.getElementById(charts[i]).style.display="none";
	  }
	}

	
}

/* --------------Pie Chart Fact--------------*/
// In Here Have: Total Volume Chart, total Price Pie Chart and total Market Capitalization Pie Chart

//Show Total Volume Pie 
function totalVolumePieChart(){
	//Show Chart VoulmePie
	document.getElementById("totalVolumePieChartArea").style.display="block";
	//Hide Chart Con Lai
	hideChartByValue("totalVolumePieChartArea");
	
	//Get String companyNameChart and add to array
	var companyNameChart = new Array();
	var companyNameTemp= "<%=request.getAttribute("companyNameDataChart")%>";
	companyNameChart = companyNameTemp.split(',');
	//Get String totalVolumeChart and add to array
	var totalVolumeChart = new Array();
	var totalVolumeChartTemp= "<%=request.getAttribute("totalVolumeDataChart")%>";

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
	hideChartByValue("totalPricePieChartArea");
	//Get String companyNameChart and add to array
	var companyNameChart = new Array();
	var companyNameTemp= "<%=request.getAttribute("companyNameDataChart")%>";
	companyNameChart = companyNameTemp.split(',');
	//Get String totalVolumeChart and add to array
	var totalPriceChart = new Array();
	var totalPriceChartTemp= "<%=request.getAttribute("totalPriceDataChart")%>";
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
	hideChartByValue("totalMarketCapitalizationPieChartArea");

		
	//Get String companyNameChart and add to array
	var companyNameChart = new Array();
	var companyNameTemp= "<%=request.getAttribute("companyNameDataChart")%>";
	companyNameChart = companyNameTemp.split(',');
	//Get String totalMarketCapitalizationChart and add to array
	var totalMarketCapitalizationChart = new Array();
	var totalMarketCapitalizationChartTemp= "<%=request.getAttribute("totalMarketCapitalizationDataChart")%>";
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
//Show total Order Buy And Sell Pie Chart 
function totalOrderBuySellPieChart(){
	//Show total Order Buy And Sell Pie Chart 
	document.getElementById("totalOrderBuySellPieChartArea").style.display="block";
	
	//Hide Chart Con Lai
	hideChartByValue("totalOrderBuySellPieChartArea");

		
	//Get String total Order Buy and add to array
	var totalOrderBuyChart = new Array();
	var totalOrderBuyChartTemp= "<%=request.getAttribute("totalOrderBuyDataChart")%>";
	totalOrderBuyChart = totalOrderBuyChartTemp.split(',');
	totalOrderBuyChart =totalOrderBuyChart.map(parseFloat); 
	let sumTotalOrderBuy = 0;
	for (const value of totalOrderBuyChart) {
		sumTotalOrderBuy += value;
	}
	
	//Get String total Order Sell and add to array
	var totalOrderSellChart = new Array();
	var totalOrderSellChartTemp= "<%=request.getAttribute("totalOrderSellDataChart")%>";
	totalOrderSellChart = totalOrderSellChartTemp.split(',');
	totalOrderSellChart =totalOrderSellChart.map(parseFloat); 
	
	let sumTotalOrderSell = 0;
	for (const value of totalOrderSellChart) {
		sumTotalOrderSell += value;
	}
	
	//Create chart
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable(
				[
					  ['Buy-Sell', 'Total'],
					  ['Stock Buy',sumTotalOrderBuy],
					  ['Stock Sell',sumTotalOrderSell],
					]
				,false);
		var options = {
		 title:'Total Buy Sell Order', 	
		};
	var chart = new google.visualization.PieChart(document.getElementById('totalOrderBuySellPieChartArea'));
	chart.draw(data, options);
	}	
}

//Show total Volume Buy And Sell Pie Chart 
function totalVolumeBuySellPieChart(){
	//Show total Volume Buy And Sell Pie Chart 
	document.getElementById("totalVolumeBuySellPieChartArea").style.display="block";
	
	//Hide Chart Con Lai
	hideChartByValue("totalVolumeBuySellPieChartArea");

	
	//Get String total Volume Buy and add to array
	var totalVolumeBuyChart = new Array();
	var totalVolumeBuyChartTemp= "<%=request.getAttribute("totalVolumeBuyDataChart")%>";
	totalVolumeBuyChart = totalVolumeBuyChartTemp.split(',');
	totalVolumeBuyChart =totalVolumeBuyChart.map(parseFloat); 
	let sumTotalVolumeBuy = 0;
	for (const value of totalVolumeBuyChart) {
		sumTotalVolumeBuy += value;
	}
	
	//Get String  total Volume sell and add to array
	var totalVolumeSellChart = new Array();
	var totalVolumeSellChartTemp= "<%=request.getAttribute("totalVolumeSellDataChart")%>";
	totalVolumeSellChart = totalVolumeSellChartTemp.split(',');
	totalVolumeSellChart =totalVolumeSellChart.map(parseFloat); 
	
	let sumTotalVolumeSell = 0;
	for (const value of totalVolumeSellChart) {
		sumTotalVolumeSell += value;
	}
	
	//Create chart
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable(
				[
					  ['Buy-Sell', 'Total'],
					  ['Volume Buy',sumTotalVolumeBuy],
					  ['Volume Sell',sumTotalVolumeSell],
					]
				,false);
		var options = {
		 title:'Total Buy Sell Volume', 	
		};
	var chart = new google.visualization.PieChart(document.getElementById('totalVolumeBuySellPieChartArea'));
	chart.draw(data, options);
	}	
}

//Show total room And roomAvailable Pie Chart 
function totalRoomRoomAvailablePieChart(){
	//Show total Room and Room Abailable Pie Chart 
	document.getElementById("totalRoomRoomAvailablePieChartArea").style.display="block";
	
	//Hide Chart Con Lai
	hideChartByValue("totalRoomRoomAvailablePieChartArea");

	//Get String total room and add to array
	var totalRoomChart = new Array();
	var totalRoomChartTemp= "<%=request.getAttribute("roomDataChart")%>";
	totalRoomChart = totalRoomChartTemp.split(',');
	totalRoomChart =totalRoomChart.map(parseFloat); 
	let sumTotalRoom = 0;
	for (const value of totalRoomChart) {
		sumTotalRoom += value;
	}
	
	//Get String  total Volume sell and add to array
	var totalRoomAvailableChart = new Array();
	var totalRoomAvailableChartTemp= "<%=request.getAttribute("roomAvailableDataChart")%>";
	totalRoomAvailableChart = totalRoomAvailableChartTemp.split(',');
	totalRoomAvailableChart =totalRoomAvailableChart.map(parseFloat); 
	
	let sumtotalRoomAvailable = 0;
	for (const value of totalRoomAvailableChart) {
		sumtotalRoomAvailable += value;
	}
	
	//Create chart
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable(
				[
					  ['Room - Room Available', 'Total'],
					  ['Total Room',sumTotalRoom],
					  ['Total Room Available',sumtotalRoomAvailable],
					]
				,false);
		var options = {
		 title:'Total Room - Room Available', 	
		};
	var chart = new google.visualization.PieChart(document.getElementById('totalRoomRoomAvailablePieChartArea'));
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
		hideChartByValue("totalVolumeBarChartArea");

	//Get String companyNameChart and add to array
	var companyNameChart = new Array();
	var companyNameTemp= "<%=request.getAttribute("companyNameDataChart")%>";
	companyNameChart = companyNameTemp.split(',');
	//Get String totalVolumeChart and add to array
	var totalVolumeChart = new Array();
	var totalVolumeChartTemp= "<%=request.getAttribute("totalVolumeDataChart")%>";
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
	hideChartByValue("totalPriceBarChartArea");

	//Get String companyNameChart and add to array
	var companyNameChart = new Array();
	var companyNameTemp= "<%=request.getAttribute("companyNameDataChart")%>";
	companyNameChart = companyNameTemp.split(',');
	//Get String totalPriceChart and add to array
	var totalChart = new Array();
	var totalPriceChartTemp= "<%=request.getAttribute("totalPriceDataChart")%>";
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
	hideChartByValue("totalMarketCapitalizationBarChartArea");


	//Get String companyNameChart and add to array
	var companyNameChart = new Array();
	var companyNameTemp= "<%=request.getAttribute("companyNameDataChart")%>";
	companyNameChart = companyNameTemp.split(',');
	//Get String totalMarketCapitalizationChart and add to array
	var totalChart = new Array();
	var totalMarketCapitalizationChartTemp= "<%=request.getAttribute("totalMarketCapitalizationDataChart")%>";
			totalMarketCapitalizationChart = totalMarketCapitalizationChartTemp
					.split(',');
			totalMarketCapitalizationChart = totalMarketCapitalizationChart
					.map(parseFloat);
			totalMarketCapitalizationChartArrayTemp = totalMarketCapitalizationChart
					.map(parseFloat);

			var countTop = 0;
			var top10IndexTotalMarketCapitalizationChart = new Array();

			//Loop get top 10 index with is max total Price
			while (countTop < 10) {
				var maxIndex = -1;
				var max_totalMarketCapitalizationChart = totalMarketCapitalizationChartArrayTemp[0];
				for (let i = 0; i < totalMarketCapitalizationChartArrayTemp.length; i++) {
					if (max_totalMarketCapitalizationChart <= totalMarketCapitalizationChartArrayTemp[i]) {
						//Truong hop trong co phan tu >= max value
						max_totalMarketCapitalizationChart = totalMarketCapitalizationChartArrayTemp[i];
						maxIndex = i;
					}
				}
				if (maxIndex != -1) {
					//Truong hop co maxIndex
					console.log(maxIndex);
					top10IndexTotalMarketCapitalizationChart[countTop] = maxIndex;
					totalMarketCapitalizationChartArrayTemp[maxIndex] = -1;
					countTop++;
				}
			}

			var data = [ {
				x : [
						companyNameChart[top10IndexTotalMarketCapitalizationChart[9]],
						companyNameChart[top10IndexTotalMarketCapitalizationChart[8]],
						companyNameChart[top10IndexTotalMarketCapitalizationChart[7]],
						companyNameChart[top10IndexTotalMarketCapitalizationChart[6]],
						companyNameChart[top10IndexTotalMarketCapitalizationChart[5]],
						companyNameChart[top10IndexTotalMarketCapitalizationChart[4]],
						companyNameChart[top10IndexTotalMarketCapitalizationChart[3]],
						companyNameChart[top10IndexTotalMarketCapitalizationChart[2]],
						companyNameChart[top10IndexTotalMarketCapitalizationChart[1]],
						companyNameChart[top10IndexTotalMarketCapitalizationChart[0]], ],
				y : [
						totalMarketCapitalizationChart[top10IndexTotalMarketCapitalizationChart[9]],
						totalMarketCapitalizationChart[top10IndexTotalMarketCapitalizationChart[8]],
						totalMarketCapitalizationChart[top10IndexTotalMarketCapitalizationChart[7]],
						totalMarketCapitalizationChart[top10IndexTotalMarketCapitalizationChart[6]],
						totalMarketCapitalizationChart[top10IndexTotalMarketCapitalizationChart[5]],
						totalMarketCapitalizationChart[top10IndexTotalMarketCapitalizationChart[4]],
						totalMarketCapitalizationChart[top10IndexTotalMarketCapitalizationChart[3]],
						totalMarketCapitalizationChart[top10IndexTotalMarketCapitalizationChart[2]],
						totalMarketCapitalizationChart[top10IndexTotalMarketCapitalizationChart[1]],
						totalMarketCapitalizationChart[top10IndexTotalMarketCapitalizationChart[0]], ],
				type : "bar"
			} ];
			var layout = {
				title : "Top 10 Total MarketCapitalization"
			};

			Plotly.newPlot("totalMarketCapitalizationBarChartArea", data,
					layout);
		}
/* -------------------End Bar Chart Fact--------------------- */


/*  hiện thanh Slidebar*/
	</script>
	<script type="text/javascript">
		function openNav() {
			  document.getElementById("mySidenav").style.width = "25%";
			}
			
			function closeNav() {
			  document.getElementById("mySidenav").style.width = "0";
			}
	</script>
	<!-- hiện từng chart  -->
	<script type="text/javascript">
		const popupContainer = document.querySelector(".popup-container");
		const statsBtn = document.querySelector(".stats-btn");
		const closeBtn = document.querySelector(".popup-container .close-btn");
		
		statsBtn.addEventListener("click", () => {
		  popupContainer.classList.add("active");
			document.getElementById("popup-container").style.visibility="visible";
			document.getElementById("popup-container1").style.visibility="hidden";
			document.getElementById("popup-container2").style.visibility="hidden";
			document.getElementById("popup-container3").style.visibility="hidden";
			document.getElementById("popup-container4").style.visibility="hidden";
			document.getElementById("popup-container5").style.visibility="hidden";
			document.getElementById("popup-container6").style.visibility="hidden";
			document.getElementById("popup-container7").style.visibility="hidden";
			document.getElementById("popup-container8").style.visibility="hidden";
		});
		
		closeBtn.addEventListener("click", () => {
		  popupContainer.classList.remove("active");
		});
	</script>
	<script type="text/javascript">
		const popupContainer1 = document.querySelector(".popup-container1");
	    const statsBtn1 = document.querySelector(".stats-btn1");
	    const closeBtn1 = document.querySelector(".popup-container1 .close-btn1");
	
	    statsBtn1.addEventListener("click", () => {
	     	popupContainer1.classList.add("active");
	     	document.getElementById("popup-container").style.visibility="hidden";
			document.getElementById("popup-container1").style.visibility="visible";
			document.getElementById("popup-container2").style.visibility="hidden";
			document.getElementById("popup-container3").style.visibility="hidden";
			document.getElementById("popup-container4").style.visibility="hidden";
			document.getElementById("popup-container5").style.visibility="hidden";
			document.getElementById("popup-container6").style.visibility="hidden";
			document.getElementById("popup-container7").style.visibility="hidden";
			document.getElementById("popup-container8").style.visibility="hidden";
	    });
	
	    closeBtn1.addEventListener("click", () => {
	      popupContainer1.classList.remove("active");
	    });
	</script>

	<script type="text/javascript">
	const popupContainer2 = document.querySelector(".popup-container2");
	    const statsBtn2 = document.querySelector(".stats-btn2");
	    const closeBtn2 = document.querySelector(".popup-container2 .close-btn2");
	
	    statsBtn2.addEventListener("click", () => {
	      popupContainer2.classList.add("active");
	      document.getElementById("popup-container").style.visibility="hidden";
			document.getElementById("popup-container1").style.visibility="hidden";
			document.getElementById("popup-container2").style.visibility="visible";
			document.getElementById("popup-container3").style.visibility="hidden";
			document.getElementById("popup-container4").style.visibility="hidden";
			document.getElementById("popup-container5").style.visibility="hidden";
			document.getElementById("popup-container6").style.visibility="hidden";
			document.getElementById("popup-container7").style.visibility="hidden";
			document.getElementById("popup-container8").style.visibility="hidden";
	    });
	
	    closeBtn2.addEventListener("click", () => {
	      popupContainer2.classList.remove("active");
	    });

	</script>
	<script type="text/javascript">
		 const popupContainer3 = document.querySelector(".popup-container3");
	     const statsBtn3 = document.querySelector(".stats-btn3");
	     const closeBtn3 = document.querySelector(".popup-container3 .close-btn3");
	
	     statsBtn3.addEventListener("click", () => {
	       popupContainer3.classList.add("active");
	       document.getElementById("popup-container").style.visibility="hidden";
			document.getElementById("popup-container1").style.visibility="hidden";
			document.getElementById("popup-container2").style.visibility="hidden";
			document.getElementById("popup-container3").style.visibility="visible";
			document.getElementById("popup-container4").style.visibility="hidden";
			document.getElementById("popup-container5").style.visibility="hidden";
			document.getElementById("popup-container6").style.visibility="hidden";
			document.getElementById("popup-container7").style.visibility="hidden";
			document.getElementById("popup-container8").style.visibility="hidden";
	     });
	
	     closeBtn3.addEventListener("click", () => {
	       popupContainer3.classList.remove("active");
	     });

	</script>
	<script type="text/javascript">
		const popupContainer4 = document.querySelector(".popup-container4");
	    const statsBtn4 = document.querySelector(".stats-btn4");
	    const closeBtn4 = document.querySelector(".popup-container4 .close-btn4");
	
	    statsBtn4.addEventListener("click", () => {
	      popupContainer4.classList.add("active");
	      document.getElementById("popup-container").style.visibility="hidden";
			document.getElementById("popup-container1").style.visibility="hidden";
			document.getElementById("popup-container2").style.visibility="hidden";
			document.getElementById("popup-container3").style.visibility="hidden";
			document.getElementById("popup-container4").style.visibility="visible";
			document.getElementById("popup-container5").style.visibility="hidden";
			document.getElementById("popup-container6").style.visibility="hidden";
			document.getElementById("popup-container7").style.visibility="hidden";
			document.getElementById("popup-container8").style.visibility="hidden";
	    });
	
	    closeBtn4.addEventListener("click", () => {
	      popupContainer4.classList.remove("active");
	    });
	</script>
	<script type="text/javascript">
		const popupContainer5 = document.querySelector(".popup-container5");
	    const statsBtn5 = document.querySelector(".stats-btn5");
	    const closeBtn5 = document.querySelector(".popup-container5 .close-btn5");
	
	    statsBtn5.addEventListener("click", () => {
	      popupContainer5.classList.add("active");
	      document.getElementById("popup-container").style.visibility="hidden";
			document.getElementById("popup-container1").style.visibility="hidden";
			document.getElementById("popup-container2").style.visibility="hidden";
			document.getElementById("popup-container3").style.visibility="hidden";
			document.getElementById("popup-container4").style.visibility="hidden";
			document.getElementById("popup-container5").style.visibility="visible";
			document.getElementById("popup-container6").style.visibility="hidden";
			document.getElementById("popup-container7").style.visibility="hidden";
			document.getElementById("popup-container8").style.visibility="hidden";
	    });
	
	    closeBtn5.addEventListener("click", () => {
	      popupContainer5.classList.remove("active");
	    });
	</script>
	<script type="text/javascript">
		 const popupContainer6 = document.querySelector(".popup-container6");
	     const statsBtn6 = document.querySelector(".stats-btn6");
	     const closeBtn6 = document.querySelector(".popup-container6 .close-btn6");
	
	     statsBtn6.addEventListener("click", () => {
	       popupContainer6.classList.add("active");
	       document.getElementById("popup-container").style.visibility="hidden";
			document.getElementById("popup-container1").style.visibility="hidden";
			document.getElementById("popup-container2").style.visibility="hidden";
			document.getElementById("popup-container3").style.visibility="hidden";
			document.getElementById("popup-container4").style.visibility="hidden";
			document.getElementById("popup-container5").style.visibility="hidden";
			document.getElementById("popup-container6").style.visibility="visible";
			document.getElementById("popup-container7").style.visibility="hidden";
			document.getElementById("popup-container8").style.visibility="hidden";
	     });
	
	     closeBtn6.addEventListener("click", () => {
	       popupContainer6.classList.remove("active");
	     });

	</script>
	<script type="text/javascript">
		const popupContainer7 = document.querySelector(".popup-container7");
	    const statsBtn7 = document.querySelector(".stats-btn7");
	    const closeBtn7 = document.querySelector(".popup-container7 .close-btn7");
	
	    statsBtn7.addEventListener("click", () => {
	      popupContainer7.classList.add("active");
	      document.getElementById("popup-container").style.visibility="hidden";
			document.getElementById("popup-container1").style.visibility="hidden";
			document.getElementById("popup-container2").style.visibility="hidden";
			document.getElementById("popup-container3").style.visibility="hidden";
			document.getElementById("popup-container4").style.visibility="hidden";
			document.getElementById("popup-container5").style.visibility="hidden";
			document.getElementById("popup-container6").style.visibility="hidden";
			document.getElementById("popup-container7").style.visibility="visible";
			document.getElementById("popup-container8").style.visibility="hidden";
	    });
	
	    closeBtn7.addEventListener("click", () => {
	      popupContainer7.classList.remove("active");
	    });
	</script>
	<script type="text/javascript">
		const popupContainer8 = document.querySelector(".popup-container8");
	    const statsBtn8 = document.querySelector(".stats-btn8");
	    const closeBtn8 = document.querySelector(".popup-container8 .close-btn8");
	
	    statsBtn8.addEventListener("click", () => {
	      popupContainer8.classList.add("active");
	      document.getElementById("popup-container").style.visibility="hidden";
			document.getElementById("popup-container1").style.visibility="hidden";
			document.getElementById("popup-container2").style.visibility="hidden";
			document.getElementById("popup-container3").style.visibility="hidden";
			document.getElementById("popup-container4").style.visibility="hidden";
			document.getElementById("popup-container5").style.visibility="hidden";
			document.getElementById("popup-container6").style.visibility="hidden";
			document.getElementById("popup-container7").style.visibility="hidden";
			document.getElementById("popup-container8").style.visibility="visible";
	    });
	
	    closeBtn8.addEventListener("click", () => {
	      popupContainer8.classList.remove("active");
	    });
	</script>
<!-- 
	<script>
        document.onreadystatechange = function() {
            if (document.readyState !== "complete") {
                document.querySelector(
                  "body").style.visibility = "hidden";
                document.querySelector(
                  "#loader").style.visibility = "visible";
            } else {
                document.querySelector(
                  "#loader").style.display = "none";
                document.querySelector(
                  "body").style.visibility = "visible";
            }
        };
    </script>

	<script>
		var myVar;
		
		function myFunction() {
		  myVar = setTimeout(showPage, 2000);
		}
		
		function showPage() {
		  document.getElementById("loader").style.display = "none";
		  document.getElementById("myDiv").style.display = "block";
		}
	</script> -->

</body>

</html>


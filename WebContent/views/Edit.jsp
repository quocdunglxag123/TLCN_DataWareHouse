<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Edit</title>
<!-- <link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css"> -->
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

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/Edit.css">
<script language="javascript"
	src="<%=request.getContextPath()%>/js/Edit.js"></script>

<style>
* {
	box-sizing: border-box;
}

#regForm {
	background-color: #ffffff;
	margin: 10% auto;
	font-family: Raleway;
	padding: 40px;
	width: 70%;
	min-width: 300px;
}

h1 {
	text-align: center;
}

input, textaria {
	padding: 2%;
	width: 100%;
	font-size: 100%;
	font-family: Raleway;
	border: 1px solid #aaaaaa;
	border-style: none none solid none;
}

/* Mark input boxes that gets an error on validation: */
input.invalid, textaria.invalid{
	background-color: #ffdddd;
}

/* Hide all steps by default: */
.tab {
	display: none;
}

button {
	background-color: #7895B2;
	color: #ffffff;
	border: none;
	height: 35px;
	padding: auto;
	font-size: 100%;
	font-family: Raleway;
	cursor: pointer;
	border-radius: 5%;
}

button:hover {
	opacity: 0.8;
}

#prevBtn {
	background-color: #7895B2;
}

/* Make circles that indicate the steps of the form: */
.step {
	height: 15px;
	width: 15px;
	margin: 0 1%;
	background-color: #7895B2;
	border: none;
	border-radius: 50%;
	display: inline-block;
	opacity: 0.5;
}

.step.active {
	opacity: 1;
}

/* Mark the steps that are finished and valid: */
.step.finish {
	background-color: #7895B2;
}
</style>

</head>
<body onload="checkStatus()">
	<div class="background">
		<img src="<%=request.getContextPath()%>/img/STOCKtrade1.png"
			width="12%" height="12%" alt="logo" class="img">
	</div>
	<div class="cicle-1"></div>
	<div class="cicle-2"></div>
	<div class="container">
		<div class="panel-body">
			<form action="EditCompany" method="post" class="form-login"
				id="form-login" name="form">
				<c:if test="${chooseView == 'viewExchange'}">
					<h1>Edit Exchange</h1>
					<div class="tab">
						Exchange ID 
						<p>
							<textarea class="form-control" id="exchangeId" name="exchangeId"
								type="text" style="resize: none;" rows="1"
								cols="40" readonly>${exchange.id}</textarea>
						</p>
						Symbol 
						<p>
							<input placeholder="Exchange Symbol" id="companySymbol"
								name="companySymbol" type="text" value="${exchange.symbol}"
								required>
						</p>
					</div>
					<div class="tab">
						Name 
						<p>
							<input placeholder="Exchange Symbol" id="companySymbol"
								name="companySymbol" type="text" value="${exchange.name}"
								required>
						</p>
						Information
						<p>
							<input placeholder="Name" name="companyName"
								value="${exchange.info}" required>
						</p>
					</div>
					<div style="overflow: auto;">
						<div>
							<button type="button" id="prevBtn" onclick="nextPrev(-1)"
								style="float: left;">Previous</button>
							<button type="button" id="nextBtn" onclick="nextPrev(1)"
								style="float: right;">Next</button>
						</div>
						<br></br>
						<div class="form-group" style="float: right;">
							<button value="edit" name="buttonEdit" type="submit">Submit</button>
							<button type="reset">Reset Value</button>
							<a href="SearchCompany"><button type="button">Cancel</button></a>
						</div>
					</div>
					<!-- Circles which indicates the steps of the form: -->
					<div style="text-align: center; margin-top: 4%;">
						<span class="step"></span> <span class="step"></span> 
					</div>			
				</c:if>
				<c:if test="${chooseView == 'viewFactForeignInvestorAuction'}">
					<h1>Edit Foreign Investor Auction</h1>
					<div class="tab">
						Foreign Investor Auction ID 
						<p>
							<textarea class="form-control" id="factForeignInvestorAuctionId" name="factForeignInvestorAuctionId"
								type="text" style="resize: none;" rows="1"
								cols="40" readonly>${factForeignInvestorAuction.id}</textarea>
						</p>
						Date Id 
						<p>
							<input placeholder="Date Id" id="id_date"
								name="id_date" type="text" value="${factForeignInvestorAuction.id_date}"
								required>
						</p>
						Company Id 
						<p>
							<input placeholder="Company Id" id="id_company"
								name="id_company" type="text" value="${factForeignInvestorAuction.id_company}"
								required>
						</p>
					</div>
					<div class="tab">
						Room 
						<p>
							<input placeholder="Room" id="room"
								name="room" type="text" value="${factForeignInvestorAuction.room}"
								required>
						</p>
						Percent owned
						<p>
							<input placeholder="Percent owned" name="percent_owned"
								value="${factForeignInvestorAuction.percent_owned}" required>
						</p>
						Room available
						<p>
							<input placeholder="Room available" id="room_available"
								name="room_available" type="text" value="${factForeignInvestorAuction.room_available}"
								required>
						</p>
					</div>
					<div class="tab">
						Percent room available 
						<p>
							<input placeholder="Percent room available" id="percent_room_available"
								name="percent_room_available" type="text" value="${factForeignInvestorAuction.percent_room_available}"
								required>
						</p>
						Buy volume auction
						<p>
							<input placeholder="Buy volume auction" name="buy_volume_auction"
								value="${factForeignInvestorAuction.buy_volume_auction}" required>
						</p>
						Percent buy volume auction market
						<p>
							<input placeholder="Percent buy volume auction market" id="percent_buy_volume_auction_market"
								name="percent_buy_volume_auction_market" type="text" value="${factForeignInvestorAuction.percent_buy_volume_auction_market}"
								required>
						</p>
					</div>
					<div class="tab">
						Sell volume auction
						<p>
							<input placeholder="Sell volume auction" id="sell_volume_auction"
								name="sell_volume_auction" type="text" value="${factForeignInvestorAuction.sell_volume_auction}"
								required>
						</p>
						Percent sell volume auction market
						<p>
							<input placeholder="Percent sell volume auction market" name="percent_sell_volume_auction_market"
								value="${factForeignInvestorAuction.percent_sell_volume_auction_market}" required>
						</p>
						Buy price auction
						<p>
							<input placeholder="Buy price auction" id="buy_price_auction"
								name="buy_price_auction" type="text" value="${factForeignInvestorAuction.buy_price_auction}"
								required>
						</p>
					</div>
					<div class="tab">
						Percent buy price auction market
						<p>
							<input placeholder="Percent buy price auction market" id="percent_buy_price_auction_market"
								name="percent_buy_price_auction_market" type="text" value="${factForeignInvestorAuction.percent_buy_price_auction_market}"
								required>
						</p>
						Sell price auction
						<p>
							<input placeholder="Sell price auction" name="sell_price_auction"
								value="${factForeignInvestorAuction.sell_price_auction}" required>
						</p>
						Percent sell price auction market
						<p>
							<input placeholder="Percent sell price auction market" id="percent_sell_price_auction_market"
								name="percent_sell_price_auction_market" type="text" value="${factForeignInvestorAuction.percent_sell_price_auction_market}"
								required>
						</p>
					</div>
					<div class="tab">
						Difference volume
						<p>
							<input placeholder="Difference volume" id="difference_volume"
								name="difference_volume" type="text" value="${factForeignInvestorAuction.difference_volume}"
								required>
						</p>
						Difference price
						<p>
							<input placeholder="Difference price" name="difference_price"
								value="${factForeignInvestorAuction.difference_price}" required>
						</p>
					</div>
					<div style="overflow: auto;">
						<div>
							<button type="button" id="prevBtn" onclick="nextPrev(-1)"
								style="float: left;">Previous</button>
							<button type="button" id="nextBtn" onclick="nextPrev(1)"
								style="float: right;">Next</button>
						</div>
						<br></br>
						<div class="form-group" style="float: right;">
							<button value="edit" name="buttonEdit" type="submit">Submit</button>
							<button type="reset">Reset Value</button>
							<a href="SearchCompany"><button type="button">Cancel</button></a>
						</div>
					</div>
					<!-- Circles which indicates the steps of the form: -->
					<div style="text-align: center; margin-top: 4%;">
						<span class="step"></span> <span class="step"></span> <span class="step"></span> 
						<span class="step"></span> <span class="step"></span> <span class="step"></span> 
					</div>
					<%-- <label style="background-color:red">
						${factForeignInvestorAuction.id} <br />
						${factForeignInvestorAuction.id_date}<br />
						${factForeignInvestorAuction.id_company}<br />
						${factForeignInvestorAuction.room}<br />
						${factForeignInvestorAuction.percent_owned}<br />
						${factForeignInvestorAuction.room_available}<br />
						${factForeignInvestorAuction.percent_room_available}<br />
						${factForeignInvestorAuction.buy_volume_auction}<br />
						${factForeignInvestorAuction.percent_buy_volume_auction_market}<br />
						${factForeignInvestorAuction.sell_volume_auction}<br />
						${factForeignInvestorAuction.percent_sell_volume_auction_market}<br />
						${factForeignInvestorAuction.buy_price_auction}<br />
						${factForeignInvestorAuction.percent_buy_price_auction_market}<br />
						${factForeignInvestorAuction.sell_price_auction}<br />
						${factForeignInvestorAuction.percent_sell_price_auction_market}<br />
						${factForeignInvestorAuction.difference_volume}<br />
						${factForeignInvestorAuction.difference_price}<br />
					</label> --%>
				</c:if>
				<c:if test="${chooseView == 'viewFactStockOrder'}">
				<h1>Edit Fact Stock Order</h1>
					<div class="tab">
						ID 
						<p>
							<textarea class="form-control" id="id" name="id"
								type="text" style="resize: none;" rows="1"
								cols="40" readonly>${factStockOrder.id}</textarea>
						</p>
						Date Id 
						<p>
							<input placeholder="Date Id" id="id_date"
								name="id_date" type="text" value="${factStockOrder.id_date}"
								required>
						</p>
						Company Id 
						<p>
							<input placeholder="Company Id" id="id_company"
								name="id_company" type="text" value="${factStockOrder.id_company}"
								required>
						</p>
					</div>
					<div class="tab">
						Price close 
						<p>
							<input placeholder="Price close" id="price_close"
								name="price_close" type="text" value="${factStockOrder.price_close}"
								required>
						</p>
						Total volume auction
						<p>
							<input placeholder="Total volume auction" name="total_volume_auction"
								value="${factStockOrder.total_volume_auction}" required>
						</p>
						Total price auction
						<p>
							<input placeholder="Total price auction" id="total_price_auction"
								name="total_price_auction" type="text" value="${factStockOrder.total_price_auction}"
								required>
						</p>
					</div>
					<div class="tab">
						Best buy price
						<p>
							<input placeholder="Best buy price" id="best_buy_price"
								name="best_buy_price" type="text" value="${factStockOrder.best_buy_price}"
								required>
						</p>
						Best buy volume
						<p>
							<input placeholder="Best buy volume" name="best_buy_volume"
								value="${factStockOrder.best_buy_volume}" required>
						</p>
						Best sell price
						<p>
							<input placeholder="Best sell price" id="best_sell_price"
								name="best_sell_price" type="text" value="${factStockOrder.best_sell_price}"
								required>
						</p>
					</div>
					<div class="tab">
						Best sell volume
						<p>
							<input placeholder="Best sell volume" id="best_sell_volume"
								name="best_sell_volume" type="text" value="${factStockOrder.best_sell_volume}"
								required>
						</p>
						Total order buy
						<p>
							<input placeholder="Total order buy" name="total_order_buy"
								value="${factStockOrder.total_order_buy}" required>
						</p>
						Total order sell
						<p>
							<input placeholder="Total order sell" id="total_order_sell"
								name="total_order_sell" type="text" value="${factStockOrder.total_order_sell}"
								required>
						</p>
					</div>
					<div class="tab">
						Total order buy minus sell
						<p>
							<input placeholder="Total order buy minus sell" id="total_order_buy_minus_sell"
								name="total_order_buy_minus_sell" type="text" value="${factStockOrder.total_order_buy_minus_sell}"
								required>
						</p>
						Total volume buy
						<p>
							<input placeholder="Total volume buy" name="total_volume_buy"
								value="${factStockOrder.total_volume_buy}" required>
						</p>
					</div>
					<div class="tab">
						Total volume sell
						<p>
							<input placeholder="Total volume sell" id="total_volume_sell"
								name="total_volume_sell" type="text" value="${factStockOrder.total_volume_sell}"
								required>
						</p>
						Total volume buy minus sell
						<p>
							<input placeholder="Total volume buy minus sell" name="total_volume_buy_minus_sell"
								value="${factStockOrder.total_volume_buy_minus_sell}" required>
						</p>
					</div>
					<div style="overflow: auto;">
						<div>
							<button type="button" id="prevBtn" onclick="nextPrev(-1)"
								style="float: left;">Previous</button>
							<button type="button" id="nextBtn" onclick="nextPrev(1)"
								style="float: right;">Next</button>
						</div>
						<br></br>
						<div class="form-group" style="float: right;">
							<button value="edit" name="buttonEdit" type="submit">Submit</button>
							<button type="reset">Reset Value</button>
							<a href="SearchCompany"><button type="button">Cancel</button></a>
						</div>
					</div>
					<!-- Circles which indicates the steps of the form: -->
					<div style="text-align: center; margin-top: 4%;">
						<span class="step"></span> <span class="step"></span> <span class="step"></span> 
						<span class="step"></span> <span class="step"></span> <span class="step"></span> 
					</div>
				<%-- <label style="background-color:red">
						${factStockOrder.id} <br />
						${factStockOrder.id_date}<br />
						${factStockOrder.id_company}<br />
						${factStockOrder.price_close}<br />
						${factStockOrder.total_volume_auction} <br />
						${factStockOrder.total_price_auction}<br />
						${factStockOrder.best_buy_price}<br />
						${factStockOrder.best_buy_volume}<br />
						${factStockOrder.best_sell_price} <br />
						${factStockOrder.best_sell_volume}<br />
						${factStockOrder.total_order_buy}<br />
						${factStockOrder.total_order_sell}<br />
						${factStockOrder.total_order_buy_minus_sell} <br />
						${factStockOrder.total_volume_buy}<br />
						${factStockOrder.total_volume_sell}<br />
						${factStockOrder.total_volume_buy_minus_sell}<br />
					</label> --%>
				</c:if>
				<c:if test="${chooseView == 'viewFactBusinessResult'}">
				<h1>Edit Business Result</h1>
					<div class="tab">
						ID 
						<p>
							<textarea class="form-control" id="businessId" name="businessId"
								type="text" style="resize: none;" rows="1"
								cols="40" readonly>${factBusinessResult.id}</textarea>
						</p>
						Date ID
						<p>
							<input placeholder="Date ID" id="businessDate"
								name="companySymbol" type="text" value="${factBusinessResult.id_date}"
								required>
						</p>
						Company ID
						<p>
							<input placeholder="Exchange Symbol" id="companySymbol"
								name="companySymbol" type="text" value="${factBusinessResult.id_company}"
								required>
						</p>
					</div>
					<div class="tab">
						Exchange ID 
						<p>
							<input placeholder="Exchange ID" id="exchangeId"
								name="exchangeId" type="text" value="${factBusinessResult.id_exchange}"
								required>
						</p>
						Status
						<p>
							<input placeholder="Status" name="businessStatus"
								value="${factBusinessResult.status}" required>
						</p>
						Profit
						<p>
							<input placeholder="Profit" name="businessProfit "
								value="${factBusinessResult.profit}" required>
						</p>
					</div>
					<div class="tab">
						Previous period
						<p>
							<input placeholder="Previous period" id="previousPeriod"
								name="previousPeriod" type="text" value="${factBusinessResult.previous_period}"
								required>
						</p>
						Same period
						<p>
							<input placeholder="Same period" name="samePeriod"
								value="${factBusinessResult.same_period}" required>
						</p>
						Profit cummulative
						<p>
							<input placeholder="Profit cummulative" name="profitCummulative "
								value="${factBusinessResult.profit_cummulative}" required>
						</p>
					</div>
					<div class="tab">
						Eps profit
						<p>
							<input placeholder="Eps profit" id="epsPprofit"
								name="epsProfit" type="text" value="${factBusinessResult.eps_profit}"
								required>
						</p>
						Eps cummulative
						<p>
							<input placeholder="Eps cummulative" name="epsCummulative"
								value="${factBusinessResult.eps_cummulative}" required>
						</p>
						Price earning ratio
						<p>
							<input placeholder="Price earning ratio" name="priceEarningRatio "
								value="${factBusinessResult.price_earning_ratio}" required>
						</p>
					</div>
					<div style="overflow: auto;">
						<div>
							<button type="button" id="prevBtn" onclick="nextPrev(-1)"
								style="float: left;">Previous</button>
							<button type="button" id="nextBtn" onclick="nextPrev(1)"
								style="float: right;">Next</button>
						</div>
						<br></br>
						<div class="form-group" style="float: right;">
							<button value="edit" name="buttonEdit" type="submit">Submit</button>
							<button type="reset">Reset Value</button>
							<a href="SearchCompany"><button type="button">Cancel</button></a>
						</div>
					</div>
					<!-- Circles which indicates the steps of the form: -->
					<div style="text-align: center; margin-top: 4%;">
						<span class="step"></span> <span class="step"></span> 
						<span class="step"></span> <span class="step"></span>
					</div>
					<%-- <label style="background-color:red">
					${factBusinessResult.id}<br />
					${factBusinessResult.id_date}<br />
					${factBusinessResult.id_company}<br />
					${factBusinessResult.id_exchange}<br />
					${factBusinessResult.status}<br />
					${factBusinessResult.profit}<br />
					${factBusinessResult.previous_period}<br />
					${factBusinessResult.same_period}<br />
					${factBusinessResult.profit_cummulative}<br />
					${factBusinessResult.eps_profit}<br />
					${factBusinessResult.eps_cummulative}<br />
					${factBusinessResult.price_earning_ratio}<br />
					</label>	 --%>
				</c:if>
				
				
				<c:if test="${chooseView == 'viewCompany'}">
					<%-- <div class="form-group">
						<input class="form-control" id="companyId" name="companyId"
							type="text" value="${company.id}" readonly>
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="Symbol"
							id="companySymbol" name="companySymbol" type="text"
							value="${company.symbol}" required>
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="Name" name="companyName"
							value="${company.name}">
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="Major"
							name="companyMajor" value="${company.major}">

					</div>
					<div class="form-group">
						<input class="form-control" placeholder="Phone"
							name="companyPhone" value="${company.phone}">

					</div>
					<div class="form-group">
						<textarea style="resize: none;" name="companyInfo" rows="4"
							cols="40">${company.info}</textarea>
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="Address"
							name="companyAddress" value="${company.address}">
					</div>
 --%>
					<h1>Edit Company</h1>
					<!-- One "tab" for each step in the form: -->
					<div class="tab">
						Company ID
						<p>
							<textarea class="form-control" id="companyId" name="companyId"
								type="text" style="resize: none;" rows="1"
								cols="40" readonly>${company.id}</textarea>
						</p>
						Symbol
						<p>
							<input placeholder="Symbol" id="companySymbol"
								name="companySymbol" type="text" value="${company.symbol}"
								required>
						</p>
						Name
						<p>
							<input placeholder="Name" name="companyName"
								value="${company.name}" required>
						</p>
					</div>
					<div class="tab">
						Major
						<p>
							<input placeholder="Major" name="companyMajor"
								value="${company.major}" required>
						</p>
						Phone
						<p>
							<input placeholder="Phone" name="companyPhone"
								value="${company.phone}" required>
						</p>
					</div>
					<div class="tab">
						Information
						<p>
							<textarea style="resize: none;" name="companyInfo" rows="4"
								cols="40" required>${company.info}</textarea>
						</p>
						Address
						<p>
							<input placeholder="Address" name="companyAddress"
								value="${company.address}" required>
						</p>
					</div>
					<div style="overflow: auto;">
						<div>
							<button type="button" id="prevBtn" onclick="nextPrev(-1)"
								style="float: left;">Previous</button>
							<button type="button" id="nextBtn" onclick="nextPrev(1)"
								style="float: right;">Next</button>
						</div>
						<br></br>
						<div class="form-group" style="float: right;">
							<button value="edit" name="buttonEdit" type="submit">Submit</button>
							<button type="reset">Reset Value</button>
							<a href="SearchCompany"><button type="button">Cancel</button></a>
						</div>
					</div>
					<!-- Circles which indicates the steps of the form: -->
					<div style="text-align: center; margin-top: 4%;">
						<span class="step"></span> <span class="step"></span> <span
							class="step"></span> 
					</div>
				</c:if>
				<c:if test="${chooseView == 'viewDateTrade'}">
					<%-- <div class="form-group">
						<input class="form-control" id="dateTradeId" name="dateTradeId"
							type="text" value="${dateTradedto.id}" readonly>
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="Date Trade"
							id="dateTrade" name="dateTrade" type="text"
							value="${dateTradeDto.dateTrade}" required>
					</div> --%>
					
					<h1>Edit Date Trade</h1>
					<!-- One "tab" for each step in the form: -->
					<div class="tab">
						Date Trade ID
						<p>
							<textarea class="form-control" id="dateTradeId" name="dateTradeId"
								type="text" style="resize: none;" rows="1"
								cols="40" readonly>${dateTradedto.id}</textarea>
						</p>
						Date Trade
						<p>
							<input placeholder="Date Trade" id="dateTrade" name="dateTrade" type="text"
								value="${dateTradeDto.dateTrade}" required>
						</p>
					</div>
					<div style="overflow: auto;">
						<div class="form-group" style="float: right;">
							<button value="edit" name="buttonEdit" type="submit">Submit</button>
							<button type="reset">Reset Value</button>
							<a href="SearchCompany"><button type="button">Cancel</button></a>
						</div>
					</div>
				</c:if>
				<c:if test="${chooseView == 'viewFactTrade'}">
					<%-- <div class="form-group">
						<input class="form-control" id="factTradeId" name="factTradeId"
							type="text" value="${factTrade.id}" readonly>
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="id_date Trade"
							id="id_date" name="id_date" type="text"
							value="${factTrade.id_date}" required>
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="id_company Trade"
							id="id_company" name="id_company" type="text"
							value="${factTrade.id_company}" required>
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="price_reference Trade"
							id="price_reference" name="price_reference" type="text"
							value="${factTrade.price_reference}">
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="price_open Trade"
							id="price_open" name="price_open" type="text"
							value="${factTrade.price_open}">
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="price_close Trade"
							id="price_close" name="price_close" type="text"
							value="${factTrade.price_close}">
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="price_ceiling Trade"
							id="price_ceiling" name="price_ceiling" type="text"
							value="${factTrade.price_ceiling}">
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="price_floor Trade"
							id="price_floor" name="price_floor" type="text"
							value="${factTrade.price_floor}">
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="mean Trade" id="mean"
							name="mean" type="text" value="${factTrade.mean}">
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="volatility Trade"
							id="volatility" name="volatility" type="text"
							value="${factTrade.volatility}">
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="volatility_percent Trade"
							id="volatility_percent" name="volatility_percent" type="text"
							value="${factTrade.volatility_percent}">
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="total_volume Trade"
							id="total_volume" name="total_volume" type="text"
							value="${factTrade.total_volume}">
					</div>
					<div class="form-group">
						<input class="form-control" placeholder="total_price Trade"
							id="total_price" name="total_price" type="text"
							value="${factTrade.total_price}">
					</div>
					<div class="form-group">
						<input class="form-control"
							placeholder="total_marketcapitalization Trade"
							id="total_marketcapitalization" name="total_marketcapitalization"
							type="text" value="${factTrade.total_marketcapitalization}">
					</div> --%>
					<h1>Edit Fact Company</h1>
					<!-- One "tab" for each step in the form: -->
					<div class="tab">
						Fact Trade ID
						<p>
							<textarea class="form-control" id="factTradeId" name="factTradeId"
							type="text" style="resize: none;" rows="1"
							cols="40" readonly>${factTrade.id}</textarea>
						</p>
						Date Trade ID
						<p>
							<input placeholder="id_date Trade" id="id_date" name="id_date" type="text"
							value="${factTrade.id_date}" required>
						</p>
						Company Trade ID
						<p>
							<input placeholder="id_company Trade" id="id_company" name="id_company" type="text"
							value="${factTrade.id_company}" required>
						</p>
					</div>
					<div class="tab">
						Price Reference Trade
						<p>
							<input placeholder="price_reference Trade" id="price_reference" name="price_reference" type="text"
							value="${factTrade.price_reference}" required>
						</p>
						Price Open Trade
						<p>
							<input placeholder="price_open Trade" id="price_open" name="price_open" type="text" required
							value="${factTrade.price_open}">
						</p>
						Price Close Trade
						<p>
							<input placeholder="price_close Trade" id="price_close" name="price_close" type="text" required
							value="${factTrade.price_close}">
						</p>
					</div>
					<div class="tab">
						Price Ceiling Trade
						<p>
							<input placeholder="price_ceiling Trade" id="price_ceiling" name="price_ceiling" type="text" required
							value="${factTrade.price_ceiling}">
						</p>
						Price Floor Trade
						<p>
						 
							<input placeholder="price_floor Trade"	id="price_floor" name="price_floor" type="text" required
							value="${factTrade.price_floor}">
						</p>
						Mean Trade
						<p>
							<input placeholder="mean Trade" id="mean" name="mean" type="text" value="${factTrade.mean}" required>
						</p>
					</div>
					<div class="tab">
						Volatility Trade
						<p>
							<input placeholder="volatility Trade" id="volatility" name="volatility" type="text" required
							value="${factTrade.volatility}">
						</p>
						Volatility Percent Trade
						<p>
							<input placeholder="volatility_percent Trade" id="volatility_percent" name="volatility_percent" type="text" required
							value="${factTrade.volatility_percent}">
						</p>						
					</div>
					<div class="tab">
						Total Volume Trade
							<p>
								<input placeholder="total_volume Trade" id="total_volume" name="total_volume" type="text" required
								value="${factTrade.total_volume}">
							</p>
						Total Price Trade
						<p>
							<input placeholder="total_price Trade"	id="total_price" name="total_price" type="text" required
							value="${factTrade.total_price}">
						</p>
						Total Marketcapitalization Trade
						<p>
							<input placeholder="total_marketcapitalization Trade" id="total_marketcapitalization" name="total_marketcapitalization"
							type="text" value="${factTrade.total_marketcapitalization}" required>
						</p>						
					</div>
					<div style="overflow: auto;">
						<div>
							<button type="button" id="prevBtn" onclick="nextPrev(-1)"
								style="float: left;">Previous</button>
							<button type="button" id="nextBtn" onclick="nextPrev(1)"
								style="float: right;">Next</button>
						</div>
						<br></br>
						<div class="form-group" style="float: right;">
							<button value="edit" name="buttonEdit" type="submit">Submit</button>
							<button type="reset">Reset Value</button>
							<a href="SearchCompany"><button type="button">Cancel</button></a>
						</div>
					</div>
					<!-- Circles which indicates the steps of the form: -->
					<div style="text-align: center; margin-top: 4%;">
						<span class="step"></span> <span class="step"></span> <span
							class="step"></span> <span class="step"></span> <span class="step"></span>
					</div>
				</c:if>
				<!-- 				<div class="form-group">
					<button value="edit" name="buttonEdit" type="submit">Submit</button>
					<button type="reset">Reset Value</button>
					<a href="SearchCompany"><button type="button">Cancel</button></a>
				</div> -->
			</form>
		</div>
	</div>
	<script language="javascript"
		src="<%=request.getContextPath()%>/js/Edit.js"></script>

	<!-- <script>
		var currentTab = 0; // Current tab is set to be the first tab (0)
		showTab(currentTab); // Display the current tab

		function showTab(n) {
			// This function will display the specified tab of the form...
			var x = document.getElementsByClassName("tab");
			x[n].style.display = "block";
			//... and fix the Previous/Next buttons:
			if (n == 0) {
				document.getElementById("prevBtn").style.display = "none";
			} else {
				document.getElementById("prevBtn").style.display = "inline";
			}
			if (n == (x.length - 1)) {
				document.getElementById("nextBtn").style.display = "none";
			} else {
				document.getElementById("nextBtn").innerHTML = "Next";
			}
			//... and run a function that will display the correct step indicator:
			fixStepIndicator(n)
		}

		function nextPrev(n) {
			// This function will figure out which tab to display
			var x = document.getElementsByClassName("tab");
			// Exit the function if any field in the current tab is invalid:
			if (n == 1 && !validateForm())
				return false;
			// Hide the current tab:
			x[currentTab].style.display = "none";
			// Increase or decrease the current tab by 1:
			currentTab = currentTab + n;
			// if you have reached the end of the form...
			if (currentTab >= x.length) {
				// ... the form gets submitted:
				document.getElementById("regForm").submit();
				return false;
			}
			// Otherwise, display the correct tab:
			showTab(currentTab);
		}

		function validateForm() {
			// This function deals with validation of the form fields
			var x, y, i, valid = true;
			x = document.getElementsByClassName("tab");
			y = x[currentTab].getElementsByTagName("input");
			// A loop that checks every input field in the current tab:
			for (i = 0; i < y.length; i++) {
				// If a field is empty...
				if (y[i].value == "") {
					// add an "invalid" class to the field:
					y[i].className += " invalid";
					// and set the current valid status to false
					valid = false;
				}
			}
			// If the valid status is true, mark the step as finished and valid:
			if (valid) {
				document.getElementsByClassName("step")[currentTab].className += " finish";
			}
			return valid; // return the valid status
		}
 
		function fixStepIndicator(n) {
			// This function removes the "active" class of all steps...
			var i, x = document.getElementsByClassName("step");
			for (i = 0; i < x.length; i++) {
				x[i].className = x[i].className.replace(" active", "");
			}
			//... and adds the "active" class on the current step:
			x[n].className += " active";
		}
	</script> -->
	<script>
		var currentTab = 0; // Current tab is set to be the first tab (0)
		showTab(currentTab); // Display the current tab

		function showTab(n) {
			// This function will display the specified tab of the form...
			var x = document.getElementsByClassName("tab");
			x[n].style.display = "block";
			//... and fix the Previous/Next buttons:
			if (n == 0) {
				document.getElementById("prevBtn").style.display = "none";
			} else {
				document.getElementById("prevBtn").style.display = "inline";
			}
			if (n === (x.length - 1)) {
			    document.getElementById("nextBtn").style.display = "none";
			  } else {
			  	document.getElementById("nextBtn").style.display = "inline";
			    document.getElementById("nextBtn").innerHTML = "Next";
			  }
			//... and run a function that will display the correct step indicator:
			fixStepIndicator(n)
		}

		function nextPrev(n) {
			// This function will figure out which tab to display
			var x = document.getElementsByClassName("tab");
			// Exit the function if any field in the current tab is invalid:
			if (n == 1 && !validateForm())
				return false;
			// Hide the current tab:
			x[currentTab].style.display = "none";
			// Increase or decrease the current tab by 1:
			currentTab = currentTab + n;
			// if you have reached the end of the form...
			if (currentTab >= x.length) {
				// ... the form gets submitted:
				document.getElementById("regForm").submit();
				return false;
			}
			// Otherwise, display the correct tab:
			showTab(currentTab);
		}

		function validateForm() {
			// This function deals with validation of the form fields
			var x, y, i, valid = true;
			x = document.getElementsByClassName("tab");
			y = x[currentTab].getElementsByTagName("input");
			// A loop that checks every input field in the current tab:
			for (i = 0; i < y.length; i++) {
				// If a field is empty...
				if (y[i].value == "") {
					// add an "invalid" class to the field:
					y[i].className += " invalid";
					// and set the current valid status to false
					valid = false;
				}
			}
			// If the valid status is true, mark the step as finished and valid:
			if (valid) {
				document.getElementsByClassName("step")[currentTab].className += " finish";
			}
			return valid; // return the valid status
		}

		function fixStepIndicator(n) {
			// This function removes the "active" class of all steps...
			var i, x = document.getElementsByClassName("step");
			for (i = 0; i < x.length; i++) {
				x[i].className = x[i].className.replace(" active", "");
			}
			//... and adds the "active" class on the current step:
			x[n].className += " active";
		}
	</script>


</body>
</html>
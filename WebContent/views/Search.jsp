<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>View Data</title>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/Search.css">
<script language="javascript"
	src="<%=request.getContextPath()%>/js/Search.js"></script>
</head>
<body onload="checkView('${chooseView}','${endPage}')">
	<form action="SearchCompany" id="ViewCompany" method="post"
		onsubmit="listNodeCheckedLogic()" class="form-login">
		<div class="header">
			<div class="left">
				<h3>Hello ${userName}</h3>
			</div>
			<div class="right">
				<a href="Login" class="logout">Logout</a>
			</div>
		</div>

		<input type="hidden" id="page" name="page" ReadOnly value="${page}" />
		<input type="hidden" id="endPage" name="endPage" ReadOnly
			value="${endPage}" /> <input type="hidden" id="listNodeChecked"
			name="listNodeChecked" ReadOnly value="" />
		<div class="select">
			<label for="cars">ChooseView:</label> <select name="chooseView"
				id="chooseView">
				<option value="viewCompany">View Company</option>
				<option value="viewDateTrade">View Date</option>
				<option value="viewFactTrade">View Fact</option>
			</select>
			<button type="submit">choose</button>
		</div>

		<div class="crud">
			<a href="EditCompany"><button type="button"
					name="buttonAddDelete" value="add">Add New</button></a>
			<button type="submit" name="buttonAddDelete" value="delete">Delete</button>
		</div>

		<div class="btn">
			<div class="gr-1">
				<button onClick="firstPageLogic()" id="firstPage" type="button">&lt;&lt;</button>
				<button onClick="previousPageLogic()" id="previousPage"
					type="button">&lt;</button>
			</div>
			<div class="gr-2">
				<button onClick="nextPageLogic('${endPage}')" id="nextPage"
					type="button">&gt;</button>
				<button onClick="lastPageLogic('${endPage}')" id="lastPage"
					type="button">&gt;&gt;</button>
			</div>
		</div>


		<!-- View Company -->
		<c:if test="${chooseView == 'viewCompany'}">

			<div class="container">
				<h2>View Company List</h2>
				<table class="responsive-table">
					<thead>
						<tr class="table-header">
							<th class="col col-1"><input type="checkbox" id="root"
								name="root" onChange="checkRoot()"></th>
							<th class="col col-2">ID</th>
							<th class="col col-3">Symbol</th>
							<th class="col col-4">Name</th>
							<th class="col col-5">Major</th>
							<th class="col col-6">Phone</th>
							<th class="col col-7">Info</th>
							<th class="col col-8">Address</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="item" >

							<tr class="tr-son">
								<td class="td-son"><input type="checkbox" id="node"
									onChange="checkNode()" name="node" value="${item.id}"></td>
								<td class="td-son"><a
									href="EditCompany?companyId=${item.id}">${item.id}</a></td>
								<td class="td-son">${item.symbol}</td>
								<td class="td-son">${item.name}</td>
								<td class="td-son">${item.major}</td>
								<td class="td-son">${item.phone}</td>
								<td class="td-son">${item.info}</td>
								<td class="td-son">${item.address}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
			
		</c:if>

		<!-- View Date -->
		<c:if test="${chooseView == 'viewDateTrade'}">

			<div class="container">
				<h2>View Date Trade List</h2>
				<table class="responsive-table">
					<thead>
						<tr class="table-header">
							<th class="col col-1"><input type="checkbox" id="root"
								name="root" onChange="checkRoot()"></th>
							<th class="col col-2">ID</th>
							<th class="col col-3">Date Trade</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="item">

							<tr class="tr-son">
								<td class="td-son"><input type="checkbox" id="node"
									onChange="checkNode()" name="node" value="${item.id}"></td>
								<td class="td-son"><a
									href="EditCompany?dateId=${item.id}">${item.id}</a></td>
								<td class="td-son">${item.dateTrade}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</c:if>

		<!-- View Company -->
		<c:if test="${chooseView == 'viewFactTrade'}">

			<div class="container">
				<h2>View Fact Trade List</h2>
				<table class="responsive-table">
					<thead>
						<tr class="table-header">
							<th class="col col-1"><input type="checkbox" id="root"
								name="root" onChange="checkRoot()"></th>
							<th class="col col-2">ID</th>
							<th class="col col-3">Id Date</th>
							<th class="col col-4">Id Company</th>
							<th class="col col-5">Price Reference</th>
							<th class="col col-6">Price Open</th>
							<th class="col col-7">Price Close</th>
							<th class="col col-8">Price Ceiling</th>
							<th class="col col-9">Price Floor</th>
							<th class="col col-10">Mean</th>
							<th class="col col-11">Volatility</th>
							<th class="col col-12">Volatility Percent</th>
							<th class="col col-13">Total Volume</th>
							<th class="col col-14">Total Price</th>
							<th class="col col-15">Total Marketcapitalization</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="item">

							<tr class="tr-son">
								<td class="td-son"><input type="checkbox" id="node"
									onChange="checkNode()" name="node" value="${item.id}"></td>
								<td class="td-son"><a
									href="EditCompany?factTradeId=${item.id}">${item.id}</a></td>
								<td class="td-son">${item.id_date}</td>
								<td class="td-son">${item.id_company}</td>
								<td class="td-son">${item.price_reference}</td>
								<td class="td-son">${item.price_open}</td>
								<td class="td-son">${item.price_close}</td>
								<td class="td-son">${item.price_ceiling}</td>
								<td class="td-son">${item.price_floor}</td>
								<td class="td-son">${item.mean}</td>
								<td class="td-son">${item.volatility}</td>
								<td class="td-son">${item.volatility_percent}</td>
								<td class="td-son">${item.total_volume}</td>
								<td class="td-son">${item.total_price}</td>
								<td class="td-son">${item.total_marketcapitalization}</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</c:if>

	</form>
</body>
</html>
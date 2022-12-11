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


		<!-- View Company -->
		<c:if test="${chooseView == 'viewCompany'}">

			<div class="container">
				<h2>View Company List</h2>
				<table class="table table-striped">
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
								<td scope="row">${item.symbol}</td>
								<td scope="row">${item.name}</td>
								<td scope="row">${item.major}</td>
								<td scope="row">${item.phone}</td>
								<td scope="row">${item.info}</td>
								<td scope="row">${item.address}</td>
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
				<table class="table table-striped">
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

			<div class="container">
				<h2>View Fact Trade List</h2>
				<table class="table table-striped">
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
</body>
</html>


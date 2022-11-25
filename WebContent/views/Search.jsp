<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
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
	<form action="SearchCompany" id="ViewCompany" method="post" onsubmit="listNodeCheckedLogic()" class="form-login">
		<h3>Hello ${userName}</h3>
		<hr style="padding: 0.1%; background-color: red;" />
		
		<input type="hidden" id="page" name="page" ReadOnly value="${page}" />
		<input type="hidden" id="endPage" name="endPage" ReadOnly value="${endPage}" />
		<input type="hidden" id="listNodeChecked" name="listNodeChecked" ReadOnly value="" />
		<label for="cars">Choose View:</label>

		<select name="chooseView" id="chooseView">
  			<option value="viewCompany">View Company</option>
  			<option value="viewDateTrade">View Date</option>
  			<option value="viewFactTrade">View Fact</option>
		</select>
		<button type="submit">choose</button>
		<hr style="padding: 0.1%; background-color: red;" />
	
		<button onClick="firstPageLogic()" id="firstPage" type="button"><<</button>
		<button onClick="previousPageLogic()" id="previousPage" type="button"><</button>
		<button onClick="nextPageLogic('${endPage}')" id="nextPage" type="button">></button>
		<button onClick="lastPageLogic('${endPage}')" id="lastPage" type="button">>></button>

		<hr style="padding: 0.1%; background-color: red;" />
		<!-- View Company -->
		<c:if test="${chooseView == 'viewCompany'}">
		<table class="table-main">
			<tr class="tr-main">
				<th class="th-main">View Company List</th>
			</tr>
			<tr class="tr-main">
				<td class="td-main">
					<table class="table-son">
						<tr class="tr-son">
							<th class="th-son"><input type="checkbox" id="root"
								name="root" onChange="checkRoot()"></th>
							<th class="th-son">ID</th>
							<th class="th-son">Symbol</th>
							<th class="th-son">Name</th>
							<th class="th-son">Major</th>
							<th class="th-son">Phone</th>
							<th class="th-son">Info</th>
							<th class="th-son">Address</th>
						</tr>
						<c:forEach items="${list}" var="item">
							<tr class="tr-son">
								<td class="td-son"><input type="checkbox" id="node"  onChange="checkNode()"
									name="node" value="${item.id}"></td>
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
					</table> 
				</td>
			</tr>
		</table>
		</c:if>
		
		<!-- View Date -->
		<c:if test="${chooseView == 'viewDateTrade'}">
		<table class="table-main">
			<tr class="tr-main">
				<th class="th-main">View Date Trade List</th>
			</tr>
			<tr class="tr-main">
				<td class="td-main">
					<table class="table-son">
						<tr class="tr-son">
							<th class="th-son"><input type="checkbox" id="root"
								name="root" onChange="checkRoot()"></th>
							<th class="th-son">ID</th>
							<th class="th-son">Date Trade</th>
						</tr>
						<c:forEach items="${list}" var="item">
							<tr class="tr-son">
								<td class="td-son"><input type="checkbox" id="node"  onChange="checkNode()"
									name="node" value="${item.id}"></td>
								<td class="td-son"><a
									href="EditCompany?companyId=${item.id}">${item.id}</a></td>
								<td class="td-son">${item.dateTrade}</td>
								
							</tr>
						</c:forEach>
					</table> 
				</td>
			</tr>
		</table>
		</c:if>
		
		<!-- View Company -->
		<c:if test="${chooseView == 'viewFactTrade'}">
		<table class="table-main">
			<tr class="tr-main">
				<th class="th-main">View Fact Trade List</th>
			</tr>
			<tr class="tr-main">
				<td class="td-main">
					<table class="table-son">
						<tr class="tr-son">
							<th class="th-son"><input type="checkbox" id="root"
								name="root" onChange="checkRoot()"></th>
							<th class="th-son">ID</th>
							<th class="th-son">Id Date</th>
							<th class="th-son">Id Company</th>
							<th class="th-son">Price Reference</th>
							<th class="th-son">Price Open</th>
							<th class="th-son">Price Close</th>
							<th class="th-son">Price Ceiling</th>
							<th class="th-son">Price Floor</th>
							<th class="th-son">Mean</th>
							<th class="th-son">Volatility</th>
							<th class="th-son">Volatility Percent</th>
							<th class="th-son">Total Volume</th>
							<th class="th-son">Total Price</th>
							<th class="th-son">Total Marketcapitalization</th>
						</tr>
						<c:forEach items="${list}" var="item">
							<tr class="tr-son">
								<td class="td-son"><input type="checkbox" id="node"  onChange="checkNode()"
									name="node" value="${item.id}"></td>
								<td class="td-son"><a
									href="EditCompany?companyId=${item.id}">${item.id}</a></td>
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
					</table> 
				</td>
			</tr>
		</table>
		</c:if>
		<button type="submit" name="buttonAddDelete" value="add">Add New</button>
		<button type="submit" name="buttonAddDelete" value="delete">Delete</button>
	</form>
</body>
</html>
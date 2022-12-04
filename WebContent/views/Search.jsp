<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD

<meta charset="UTF-8" name="viewport"
=======
<meta charset="UTF-8">
<meta name="viewport"
>>>>>>> 0a657576867f3c0e8079bbe34ed363208918a5f6
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>View Data</title>


<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/Search.css">
<<<<<<< HEAD
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

=======
</head>
<body onload="checkView('${chooseView}','${endPage}')">
	
<jsp include>
	<div class="header">
		<h3>Hello ${userName}</h3>
	</div>
	<form action="SearchCompany" id="ViewCompany" method="post" onsubmit="listNodeCheckedLogic()" class="form-login">
		
		
		<input type="hidden" id="page" name="page" ReadOnly value="${page}" />
		<input type="hidden" id="endPage" name="endPage" ReadOnly value="${endPage}" />
		<input type="hidden" id="listNodeChecked" name="listNodeChecked" ReadOnly value="" />
		<div class="select">
			<label for="cars">Choose View:</label>
			<select name="chooseView" id="chooseView">
				<option value="viewCompany" >View Company</option>
				<option value="viewDateTrade" >View Date</option>
				<option value="viewFactTrade" >View Fact</option>
		  	</select>
		  	<button class="btn-choose" type="submit">choose</button>
		</div>
		<div class="crud">
			<button type="submit" class="btn-add" name="buttonAddDelete" value="add">Add New</button>
			<button type="submit" class="btn-delete" name="buttonAddDelete" value="delete">Delete</button>
		</div>
		<div class="btn">
			<div class="gr-1">
				<button onClick="firstPageLogic()" id="firstPage" class="btn-2" type="button">&lt;&lt;</button>
			<button onClick="previousPageLogic()" id="previousPage" class="btn-1" type="button">&lt;</button>
			</div>
			<div class="gr-2">
				<button onClick="nextPageLogic('${endPage}')" id="nextPage" class="btn-1" type="button">&gt;</button>
			<button onClick="lastPageLogic('${endPage}')" id="lastPage" class="btn-2" type="button">&gt;&gt;</button>
			</div>
		</div>	
		

		<!-- View Company -->
		<c:if test="${chooseView == 'viewCompany'}">
>>>>>>> 0a657576867f3c0e8079bbe34ed363208918a5f6
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
<<<<<<< HEAD
						<c:forEach items="${list}" var="item" >

=======
						<c:forEach items="${list}" var="item" class="table-row">
>>>>>>> 0a657576867f3c0e8079bbe34ed363208918a5f6
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
<<<<<<< HEAD

					</tbody>
				</table>
			</div>
			
=======
					</tbody>
				</table>
			</div>		
>>>>>>> 0a657576867f3c0e8079bbe34ed363208918a5f6
		</c:if>

		<!-- View Date -->
		<c:if test="${chooseView == 'viewDateTrade'}">
<<<<<<< HEAD

=======
>>>>>>> 0a657576867f3c0e8079bbe34ed363208918a5f6
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
<<<<<<< HEAD
						<c:forEach items="${list}" var="item">

=======
						<c:forEach items="${list}" var="item" class="table-row">
>>>>>>> 0a657576867f3c0e8079bbe34ed363208918a5f6
							<tr class="tr-son">
								<td class="td-son"><input type="checkbox" id="node"
									onChange="checkNode()" name="node" value="${item.id}"></td>
								<td class="td-son"><a
<<<<<<< HEAD
									href="EditCompany?dateId=${item.id}">${item.id}</a></td>
								<td class="td-son">${item.dateTrade}</td>
							</tr>
						</c:forEach>

=======
											href="EditCompany?companyId=${item.id}">${item.id}</a></td>
								<td class="td-son">${item.dateTrade}</td>										
							</tr>
						</c:forEach>
>>>>>>> 0a657576867f3c0e8079bbe34ed363208918a5f6
					</tbody>
				</table>
			</div>
		</c:if>

		<!-- View Company -->
		<c:if test="${chooseView == 'viewFactTrade'}">
<<<<<<< HEAD

=======
>>>>>>> 0a657576867f3c0e8079bbe34ed363208918a5f6
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
<<<<<<< HEAD
						<c:forEach items="${list}" var="item">

=======
						<c:forEach items="${list}" var="item" class="table-row">
>>>>>>> 0a657576867f3c0e8079bbe34ed363208918a5f6
							<tr class="tr-son">
								<td class="td-son"><input type="checkbox" id="node"
									onChange="checkNode()" name="node" value="${item.id}"></td>
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
<<<<<<< HEAD

=======
>>>>>>> 0a657576867f3c0e8079bbe34ed363208918a5f6
					</tbody>
				</table>
			</div>
		</c:if>
<<<<<<< HEAD

=======
		
>>>>>>> 0a657576867f3c0e8079bbe34ed363208918a5f6
	</form>
</body>
</html>
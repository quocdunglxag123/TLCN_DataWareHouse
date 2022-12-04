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

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/Edit.css">
<script language="javascript"
	src="<%=request.getContextPath()%>/js/Edit.js"></script>

</head>
<body onload="checkStatus()">
<<<<<<< HEAD
	<div class="background">
		<img src="img/STOCKtrade1.png" width="200" height="175" alt="logo">
	</div>
	<div class="cicle-1"></div>
	<div class="cicle-2"></div>
	<div class="container">
		<div class="panel-heading">
			<h3 class="panel-title" id="status">Status</h3>
		</div>
		<div class="panel-body">
			<form action="EditCompany" method="post" class="form-login"
				id="form-login" name="form">
				<c:if test="${chooseView == 'viewCompany'}">
					<div class="form-group">
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

				</c:if>
				<c:if test="${chooseView == 'viewDateTrade'}">
						<div class="form-group">
							<input class="form-control" id="dateTradeId" name="dateTradeId"
								type="text" value="${dateTradedto.id}" readonly>
						</div>
						<div class="form-group">
							<input class="form-control" placeholder="Date Trade"
								id="dateTrade" name="dateTrade" type="text"
								value="${dateTradeDto.dateTrade}" required>
						</div>
				</c:if>
				<c:if test="${chooseView == 'viewFactTrade'}">
					<div class="form-group">
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
					</div>
				</c:if>
				<div class="form-group">
				<button value="edit" name="buttonEdit" type="submit">Submit</button>
				<button type="reset">Reset Value</button>
				<a href="SearchCompany"><button type="button">Cancel</button></a></div>
			</form>
		</div>
	</div>
	<script language="javascript"
		src="<%=request.getContextPath()%>/js/Edit.js"></script>
=======

	<div class="container">	
		<!-- <div class="image">
			<img src="img/4dfeb4.png" alt="img">
		</div> -->
		<div class="panel-heading">
		<h3 class="panel-title" id="status">Status</h3>
		</div>
		<div class="form">
			<p style="margin: 0; padding: 0; color: red">${message}</p>
			<form action="EditCompany" method="post" class="form-login" id="form-login" name="form">
				<fieldset>
				<div class="form-group">
					<input class="form-control" id="companyId" name="companyId" type="text" value="${company.id}" readonly >
					<input class="form-control"  placeholder="Symbol" id="companySymbol" name="companySymbol" type="text" value="${company.symbol}" required >
					<input class="form-control" placeholder="Name"  name="companyName" value="${company.name}" >
					<input class="form-control" placeholder="Major"  name="companyMajor" value="${company.major}" >
					<input class="form-control" placeholder="Phone"  name="companyPhone" value="${company.phone}" >
					<textarea class="form-control" style="resize: none;" name="companyInfo" rows="4" cols="40">${company.info}</textarea>
					<input class="form-control" placeholder="Address"  name="companyAddress" value="${company.address}" >
				</div>
				<button value="edit" name="buttonEdit" type="submit">Submit</button>
				</fieldset>        
		</form>
		<!-- <input type="text" id="user" placeholder="User ID">
		<input type="password" id="password" placeholder="Passwork">
		<button type="submit" id="submit" value="Submit">Submit</button>
		<p><a href="register.html">Create your account</a></p> -->
		</div>
		<!-- <div class="row vertical-offset-100">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						
					</div>
					<div class="panel-body">
						<p style="margin: 0; padding: 0; color: red">${message}</p>
						<form action="EditCompany" method="post" class="form-login" id="form-login" name="form">
							<fieldset>
								<div class="form-group">
									<input class="form-control" id="companyId" name="companyId" type="text" value="${company.id}" readonly >
								</div>
								<div class="form-group">
									<input class="form-control"  placeholder="Symbol" id="companySymbol" name="companySymbol" type="text" value="${company.symbol}" required >
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Name"  name="companyName" value="${company.name}" >
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Major"  name="companyMajor" value="${company.major}" >
									
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Phone"  name="companyPhone" value="${company.phone}" >
									
								</div>
								<div class="form-group"  >
									<textarea style="resize: none;" name="companyInfo" rows="4" cols="40">${company.info}</textarea>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Address"  name="companyAddress" value="${company.address}" >
								</div>
								<button value="edit" name="buttonEdit" type="submit">Submit</button>

							</fieldset>
						
						</form>
					</div>
				</div>
			</div>
		</div> -->
	</div>
	
>>>>>>> 0a657576867f3c0e8079bbe34ed363208918a5f6
</body>
</html>
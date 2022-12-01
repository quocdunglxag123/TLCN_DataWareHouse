<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Edit</title>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/Login.css">
<script language="javascript"
		src="<%=request.getContextPath()%>/js/Edit.js"></script>

</head>
<body onload="checkStatus()">

	<div class="container">
		<div class="row vertical-offset-100">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title" id="status">Status</h3>
					</div>
					<div class="panel-body">
						<p style="margin: 0; padding: 0; color: red">${message}</p>
						<form action="EditCompany" method="post" class="form-login" id="form-login" name="form">
							<c:if test="${chooseView == 'viewCompany'}">
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
										<%-- <input class="form-control" placeholder="Info"  name="companyInfo" value="${company.info}" > --%>
									</div>
									<div class="form-group">
										<input class="form-control" placeholder="Address"  name="companyAddress" value="${company.address}" >
									</div>
									<button value="edit" name="buttonEdit" type="submit">Submit</button>

								</fieldset>
							</c:if>
							<c:if test="${chooseView == 'viewDateTrade'}">
								<fieldset>
									<div class="form-group">
										<input class="form-control" id="companyId" name="companyId" type="text" value="${dimDate.id}" readonly >
									</div>
									<div class="form-group">
										<input class="form-control"  placeholder="Symbol" id="companySymbol" name="companySymbol" type="text" value="${dimDate.dateTrade}" required >
									</div>
									<button value="edit" name="buttonEdit" type="submit">Submit</button>

								</fieldset>
							</c:if>
							<c:if test="${chooseView == 'viewFactTrade'}">
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
										<%-- <input class="form-control" placeholder="Info"  name="companyInfo" value="${company.info}" > --%>
									</div>
									<div class="form-group">
										<input class="form-control" placeholder="Address"  name="companyAddress" value="${company.address}" >
									</div>
									<button value="edit" name="buttonEdit" type="submit">Submit</button>

								</fieldset>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	
</body>
</html>
package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Impl.DaoCompanyImpl;
import dao.Impl.DaoDateTradeImpl;
import dao.Impl.DaoFactTradeImpl;
import model.Company;
import model.DateTrade;
import model.FactTrade;

/**
 * Servlet implementation class View
 */
@WebServlet("/EditCompany")
public class EditCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		DaoCompanyImpl daoEditCompany = new DaoCompanyImpl();
		DaoDateTradeImpl daoDateTradeImpl = new DaoDateTradeImpl();
		DaoFactTradeImpl daoFactTradeImpl = new DaoFactTradeImpl();
		if (!Login.checkLogin(session)) {
			// Truong hop chua login
			request.getRequestDispatcher("Login").forward(request, response);
			return;
		}

		String chooseView = (String) session.getAttribute("chooseView");
		String buttonEdit = request.getParameter("buttonEdit");

		try {
			if (chooseView.equals("viewCompany")) {
				// Get View Company --> Dim_Company
				String companyId = (String) request.getParameter("companyId");
	
				if (buttonEdit != null) {
					// set Data company from input edit view
					Company companyInput = new Company();
					companyInput.setSymbol(request.getParameter("companySymbol"));
					companyInput.setName(request.getParameter("companyName"));
					companyInput.setMajor(request.getParameter("companyMajor"));
					companyInput.setPhone(request.getParameter("companyPhone"));
					companyInput.setInfo(request.getParameter("companyInfo"));
					companyInput.setAddress(request.getParameter("companyAddress"));

					if (!companyId.equals("")) {
						// Truong hop companyId khac Null --> Edit Dim_Company
						companyInput.setId(Integer.parseInt(companyId));
						daoEditCompany.editCompany(companyInput);

					} else {
						// Truong hop companyId Null --> Add Dim_Company
						daoEditCompany.addCompany(companyInput);
						request.getRequestDispatcher("SearchCompany").forward(request, response);
						return;
					}
					
				}
				// get company by Id To show Edit
				if(companyId != null) {
					Company company = daoEditCompany.getCompanyById(companyId);
					request.setAttribute("company", company);
				}

			} else if (chooseView.equals("viewDateTrade")) {
				// Get View Date Trade --> Fact_Trade
				DateTrade dateTradeInput = new DateTrade();
				String dateTradeId = (String) request.getParameter("dateTradeId");
				
				if (buttonEdit != null) {
					// Set data date from input edit view
					dateTradeInput.setDateTrade(formatter.parse((String) request.getParameter("dateTrade")));
					if (!dateTradeId.equals("")) {
						// Truong hop DateId khac Null --> Edit Dim_Date
						dateTradeInput.setId(Integer.parseInt(dateTradeId));
						daoDateTradeImpl.editDateTrade(dateTradeInput);

					} else {
						// Truong hop DateId Null --> Add Dim_Date
						daoDateTradeImpl.addDateTrade(dateTradeInput);
						request.getRequestDispatcher("SearchCompany").forward(request, response);
						return;
					}
				}
				// Get date trade by Id To show Edit
				if (dateTradeId != null) {
					DateTrade dateTradeDto = daoDateTradeImpl.getDateTradeById(dateTradeId);
					request.setAttribute("dateTradeDto", dateTradeDto);
				}
			} else if (chooseView.equals("viewFactTrade")) {
				// Get View Fact Trade --> Fact_Trade
				FactTrade factTradeInput = new FactTrade();
				String factTradeId = (String) request.getParameter("factTradeId");

				if (buttonEdit != null) {
					// Set data fact trade from input edit view
					factTradeInput.setId_date(Integer.parseInt(request.getParameter("id_date")));
					factTradeInput.setId_company(Integer.parseInt(request.getParameter("id_company")));
					factTradeInput.setPrice_reference(new BigDecimal(request.getParameter("price_reference")));
					factTradeInput.setPrice_reference(new BigDecimal(request.getParameter("price_reference")));
					factTradeInput.setPrice_open(new BigDecimal(request.getParameter("price_open")));
					factTradeInput.setPrice_close(new BigDecimal(request.getParameter("price_close")));
					factTradeInput.setPrice_ceiling(new BigDecimal(request.getParameter("price_ceiling")));
					factTradeInput.setPrice_floor(new BigDecimal(request.getParameter("price_floor")));
					factTradeInput.setMean(new BigDecimal(request.getParameter("mean")));
					factTradeInput.setVolatility(new BigDecimal(request.getParameter("volatility")));
					factTradeInput.setVolatility_percent(new BigDecimal(request.getParameter("volatility_percent")));
					factTradeInput.setTotal_volume(new BigDecimal(request.getParameter("total_volume")));
					factTradeInput.setTotal_price(new BigDecimal(request.getParameter("total_price")));
					factTradeInput.setTotal_marketcapitalization(
							new BigDecimal(request.getParameter("total_marketcapitalization")));

					if (!factTradeId.equals("")) {
						// Truong hop factTradeId khac Null --> Edit Fact_Trade
						factTradeInput.setId(Integer.parseInt(factTradeId));
						daoFactTradeImpl.editFactTrade(factTradeInput);

					} else {
						// Truong hop factTradeId Null --> Add Fact_Trade
						daoFactTradeImpl.addFactTrade(factTradeInput);
						request.getRequestDispatcher("SearchCompany").forward(request, response);
						return;
					}
				}
				// Get date trade by Id To show Edit
				if (factTradeId != null) {
					FactTrade factTrade = daoFactTradeImpl.getFactTradeById(factTradeId);
					request.setAttribute("factTrade", factTrade);
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}

		request.getRequestDispatcher("/views/Edit.jsp").forward(request, response);
	}

}

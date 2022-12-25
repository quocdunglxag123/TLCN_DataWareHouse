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
import dao.Impl.DaoExchangeImpl;
import dao.Impl.DaoFactBusinessResultImpl;
import dao.Impl.DaoFactForeignInvestorAuctionImpl;
import dao.Impl.DaoFactStockOrderImpl;
import dao.Impl.DaoFactTradeImpl;
import model.Company;
import model.DateTrade;
import model.Exchange;
import model.FactBusinessResult;
import model.FactForeignInvestorAuction;
import model.FactStockOrder;
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
		DaoCompanyImpl daoCompanyImpl = new DaoCompanyImpl();
		DaoDateTradeImpl daoDateTradeImpl = new DaoDateTradeImpl();
		DaoFactTradeImpl daoFactTradeImpl = new DaoFactTradeImpl();
		DaoExchangeImpl daoExchangeImpl = new DaoExchangeImpl();
		DaoFactBusinessResultImpl daoFactBusinessResultImpl = new DaoFactBusinessResultImpl();
		DaoFactStockOrderImpl daoFactStockOrderImpl = new DaoFactStockOrderImpl();
		DaoFactForeignInvestorAuctionImpl daoFactForeignInvestorAuctionImpl = new DaoFactForeignInvestorAuctionImpl();
		
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
						daoCompanyImpl.editCompany(companyInput);

					} else {
						// Truong hop companyId Null --> Add Dim_Company
						daoCompanyImpl.addCompany(companyInput);
						request.getRequestDispatcher("SearchCompany").forward(request, response);
						return;
					}
					
				}
				// get company by Id To show Edit
				if(companyId != null) {
					Company company = daoCompanyImpl.getCompanyById(companyId);
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
			}else if (chooseView.equals("viewExchange")) {
				// Get View Exchange--> Dim_Exchange
				String exchangeId = (String) request.getParameter("exchangeId");
	
				if (buttonEdit != null) {
					// set Data Exchange from input edit view
					Exchange exchangeInput = new Exchange();
					exchangeInput.setSymbol(request.getParameter("exchangeSymbol"));
					exchangeInput.setName(request.getParameter("exchangeName"));
					exchangeInput.setInfo(request.getParameter("exchangeInfo"));

					if (!exchangeId.equals("")) {
						// Truong hop exchangeId khac Null --> Edit Dim_Exchange
						exchangeInput.setId(Integer.parseInt(exchangeId));
						daoExchangeImpl.editExchange(exchangeInput);

					} else {
						// Truong hop exchangeId Null --> Add Dim_exchange
						daoExchangeImpl.addExchange(exchangeInput);
						request.getRequestDispatcher("SearchCompany").forward(request, response);
						return;
					}
					
				}
				// get Exchange by Id To show Edit
				if(exchangeId != null) {
					Exchange exchange = daoExchangeImpl.getExchangeById(exchangeId);
					request.setAttribute("exchange", exchange);
				}

			}else if (chooseView.equals("viewFactBusinessResult")) {
				// Get View Fact BusinessResult --> Fact_BusinessResult
				FactBusinessResult factBusinessResultInput = new FactBusinessResult();
				String factBusinessResultId = (String) request.getParameter("factBusinessResultId");
				if (buttonEdit != null) {
					// Set data fact BusinessResult from input edit view
					factBusinessResultInput.setId_date(Integer.parseInt(request.getParameter("id_date")));
					factBusinessResultInput.setId_company(Integer.parseInt(request.getParameter("id_company")));
					factBusinessResultInput.setId_exchange(Integer.parseInt(request.getParameter("id_exchange")));
					factBusinessResultInput.setStatus(request.getParameter("status"));
					factBusinessResultInput.setProfit(Float.parseFloat(request.getParameter("profit")));
					factBusinessResultInput.setPrevious_period(Float.parseFloat(request.getParameter("previous_period")));
					factBusinessResultInput.setSame_period(Float.parseFloat(request.getParameter("same_period")));
					factBusinessResultInput.setProfit_cummulative(Float.parseFloat(request.getParameter("profit_cummulative")));
					factBusinessResultInput.setEps_profit(Float.parseFloat(request.getParameter("eps_profit")));
					factBusinessResultInput.setEps_cummulative(Float.parseFloat(request.getParameter("eps_cummulative")));
					factBusinessResultInput.setPrice_earning_ratio(Float.parseFloat(request.getParameter("price_earning_ratio")));

					if (!factBusinessResultId.equals("")) {
						// Truong hop factBusinessResultId khac Null --> Edit Fact_BusinessResult
						factBusinessResultInput.setId(Integer.parseInt(factBusinessResultId));
						daoFactBusinessResultImpl.editFactBusinessResult(factBusinessResultInput);

					} else {
						// Truong hop factBusinessResultId Null --> Add Fact_BusinessResult
						daoFactBusinessResultImpl.addFactBusinessResult(factBusinessResultInput);
						request.getRequestDispatcher("SearchCompany").forward(request, response);
						return;
					}
				}
				// Get date BusinessResult by Id To show Edit
				if (factBusinessResultId != null) {
					FactBusinessResult factBusinessResult = daoFactBusinessResultImpl.getFactBusinessResultById(factBusinessResultId);
					request.setAttribute("factBusinessResult", factBusinessResult);
				}
			}else if (chooseView.equals("viewFactStockOrder")) {
				// Get View Stock Order
				FactStockOrder factStockOrderInput = new FactStockOrder();
				String factStockOrderId = (String) request.getParameter("factStockOrderId");

				if (buttonEdit != null) {
					// Set data fact Stock Order from input edit view
					factStockOrderInput.setId_date(Integer.parseInt(request.getParameter("id_date")));
					factStockOrderInput.setId_company(Integer.parseInt(request.getParameter("id_company")));
					factStockOrderInput.setPrice_close(new BigDecimal(request.getParameter("price_close")));
					factStockOrderInput.setTotal_volume_auction(new BigDecimal(request.getParameter("total_volume_auction")));
					factStockOrderInput.setTotal_price_auction(new BigDecimal(request.getParameter("total_price_auction")));
					factStockOrderInput.setBest_buy_price(new BigDecimal(request.getParameter("best_buy_price")));
					factStockOrderInput.setBest_buy_volume(new BigDecimal(request.getParameter("best_buy_volume")));
					factStockOrderInput.setBest_sell_price(new BigDecimal(request.getParameter("best_sell_price")));
					factStockOrderInput.setBest_sell_volume(new BigDecimal(request.getParameter("best_sell_volume")));
					factStockOrderInput.setTotal_order_buy(new BigDecimal(request.getParameter("total_order_buy")));
					factStockOrderInput.setTotal_order_sell(new BigDecimal(request.getParameter("total_order_sell")));
					factStockOrderInput.setTotal_order_buy_minus_sell(new BigDecimal(request.getParameter("total_order_buy_minus_sell")));
					factStockOrderInput.setTotal_volume_buy(new BigDecimal(request.getParameter("total_volume_buy")));
					factStockOrderInput.setTotal_volume_sell(new BigDecimal(request.getParameter("total_volume_sell")));
					factStockOrderInput.setTotal_volume_buy_minus_sell(new BigDecimal(request.getParameter("total_volume_buy_minus_sell")));

					if (!factStockOrderId.equals("")) {
						// Truong hop factStockOrderId khac Null --> Edit Fact_StockOrder
						factStockOrderInput.setId(Integer.parseInt(factStockOrderId));
						daoFactStockOrderImpl.editFactStockOrder(factStockOrderInput);

					} else {
						// Truong hop factStockOrderId Null --> Add Fact_StockOrder
						daoFactStockOrderImpl.addFactStockOrder(factStockOrderInput);
						request.getRequestDispatcher("SearchCompany").forward(request, response);
						return;
					}
				}
				// Get date StockOrder by Id To show Edit
				if (factStockOrderId != null) {
					FactStockOrder factStockOrder = daoFactStockOrderImpl.getFactStockOrderById(factStockOrderId);
					request.setAttribute("factStockOrder", factStockOrder);
				}
				//*****************************************************
			}else if (chooseView.equals("viewFactForeignInvestorAuction")) {
				// Get View Stock Order
				FactForeignInvestorAuction factForeignInvestorAuctionInput = new FactForeignInvestorAuction();
				String factForeignInvestorAuctionId = (String) request.getParameter("factForeignInvestorAuctionId");

				if (buttonEdit != null) {
					// Set data fact Stock Order from input edit view
					factForeignInvestorAuctionInput.setId_date(Integer.parseInt(request.getParameter("id_date")));
					factForeignInvestorAuctionInput.setId_company(Integer.parseInt(request.getParameter("id_company")));
					factForeignInvestorAuctionInput.setRoom(new BigDecimal(request.getParameter("room")));
					factForeignInvestorAuctionInput.setPercent_owned(new BigDecimal(request.getParameter("percent_owned")));
					factForeignInvestorAuctionInput.setRoom_available(new BigDecimal(request.getParameter("room_available")));
					factForeignInvestorAuctionInput.setPercent_room_available(new BigDecimal(request.getParameter("percent_room_available")));
					factForeignInvestorAuctionInput.setBuy_volume_auction(new BigDecimal(request.getParameter("buy_volume_auction")));
					factForeignInvestorAuctionInput.setPercent_buy_volume_auction_market(new BigDecimal(request.getParameter("percent_buy_volume_auction_market")));
					factForeignInvestorAuctionInput.setSell_volume_auction(new BigDecimal(request.getParameter("sell_volume_auction")));
					factForeignInvestorAuctionInput.setPercent_sell_volume_auction_market(new BigDecimal(request.getParameter("percent_sell_volume_auction_market")));
					factForeignInvestorAuctionInput.setBuy_price_auction(new BigDecimal(request.getParameter("buy_price_auction")));
					factForeignInvestorAuctionInput.setPercent_buy_price_auction_market(new BigDecimal(request.getParameter("percent_buy_price_auction_market")));
					factForeignInvestorAuctionInput.setSell_price_auction(new BigDecimal(request.getParameter("sell_price_auction")));
					factForeignInvestorAuctionInput.setPercent_sell_price_auction_market(new BigDecimal(request.getParameter("percent_sell_price_auction_market")));
					factForeignInvestorAuctionInput.setDifference_volume(new BigDecimal(request.getParameter("difference_volume")));
					factForeignInvestorAuctionInput.setDifference_price(new BigDecimal(request.getParameter("difference_price")));

					if (!factForeignInvestorAuctionId.equals("")) {
						// Truong hop factfactForeignInvestorAuctionInputId khac Null --> Edit Fact_ForeignInvestorAuctionInput
						factForeignInvestorAuctionInput.setId(Integer.parseInt(factForeignInvestorAuctionId));
						daoFactForeignInvestorAuctionImpl.editFactForeignInvestorAuction(factForeignInvestorAuctionInput);

					} else {
						// Truong hop factForeignInvestorAuctionId Null --> Add Fact_ForeignInvestorAuction
						daoFactForeignInvestorAuctionImpl.addFactForeignInvestorAuction(factForeignInvestorAuctionInput);
						request.getRequestDispatcher("SearchCompany").forward(request, response);
						return;
					}
				}
				// Get date trade by Id To show Edit
				if (factForeignInvestorAuctionId != null) {
					FactForeignInvestorAuction factForeignInvestorAuction = daoFactForeignInvestorAuctionImpl.getFactForeignInvestorAuctionById(factForeignInvestorAuctionId);
					request.setAttribute("factForeignInvestorAuction", factForeignInvestorAuction);
				}
			}
			
			
			
		} catch (ParseException e) {
			e.printStackTrace();
		}

		request.getRequestDispatcher("/views/Edit.jsp").forward(request, response);
	}

}

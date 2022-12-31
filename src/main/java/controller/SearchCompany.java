package controller;

import java.io.IOException;
import java.util.List;
import java.util.Set;

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
import dto.FactBusinessResultDto;
import dto.FactForeignInvestorAuctionDto;
import dto.FactStockOrderDto;
import dto.FactTradeDto;
import model.Company;
import model.DateTrade;
import model.Exchange;

/**
 * Servlet implementation class View
 */
@WebServlet("/SearchCompany")
public class SearchCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DaoCompanyImpl daoCompanyImpl = new DaoCompanyImpl();
	DaoDateTradeImpl daoDateTradeImpl = new DaoDateTradeImpl();
	DaoFactTradeImpl daoFactTradeImpl = new DaoFactTradeImpl();
	DaoExchangeImpl daoExchangeImpl = new DaoExchangeImpl();
	DaoFactBusinessResultImpl daoFactBusinessResultImpl = new DaoFactBusinessResultImpl();
	DaoFactStockOrderImpl daoFactStockOrderImpl = new DaoFactStockOrderImpl();
	DaoFactForeignInvestorAuctionImpl daoFactForeignInvestorAuctionImpl = new DaoFactForeignInvestorAuctionImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		// Truong hop chua login
		if (!Login.checkLogin(session)) {
  			request.getRequestDispatcher("Login").forward(request, response);
			return;
		}

		// get input from jsp
		String page = request.getParameter("page");//trang page hien thi
		String search = request.getParameter("search");//search page
		String buttonDelete = request.getParameter("buttonDelete");
		String chooseView = (String) request.getParameter("chooseView");
		String isSearch = request.getParameter("submitSearch");//isClickSearch
		if (page != null) {
			// Truong hop page gui ve tu jsp khac null
			session.setAttribute("page", page);
		} else {
			// Truong hop page gui ve tu jsp la null
			page = (String) session.getAttribute("page");
		}
		if (chooseView == null) {
			//Truong hop chooseView Null--> Login To Search
			chooseView = (String) session.getAttribute("chooseView");
		} else if (!chooseView.equals((String) session.getAttribute("chooseView"))) {
			//Truong hop chooseView khac voi chooseView on session --> Thay doi View
			page = "0";
			session.setAttribute("page", page);
			session.setAttribute("chooseView", chooseView);
		}
		if (buttonDelete!=null) {
			//Truong hop button delete duoc click
			if (session.getAttribute("isReturnSearch").equals("0")) {
				//Truong hop  delete
				if (buttonDelete.equals("delete")) {
					//Truong hop button Delete
					request.getRequestDispatcher("DeleteRecord").forward(request, response);
					return;
				}
			}else {
				//Set lai gia tri isReturnSearch on session sau khi delete
				session.setAttribute("isReturnSearch", "0");
			}
			
		}
		if(isSearch != "" && isSearch != null) {
			session.setAttribute("search", search);
		}else {
			search= (String) session.getAttribute("search");
		}
			
		
		//Logic Show View
		if (chooseView.equals("viewCompany")) {
			// Truong hop choose view company
			List<Company> companies = daoCompanyImpl.getCompanyByPage(page,search);
			int endPage = daoCompanyImpl.getEndPageCompany(search);			
			request.setAttribute("list", companies);
			request.setAttribute("endPage", endPage);
		}else if (chooseView.equals("viewDateTrade")) {
			// Truong hop choose view Date Trade
			List<DateTrade> dateTrades = daoDateTradeImpl.getDateTradeByPage(page,search);
			int endPage = daoDateTradeImpl.getEndPageDateTrade(search);
			request.setAttribute("list", dateTrades);
			request.setAttribute("endPage", endPage);
		}else if (chooseView.equals("viewFactTrade")) {
			// Truong hop choose view Fact-Trade
			List<FactTradeDto> factTrades = daoFactTradeImpl.getFactTradeByPage(page,search);
			int endPage = daoFactTradeImpl.getEndPageFactTrade(search);
			
			request.setAttribute("list", factTrades);
			request.setAttribute("endPage", endPage);
		}else if (chooseView.equals("viewExchange")) {
			// Truong hop choose view Exchange
			List<Exchange> exchanges = daoExchangeImpl.getExchangeByPage(page,search);
			int endPage = daoExchangeImpl.getEndPageExchange(search);
			
			request.setAttribute("list", exchanges);
			request.setAttribute("endPage", endPage);
		}else if (chooseView.equals("viewFactBusinessResult")) {
			// Truong hop choose view Fact-Trade
			List<FactBusinessResultDto> factBusinessResults = daoFactBusinessResultImpl.getFactBusinessResultByPage(page,search);
			int endPage = daoFactBusinessResultImpl.getEndPageFactBusinessResult(search);
			request.setAttribute("list", factBusinessResults);
			request.setAttribute("endPage", endPage);
		}else if (chooseView.equals("viewFactStockOrder")) {
			// Truong hop choose view Fact-StockOrder
			List<FactStockOrderDto> factStockOrders = daoFactStockOrderImpl.getFactStockOrderByPage(page,search);
			int endPage = daoFactStockOrderImpl.getEndPageFactStockOrder(search);
			request.setAttribute("list", factStockOrders);
			request.setAttribute("endPage", endPage);
		}else if (chooseView.equals("viewFactForeignInvestorAuction")) {
			// Truong hop choose view FactForeignInvestorAuction
			List<FactForeignInvestorAuctionDto> factForeignInvestorAuctions = daoFactForeignInvestorAuctionImpl.getFactForeignInvestorAuctionByPage(page,search);
			int endPage = daoFactForeignInvestorAuctionImpl.getEndPageFactForeignInvestorAuction(search);
			request.setAttribute("list", factForeignInvestorAuctions);
			request.setAttribute("endPage", endPage);
		}
		String flagString= (String)session.getAttribute("companyNameFactTradeChart");
		if ( (isSearch !="" && isSearch!=null) ||  flagString == "") {
			//Data Fact Trade To analystic --> send to js to show chart
			List<String> elementFactChart = daoFactTradeImpl.getFactTradeToChart(search);
			//set to session
			session.setAttribute("companyNameFactTradeChart", elementFactChart.get(0));
			session.setAttribute("totalVolumeFactTradeChart", elementFactChart.get(1));
			session.setAttribute("totalPriceFactTradeChart", elementFactChart.get(2));
			session.setAttribute("totalMarketCapitalizationFactTradeChart", elementFactChart.get(3));
			
			//Data Fact Stock Order To analystic --> send to js to show chart
			List<String> elementFactStockOrderChart = daoFactStockOrderImpl.getFactStockOrderToChart(search);
			//set to session
			session.setAttribute("companyNameFactStockOrderChart", elementFactStockOrderChart.get(0));
			session.setAttribute("totalOrderBuyFactStockOrderChart", elementFactStockOrderChart.get(1));
			session.setAttribute("totalOrderSellFactStockOrderChart", elementFactStockOrderChart.get(2));
			session.setAttribute("totalVolumeBuyFactStockOrderChart", elementFactStockOrderChart.get(3));
			session.setAttribute("totalVolumeSellFactStockOrderChart", elementFactStockOrderChart.get(4));
			
			//Data Fact Foreign Investor Auction To analystic --> send to js to show chart
			List<String> elementFactForeignInvestorAuctionChart = daoFactForeignInvestorAuctionImpl.getFactForeignInvestorAuctionToChart(search);
			
			//set to session
			session.setAttribute("companyNameFactForeignInvestorAuctionChart", elementFactForeignInvestorAuctionChart.get(0));
			session.setAttribute("roomFactForeignInvestorAuctionChart", elementFactForeignInvestorAuctionChart.get(1));
			session.setAttribute("roomAvailableFactForeignInvestorAuctionChart", elementFactForeignInvestorAuctionChart.get(2));
			
		}
		
		
		request.setAttribute("companyNameFactTradeChart", session.getAttribute("companyNameFactTradeChart"));
		request.setAttribute("totalVolumeFactTradeChart", session.getAttribute("totalVolumeFactTradeChart"));
		request.setAttribute("totalPriceFactTradeChart", session.getAttribute("totalPriceFactTradeChart"));
		request.setAttribute("totalMarketCapitalizationFactTradeChart", session.getAttribute("totalMarketCapitalizationFactTradeChart"));
		
		request.setAttribute("companyNameFactStockOrderChart", session.getAttribute("companyNameFactStockOrderChart"));
		request.setAttribute("totalOrderBuyFactStockOrderChart", session.getAttribute("totalOrderBuyFactStockOrderChart"));
		request.setAttribute("totalOrderSellFactStockOrderChart", session.getAttribute("totalOrderSellFactStockOrderChart"));
		request.setAttribute("totalVolumeBuyFactStockOrderChart", session.getAttribute("totalVolumeBuyFactStockOrderChart"));
		request.setAttribute("totalVolumeSellFactStockOrderChart", session.getAttribute("totalVolumeSellFactStockOrderChart"));
		
		request.setAttribute("companyNameFactForeignInvestorAuctionChart", session.getAttribute("companyNameFactForeignInvestorAuctionChart"));
		request.setAttribute("roomFactForeignInvestorAuctionChart", session.getAttribute("roomFactForeignInvestorAuctionChart"));
		request.setAttribute("roomAvailableFactForeignInvestorAuctionChart", session.getAttribute("roomAvailableFactForeignInvestorAuctionChart"));
		//Set Value To Search JSP
		request.setAttribute("chooseView", chooseView);
		request.setAttribute("page", page);
		request.setAttribute("userName", (String) session.getAttribute("userName"));
		request.setAttribute("search",search);
		request.getRequestDispatcher("/views/Search.jsp").forward(request, response);
	}

}

package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DaoDateTrade;
import dao.Impl.DaoCompanyImpl;
import dao.Impl.DaoDateTradeImpl;
import dao.Impl.DaoFactTradeImpl;
import model.Company;
import model.DateTrade;
import model.FactTrade;

/**
 * Servlet implementation class View
 */
@WebServlet("/SearchCompany")
public class SearchCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DaoCompanyImpl daoCompanyImpl = new DaoCompanyImpl();
	DaoDateTradeImpl daoDateTradeImpl = new DaoDateTradeImpl();
	DaoFactTradeImpl daoFactTradeImpl = new DaoFactTradeImpl();

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
		String page = request.getParameter("page");
		String buttonAddDelete = request.getParameter("buttonAddDelete");
		String listNodeChecked = request.getParameter("listNodeChecked");
		String chooseView = (String) request.getParameter("chooseView");

		// Truong hop page gui ve tu jsp khac null
		if (page != null) {
			session.setAttribute("page", page);
		} else {
			// Truong hop page gui ve tu jsp la null
			page = (String) session.getAttribute("page");
		}
		if (chooseView == null) {
			chooseView = (String) session.getAttribute("chooseView");
		} else if (!chooseView.equals((String) session.getAttribute("chooseView"))) {
			page = "0";
			session.setAttribute("page", page);
			session.setAttribute("chooseView", chooseView);
		}
		
		if (buttonAddDelete.equals("")) {
			if (buttonAddDelete.equals("add")) {
				request.getRequestDispatcher("/views/Edit.jsp").forward(request, response);
				return;
			}
		}

		// Truong hop chosse view company
		if (chooseView.equals("viewCompany")) {
			List<Company> companies = daoCompanyImpl.getCompanyByPage(page);
			int endPage = daoCompanyImpl.getEndPageCompany();
			// Truong hop nhap vao button tren man hinh search
			if (buttonAddDelete != null) {
				// truong hop nhap button delete
				if (buttonAddDelete.equals("delete")) {
					// ********Delete False Because "The DELETE statement conflicted with the
					// REFERENCE constraint "Fact_Company"" *******
					// daoCompanyImpl.deleteCompany(listNodeChecked);
				}
			}
			request.setAttribute("list", companies);
			request.setAttribute("endPage", endPage);
		}

		// Truong hop chosse view Date Trade
		if (chooseView.equals("viewDateTrade")) {
			List<DateTrade> dateTrades = daoDateTradeImpl.getDateTradeByPage(page);
			int endPage = daoDateTradeImpl.getEndPageDateTrade();
			// Truong hop nhap vao button tren man hinh search
			if (buttonAddDelete != null) {
				// truong hop nhap button delete
				if (buttonAddDelete.equals("delete")) {
					// ********Delete False Because "The DELETE statement conflicted with the
					// REFERENCE constraint "Fact_Company"" *******
					// daoCompanyImpl.deleteCompany(listNodeChecked);
				}

			}
			request.setAttribute("list", dateTrades);
			request.setAttribute("endPage", endPage);
		}
		// Truong hop chosse view Fact-Trade
		if (chooseView.equals("viewFactTrade")) {
			List<FactTrade> factTrades = daoFactTradeImpl.getFactTradeByPage(page);
			int endPage = daoFactTradeImpl.getEndPageFactTrade();
			// Truong hop nhap vao button tren man hinh search
			if (buttonAddDelete != null) {
				// truong hop nhap button delete
				if (buttonAddDelete.equals("delete")) {
					// ********Delete False Because "The DELETE statement conflicted with the
					// REFERENCE constraint "Fact_Company"" *******
					daoFactTradeImpl.deleteFactTrade(listNodeChecked);
				}

			}
			request.setAttribute("list", factTrades);
			request.setAttribute("endPage", endPage);
		}

		request.setAttribute("chooseView", chooseView);
		request.setAttribute("page", page);
		request.setAttribute("userName", (String) session.getAttribute("userName"));

		request.getRequestDispatcher("/views/Search.jsp").forward(request, response);
	}

}

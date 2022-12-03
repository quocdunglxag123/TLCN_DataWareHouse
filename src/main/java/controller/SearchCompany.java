package controller;

import java.io.IOException;
import java.util.List;

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
		String page = request.getParameter("page");//trang page hien thi
		String buttonAddDelete = request.getParameter("buttonAddDelete");
		String chooseView = (String) request.getParameter("chooseView");

		
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
		
		if (buttonAddDelete!=null) {
			//Truong hop button add or delete duoc click
			if (session.getAttribute("isReturnSearch").equals("0")) {
				//Truong hop add or delete
				if (buttonAddDelete.equals("add")) {
					//Truong hop button add
					//request.getRequestDispatcher("/views/Edit.jsp").forward(request, response);
					//return;
				}else {
					//Truong hop button Delete
					request.getRequestDispatcher("DeleteRecord").forward(request, response);
					return;
				}
			}else {
				//Set lai gia tri isReturnSearch on session sau khi delete or add return
				session.setAttribute("isReturnSearch", "0");
			}
			
		}

		//Logic Show View
		if (chooseView.equals("viewCompany")) {
			// Truong hop chosse view company
			List<Company> companies = daoCompanyImpl.getCompanyByPage(page);
			int endPage = daoCompanyImpl.getEndPageCompany();			
			request.setAttribute("list", companies);
			request.setAttribute("endPage", endPage);
		}else if (chooseView.equals("viewDateTrade")) {
			// Truong hop chosse view Date Trade
			List<DateTrade> dateTrades = daoDateTradeImpl.getDateTradeByPage(page);
			int endPage = daoDateTradeImpl.getEndPageDateTrade();
			request.setAttribute("list", dateTrades);
			request.setAttribute("endPage", endPage);
		}else if (chooseView.equals("viewFactTrade")) {
			// Truong hop chosse view Fact-Trade
			List<FactTrade> factTrades = daoFactTradeImpl.getFactTradeByPage(page);
			int endPage = daoFactTradeImpl.getEndPageFactTrade();
			request.setAttribute("list", factTrades);
			request.setAttribute("endPage", endPage);
		}

		//Set Value To Search JSP
		request.setAttribute("chooseView", chooseView);
		request.setAttribute("page", page);
		request.setAttribute("userName", (String) session.getAttribute("userName"));

		request.getRequestDispatcher("/views/Search.jsp").forward(request, response);
	}

}

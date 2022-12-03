package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Impl.DaoCompanyImpl;
import dao.Impl.DaoDateTradeImpl;
import dao.Impl.DaoFactTradeImpl;

/**
 * Servlet implementation class View
 */
@WebServlet("/DeleteRecord")
public class DeleteRecord extends HttpServlet {
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
		String listNodeChecked = request.getParameter("listNodeChecked");
		String chooseView = (String) session.getAttribute("chooseView");
		session.setAttribute("returnSearch", "delete");
		// Truong hop chosse view company
		if (chooseView.equals("viewCompany")) {

		}

		// Truong hop chosse view Date Trade
		if (chooseView.equals("viewDateTrade")) {

		}
		// Truong hop chosse view Fact-Trade
		if (chooseView.equals("viewFactTrade")) {
			daoFactTradeImpl.deleteFactTrade(listNodeChecked);

		}
		session.setAttribute("isReturnSearch", "1");//Delete Return to Search
		
		request.getRequestDispatcher("SearchCompany").forward(request, response);
	}

}

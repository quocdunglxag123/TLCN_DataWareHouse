package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Impl.DaoLoginImpl;
import mapping.UserMapping;
import model.User;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {

	private static final long serialVersionUID = 1L;

	DaoLoginImpl daoLogin = new DaoLoginImpl();
	UserMapping userMapping = new UserMapping();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		clearAllSession(session);
		request.getRequestDispatcher("/views/Login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		clearAllSession(session);
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		// Truong hop user duoc input
		if (userId != null && password != null) {
			User user = userMapping.userToModel(userId, password, "");
			User userDB = daoLogin.getUserByUserNamePassword(user);
			// Truong hop user tim thay trong db
			if (userDB.getUserId() != null) {
				session.setAttribute("user", userDB);
				session.setAttribute("userName", userDB.getUserName());
				request.getRequestDispatcher("SearchCompany").forward(request, response);
				return;
			}
		}
		request.setAttribute("errorLogin","Invalid UserName Or Password!");
		request.getRequestDispatcher("/views/Login.jsp").forward(request, response);

	}

	/**
	 * clearAllSession
	 * 
	 * @param HttpSession session
	 */
	public void clearAllSession(HttpSession session) {
		session.setAttribute("page", "0");
		session.setAttribute("user", "");
		session.setAttribute("userName", "");
		session.setAttribute("chooseView", "viewCompany");
		session.setAttribute("isReturnSearch", "0");
		
		session.setAttribute("search", "");
		session.setAttribute("companyNameFactTradeChart", "");
	}
	/**
	 * check Login
	 * 
	 * @param HttpSession session
	 * @return boolean login or not
	 */
	public static boolean checkLogin(HttpSession session) {
		if (session.getAttribute("user") == null || session.getAttribute("user").equals("")) {
			return false;
		}
		return true;
	}

}

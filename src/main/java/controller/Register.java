package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Impl.DaoLoginImpl;
import mapping.UserMapping;
import model.User;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Register")
public class Register extends HttpServlet {

	private static final long serialVersionUID = 1L;
	DaoLoginImpl daoLogin = new DaoLoginImpl();
	UserMapping userMapping = new UserMapping();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/views/Register.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Boolean statusAdd = false;
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		String userName = request.getParameter("userName");

		// Truong hop input user vao
		if (userId != null && password != null && userName != null) {
			User user = userMapping.userToModel(userId, password, userName);
			statusAdd = daoLogin.addUser(user);
		}
		if (statusAdd) {
			// Truong hop add user thanh cong
			request.getRequestDispatcher("/views/Login.jsp").forward(request, response);
		} else {
			// Truong hop add user that bai
			request.getRequestDispatcher("/views/Register.jsp").forward(request, response);

		}

	}

}

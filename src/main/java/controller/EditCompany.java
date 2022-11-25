package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Impl.DaoCompanyImpl;
import model.Company;

/**
 * Servlet implementation class View
 */
@WebServlet("/EditCompany")
public class EditCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DaoCompanyImpl daoCompanyImpl = new DaoCompanyImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Company companyInput = new Company();
		HttpSession session = request.getSession();
		//Truong hop chua login
		if (!Login.checkLogin(session)) {
			request.getRequestDispatcher("Login").forward(request, response);
			return;
		}
		String  chooseView = (String) session.getAttribute("chooseView");
		String buttonEdit = request.getParameter("buttonEdit");
		String companyId= (String) request.getParameter("companyId");
		DaoCompanyImpl daoEditCompany= new DaoCompanyImpl();
		Company company= daoEditCompany.getCompanyById(companyId);
		
		if (buttonEdit !=null) {
			if (chooseView.equals("viewCompany")) {
				companyInput.setSymbol(request.getParameter("companySymbol"));
				companyInput.setName(request.getParameter("companyName"));
				companyInput.setMajor(request.getParameter("companyMajor"));
				companyInput.setPhone(request.getParameter("companyPhone"));
				companyInput.setInfo(request.getParameter("companyInfo"));
				companyInput.setAddress(request.getParameter("companyAddress"));
				System.out.println(companyId);
				if (!companyId.equals("")) {
					companyInput.setId(Integer.parseInt(companyId));
					daoEditCompany.editCompany(companyInput);

				}else {
					daoEditCompany.addCompany(companyInput);
				}
			}else if (chooseView.equals("viewDateTrade")) {
				
			}else if (chooseView.equals("viewDateTrade")) {
				
			}
			request.getRequestDispatcher("SearchCompany").forward(request, response);
			return;
		}
		
 		request.setAttribute("company", company);
		request.getRequestDispatcher("/views/Edit.jsp").forward(request, response);
	}
	
}

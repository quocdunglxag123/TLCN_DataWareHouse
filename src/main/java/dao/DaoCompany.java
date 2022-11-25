package dao;

import java.util.List;

import model.Company;

public interface DaoCompany {
	List<Company> getCompanyByPage(String page);
	int getEndPageCompany();
	void deleteCompany(String ids);
	Company getCompanyById(String id);
	void editCompany(Company company);
	void addCompany(Company company);
}

package dao;

import java.util.List;

import model.Company;

public interface DaoCompany {
	List<Company> getCompanyByPage(String page,String search);
	int getEndPageCompany(String search);
	void deleteCompany(String ids);
	Company getCompanyById(String id);
	void editCompany(Company company);
	void addCompany(Company company);
}

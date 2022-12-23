package dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.DBConnection;
import dao.DaoCompany;
import model.Company;

public class DaoCompanyImpl implements DaoCompany {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	/**
	 * Servlet implementation class View
	 * 
	 * @param page chi so page
	 * @return list thong tin company
	 */
	@Override
	public List<Company> getCompanyByPage(String page,String search) {
		List<Company> list = new ArrayList<>();
		int pageDB = Integer.parseInt(page);
		StringBuilder query = new StringBuilder(
				"select * "
				+ "from Dim_Company "
				+ "where id != 0 and isDelete=0 ");
				
		if (search != "" && search != null) {
			query.append("and symbol like "+"'%"+search+"%'");
		}
		query.append(" ORDER BY id OFFSET ?*10 ROWS FETCH NEXT 10 ROWS ONLY;");
						
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query.toString());
			ps.setInt(1, pageDB);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new Company(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7)));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	/**
	 * get end page company
	 * 
	 * @return endPage chi so end page
	 */
	@Override
	public int getEndPageCompany(String search) {
		int endPage = 0;
		int count = 0;
		StringBuilder query = new StringBuilder("select count(*) from Dim_Company where id != 0 and isDelete=0");
		if (search != "" && search != null) {
			query.append(" and symbol like '%"+ search + "%'");
		}
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query.toString());
			rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
		} catch (Exception e) {
			System.out.println(e);
		}
		if (count % 10 == 0) {
			endPage = (count / 10) - 1;
		} else {
			endPage = (count / 10);
		}
		return endPage;
	}

	/**
	 * Delete company
	 * 
	 * @param list list id company
	 */
	@Override
	public void deleteCompany(String ids) {
		if (ids == "") {
			return;
		}
		String[] s= ids.split(",");
		int[] idArray = new int[s.length];
		for (int i = 0; i < s.length; i++) {
			idArray[i] = Integer.parseInt(s[i]);
		}
		StringBuilder query = new StringBuilder("update Dim_Company set isDelete = 1 where id in (");
		for (int i = 0; i <idArray.length; i++) {
				query.append(",?");
		}
		
		query.append(")");
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query.toString().replaceFirst(",", ""));
			int i=1;
			for (int id : idArray) {
				ps.setInt(i, id);
				i++;
			}
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.print(e);
		}

	}

	/**
	 * get Company By Id
	 * 
	 * @param page chi so page
	 * @return list thong tin company
	 */
	@Override
	public Company getCompanyById(String id) {
		Company company = new Company();
		String query = "select * from Dim_Company where id =?";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				 company = new Company(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return company;
	}
	/**
	 * edit Company By Id
	 * 
	 * @param Company thong tin Company
	 */
	@Override
	public void editCompany(Company company) {
		String query = "update Dim_Company set name = ?,major= ?, phone =?, info =?, address=? where id = ?;";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, company.getName());
			ps.setString(2, company.getMajor());
			ps.setString(3, company.getPhone());
			ps.setString(4, company.getInfo());
			ps.setString(5, company.getAddress());
			ps.setInt(6, company.getId());
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
	}
	/**
	 * add Company 
	 * 
	 * @param Company thong tin Company
	 */
	@Override
	public void addCompany(Company company) {
		String query = "INSERT INTO Dim_Company(symbol,name,major,phone,info,address) VALUES (?,?,?,?,?,?)";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, company.getSymbol());
			ps.setString(2, company.getName());
			ps.setString(3, company.getMajor());
			ps.setString(4, company.getPhone());
			ps.setString(5, company.getInfo());
			ps.setString(6, company.getAddress());
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
	}
}

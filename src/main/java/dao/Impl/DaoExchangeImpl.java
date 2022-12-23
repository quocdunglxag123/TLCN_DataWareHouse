package dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.DBConnection;
import dao.DaoExchange;
import model.Exchange;

public class DaoExchangeImpl implements DaoExchange{
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	/**
	 * Servlet implementation class View
	 * 
	 * @param page chi so page
	 * @return list thong tin Exchange
	 */
	@Override
	public List<Exchange> getExchangeByPage(String page,String search) {
		List<Exchange> list = new ArrayList<>();
		int pageDB = Integer.parseInt(page);
		StringBuilder query = new StringBuilder(
				"select * "
				+ "from Dim_Exchange "
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
				list.add(new Exchange(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	/**
	 * get end page Exchange
	 * 
	 * @return endPage chi so end page
	 */
	@Override
	public int getEndPageExchange(String search) {
		int endPage = 0;
		int count = 0;
		StringBuilder query = new StringBuilder("select count(*) from Dim_Exchange where id != 0 and isDelete=0");
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
	 * Delete Exchange
	 * 
	 * @param list list id Exchange
	 */
	@Override
	public void deleteExchange(String ids) {
		if (ids == "") {
			return;
		}
		String[] s= ids.split(",");
		int[] idArray = new int[s.length];
		for (int i = 0; i < s.length; i++) {
			idArray[i] = Integer.parseInt(s[i]);
		}
		StringBuilder query = new StringBuilder("update Dim_Exchange set isDelete = 1 where id in (");
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
	 * get Exchange By Id
	 * 
	 * @param page chi so page
	 * @return list thong tin Exchange
	 */
	@Override
	public Exchange getExchangeById(String id) {
		Exchange exchange = new Exchange();
		String query = "select * from Dim_Exchange where id =?";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				 exchange = new Exchange(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return exchange;
	}
	/**
	 * edit Exchange By Id
	 * 
	 * @param Exchange thong tin Exchange
	 */
	@Override
	public void editExchange(Exchange exchange) {
		String query = "update Dim_Exchange set name = ?, info =? where id = ?;";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, exchange.getName());
			ps.setString(2, exchange.getInfo());
			ps.setInt(3, exchange.getId());
			
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
	}
	/**
	 * add exchange 
	 * 
	 * @param exchange thong tin exchange
	 */
	@Override
	public void addExchange(Exchange exchange) {
		String query = "INSERT INTO Dim_Exchange(symbol,name,info) VALUES (?,?,?)";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, exchange.getSymbol());
			ps.setString(2, exchange.getName());
			ps.setString(3, exchange.getInfo());

			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
	}
}

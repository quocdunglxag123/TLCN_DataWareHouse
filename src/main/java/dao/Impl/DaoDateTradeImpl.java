package dao.Impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.DBConnection;
import dao.DaoDateTrade;
import model.DateTrade;

public class DaoDateTradeImpl implements DaoDateTrade {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	/**
	 * Servlet implementation class View
	 * 
	 * @param page chi so page
	 * @return list thong tin DateTrade
	 */
	@Override
	public List<DateTrade> getDateTradeByPage(String page) {
		List<DateTrade> list = new ArrayList<>();
		int pageDB = Integer.parseInt(page);
		String query = "select * from Dim_Date where id != 0 ORDER BY id OFFSET ?*10 ROWS FETCH NEXT 10 ROWS ONLY;";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, pageDB);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new DateTrade(rs.getInt(1), rs.getDate(2)));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	/**
	 * get end page DateTrade
	 * 
	 * @return endPage chi so end page
	 */
	@Override
	public int getEndPageDateTrade() {
		int endPage = 0;
		int count = 0;
		String query = "select count(*) from Dim_Date where id != 0";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
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
	 * Delete Date Trade
	 * 
	 * @param list list id DateTrade
	 */
	@Override
	public void deleteDateTrade(String ids) {
		String[] s= ids.split(",");
		int[] idArray = new int[s.length];
		for (int i = 0; i < s.length; i++) {
			idArray[i] = Integer.parseInt(s[i]);
		}
		StringBuilder query = new StringBuilder("Delete from Dim_Date where id in (?");
		if (idArray.length>0) {
			for (int i = 1; i <idArray.length; i++) {
				query.append(",?");
			}
		}
		query.append(")");
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query.toString());
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
	 * get Date Trade By Id
	 * 
	 * @param page chi so page
	 * @return list thong tin DateTrade
	 */
	@Override
	public DateTrade getDateTradeById(String id) {
		DateTrade dateTrade = new DateTrade();
		String query = "select * from Dim_Date where id =?";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				dateTrade = new DateTrade(rs.getInt(1), rs.getDate(2));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return dateTrade;
	}
	/**
	 * edit DateTrade By Id
	 * 
	 * @param Company thong tin DateTrade
	 */
	@Override
	public void editDateTrade(DateTrade dateTrade) {
		String query = "update Dim_Date set datetrade = ? where id = ?;";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setDate(1, (Date) dateTrade.getDateTrade());
			ps.setInt(2, dateTrade.getId());
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
	}
	/**
	 * add Date Trade 
	 * 
	 * @param DateTrade thong tin DateTrade 
	 */
	@Override
	public void addDateTrade(DateTrade dateTrade) {
		String query = "INSERT INTO Dim_Date(dateTrades) VALUES (?)";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setDate(1, (Date) dateTrade.getDateTrade());
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
	}
}

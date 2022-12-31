package dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.DBConnection;
import dao.DaoFactStockOrder;
import dto.FactStockOrderDto;
import model.FactStockOrder;

public class DaoFactStockOrderImpl implements DaoFactStockOrder {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	/**
	 * Servlet implementation class View
	 * 
	 * @param page chi so page
	 * @return list thong tin FactStockOrder
	 */
	@Override
	public List<FactStockOrderDto> getFactStockOrderByPage(String page, String search) {
		List<FactStockOrderDto> list = new ArrayList<>();
		int pageDB = Integer.parseInt(page);
		StringBuilder query = new StringBuilder(
				"select F.id, DD.datetrade, DC.symbol, F.price_close, F.total_volume_auction, F.total_price_auction\r\n"
						+ "			, F.best_buy_price, F.best_buy_volume, F.best_sell_price, F.best_sell_volume, F.total_order_buy, F.total_order_sell,\r\n"
						+ "			 F.total_order_buy_minus_sell, F.total_volume_buy,F.total_volume_sell,F.total_volume_buy_minus_sell\r\n"
						+ "			from Fact_StockOrder as F, Dim_Company as DC, Dim_Date as DD \r\n"
						+ "		where F.id_company = DC.id and F.id_date=DD.id and F.isDelete=0");

		if (search != "" && search != null) {
			query.append("and  DC.symbol like " + "'%" + search + "%'");
		}

		query.append(" ORDER BY F.id OFFSET ?*10 ROWS FETCH NEXT 10 ROWS ONLY;");
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query.toString());
			ps.setInt(1, pageDB);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new FactStockOrderDto(rs.getInt(1), rs.getDate(2), rs.getString(3), rs.getBigDecimal(4),
						rs.getBigDecimal(5), rs.getBigDecimal(6), rs.getBigDecimal(7), rs.getBigDecimal(8),
						rs.getBigDecimal(9), rs.getBigDecimal(10), rs.getBigDecimal(11), rs.getBigDecimal(12),
						rs.getBigDecimal(13), rs.getBigDecimal(14), rs.getBigDecimal(15), rs.getBigDecimal(16)));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	/**
	 * Get element Fact to Chart
	 * 
	 * @return list thong tin fact Chart
	 */
	@Override
	public List<String> getFactStockOrderToChart(String search) {

		List<String> listElementFactChart = new ArrayList<>();
		StringBuilder companyNameChart = new StringBuilder();
		StringBuilder totalOrderBuyChart = new StringBuilder();
		StringBuilder totalOrderSellChart = new StringBuilder();
		StringBuilder totalVolumeBuyChart = new StringBuilder();
		StringBuilder totalVolumeSellChart = new StringBuilder();
		StringBuilder query = new StringBuilder("select company, total_order_buy, total_order_sell, total_volume_buy, total_volume_sell \r\n"
				+ "from Fact_StockOrder_Chart where datetrade = '2022-12-29' ");

		if (search != "" && search != null) {
			query.append("and  company like " + "'%" + search + "%'");
		}

		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query.toString());
			rs = ps.executeQuery();
			while (rs.next()) {
				companyNameChart.append("," + rs.getString(1));
				totalOrderBuyChart.append("," + Float.toString(rs.getFloat(2)));
				totalOrderSellChart.append("," + Float.toString(rs.getFloat(3)));
				totalVolumeBuyChart.append("," + Float.toString(rs.getFloat(4)));
				totalVolumeSellChart.append("," + Float.toString(rs.getFloat(5)));
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		listElementFactChart.add(companyNameChart.toString().replaceFirst(",", ""));
		listElementFactChart.add(totalOrderBuyChart.toString().replaceFirst(",", ""));
		listElementFactChart.add(totalOrderSellChart.toString().replaceFirst(",", ""));
		listElementFactChart.add(totalVolumeBuyChart.toString().replaceFirst(",", ""));
		listElementFactChart.add(totalVolumeSellChart.toString().replaceFirst(",", ""));

		return listElementFactChart;
	}

	/**
	 * get end page FactStockOrder
	 * 
	 * @return endPage chi so end page
	 */
	@Override
	public int getEndPageFactStockOrder(String search) {
		int endPage = 0;
		int count = 0;
		StringBuilder query = new StringBuilder(
				"select count(*)" + "from Fact_StockOrder as F, Dim_Company as DC, Dim_Date as DD \r\n"
						+ "where F.id_company = DC.id and F.id_date=DD.id and F.isDelete=0");

		if (search != "" && search != null) {
			query.append("and  DC.symbol like " + "'%" + search + "%'");
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
	 * Delete FactStockOrder
	 * 
	 * @param list list id FactStockOrder
	 */
	@Override
	public void deleteFactStockOrder(String ids) {
		if (ids == "") {
			return;
		}
		String[] s = ids.split(",");
		int[] idArray = new int[s.length];

		for (int i = 0; i < s.length; i++) {
			idArray[i] = Integer.parseInt(s[i]);
		}
		StringBuilder query = new StringBuilder("update Fact_StockOrder set isDelete = 1 where id in (");
		for (int i = 0; i < idArray.length; i++) {
			query.append(",?");
		}

		query.append(")");
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query.toString().replaceFirst(",", ""));
			int i = 1;
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
	 * get FactStockOrder By Id
	 * 
	 * @param page chi so page
	 * @return list thong tin FactStockOrder
	 */
	@Override
	public FactStockOrder getFactStockOrderById(String id) {
		FactStockOrder FactStockOrder = new FactStockOrder();
		String query = "select * from Fact_StockOrder where id =?";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				FactStockOrder = new FactStockOrder(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getBigDecimal(4),
						rs.getBigDecimal(5), rs.getBigDecimal(6), rs.getBigDecimal(7), rs.getBigDecimal(8),
						rs.getBigDecimal(9), rs.getBigDecimal(10), rs.getBigDecimal(11), rs.getBigDecimal(12),
						rs.getBigDecimal(13), rs.getBigDecimal(14), rs.getBigDecimal(15), rs.getBigDecimal(16));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return FactStockOrder;
	}

	/**
	 * edit FactStockOrder By Id
	 * 
	 * @param FactStockOrder thong tin FactStockOrder
	 */
	@Override
	public void editFactStockOrder(FactStockOrder factStockOrder) {
		String query = "update Fact_StockOrder "
				+ "set id_date = ?,id_company= ?, price_close =?, total_volume_auction =?,total_price_auction =?, best_buy_price=?, best_buy_volume=?, "
				+ "best_sell_price=?, best_sell_volume=?, total_order_buy=?, total_order_sell=?, total_order_buy_minus_sell=?, total_volume_buy=?,"
				+ " total_volume_sell=?, total_volume_buy_minus_sell=?" + " where id = ?;";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, factStockOrder.getId_date());
			ps.setInt(2, factStockOrder.getId_company());
			ps.setBigDecimal(3, factStockOrder.getPrice_close());
			ps.setBigDecimal(4, factStockOrder.getTotal_volume_auction());
			ps.setBigDecimal(5, factStockOrder.getTotal_price_auction());
			ps.setBigDecimal(6, factStockOrder.getBest_buy_price());
			ps.setBigDecimal(7, factStockOrder.getBest_buy_volume());
			ps.setBigDecimal(8, factStockOrder.getBest_sell_price());
			ps.setBigDecimal(9, factStockOrder.getBest_sell_volume());
			ps.setBigDecimal(10, factStockOrder.getTotal_order_buy());
			ps.setBigDecimal(11, factStockOrder.getTotal_order_sell());
			ps.setBigDecimal(12, factStockOrder.getTotal_order_buy_minus_sell());
			ps.setBigDecimal(13, factStockOrder.getTotal_volume_buy());
			ps.setBigDecimal(14, factStockOrder.getTotal_volume_sell());
			ps.setBigDecimal(15, factStockOrder.getTotal_volume_buy_minus_sell());
			ps.setInt(16, factStockOrder.getId());
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/**
	 * add FactStockOrder
	 * 
	 * @param FactStockOrder thong tin FactStockOrder
	 */
	@Override
	public void addFactStockOrder(FactStockOrder factStockOrder) {
		boolean flagCheckIdDimCompanyDelete = checkIdDimCompanyDelete(factStockOrder);
		boolean flagCheckIdDimDateDelete = checkIdDimDateDelete(factStockOrder);
		if (flagCheckIdDimCompanyDelete || flagCheckIdDimDateDelete) {
			return;
		}
		String query = "INSERT  INTO  Fact_StockOrder "
				+ "(id_date,id_company ,price_close,total_volume_auction ,total_price_auction ,best_buy_price ,"
				+ "best_buy_volume,best_sell_price,best_sell_volume,total_order_buy,total_order_sell,total_order_buy_minus_sell,"
				+ "total_volume_buy,total_volume_sell,total_volume_buy_minus_sell ) "
				+ "values(?,?, ?,?,?,?,? ,? ,? ,?, ?,?,?,?,?);";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, factStockOrder.getId_date());
			ps.setInt(2, factStockOrder.getId_company());
			ps.setBigDecimal(3, factStockOrder.getPrice_close());
			ps.setBigDecimal(4, factStockOrder.getTotal_volume_auction());
			ps.setBigDecimal(5, factStockOrder.getTotal_price_auction());
			ps.setBigDecimal(6, factStockOrder.getBest_buy_price());
			ps.setBigDecimal(7, factStockOrder.getBest_buy_volume());
			ps.setBigDecimal(8, factStockOrder.getBest_sell_price());
			ps.setBigDecimal(9, factStockOrder.getBest_sell_volume());
			ps.setBigDecimal(10, factStockOrder.getTotal_order_buy());
			ps.setBigDecimal(11, factStockOrder.getTotal_order_sell());
			ps.setBigDecimal(12, factStockOrder.getTotal_order_buy_minus_sell());
			ps.setBigDecimal(13, factStockOrder.getTotal_volume_buy());
			ps.setBigDecimal(14, factStockOrder.getTotal_volume_sell());
			ps.setBigDecimal(15, factStockOrder.getTotal_volume_buy_minus_sell());
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	/**
	 * check Id Dim Company is Delete before insert or edit
	 * 
	 * @param FactStockOrder thong tin FactStockOrder
	 * 
	 * @return boolean thong tin true(is delete)/ flase(not delete)
	 */
	private boolean checkIdDimCompanyDelete(FactStockOrder factStockOrder) {
		String query = "select * from Dim_Company where id =? and isDelete= 0";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, factStockOrder.getId_company());
			rs = ps.executeQuery();
			if (rs.next()) {
				return false;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return true;
	}

	/**
	 * check Id Dim Date is Delete before insert or edit
	 * 
	 * @param FactStockOrder thong tin FactStockOrder
	 * 
	 * @return boolean thong tin true(is delete)/ false(not delete)
	 */
	private boolean checkIdDimDateDelete(FactStockOrder factStockOrder) {
		String query = "select * from Dim_Date where id =? and isDelete= 0";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, factStockOrder.getId_date());
			rs = ps.executeQuery();
			if (rs.next()) {
				return false;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return true;
	}

}

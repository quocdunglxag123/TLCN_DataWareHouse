package dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.DBConnection;
import dao.DaoFactTrade;
import dto.FactTradeDto;
import model.FactTrade;

public class DaoFactTradeImpl implements DaoFactTrade {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	/**
	 * Servlet implementation class View
	 * 
	 * @param page chi so page
	 * @return list thong tin FactTrade
	 */
	@Override
	public List<FactTradeDto> getFactTradeByPage(String page,String search) {
		List<FactTradeDto> list = new ArrayList<>();
		int pageDB = Integer.parseInt(page);
		StringBuilder query =new StringBuilder( "select F.id,DD.datetrade, DC.symbol, F.price_reference, F.price_open, F.price_close\r\n"
				+ ", F.price_ceiling, F.price_floor, F.mean, F.volatility, F.volatility_percent, F.total_volume,\r\n"
				+ " F.total_price, F.total_marketcapitalization\r\n"
				+ "from Fact_Trade as F, Dim_Company as DC, Dim_Date as DD "
				+ "where F.id_company = DC.id and F.id_date=DD.id and F.isDelete=0 ");
				
				if (search != "" && search != null) {
					query.append("and  DC.symbol like "+"'%"+search+"%'");
				}	
				
				query.append(" ORDER BY F.id OFFSET ?*10 ROWS FETCH NEXT 10 ROWS ONLY;");
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query.toString());
			ps.setInt(1, pageDB);
			rs = ps.executeQuery();
			while (rs.next()) {
				list.add(new FactTradeDto(rs.getInt(1), rs.getDate(2), rs.getString(3), rs.getBigDecimal(4),
						rs.getBigDecimal(5), rs.getBigDecimal(6), rs.getBigDecimal(7), rs.getBigDecimal(8),
						rs.getBigDecimal(9), rs.getBigDecimal(10), rs.getBigDecimal(11), rs.getBigDecimal(12),
						rs.getBigDecimal(13), rs.getBigDecimal(14)));
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
	public List<String> getFactTradeToChart(String search) {
		List<String> listElementFactChart = new ArrayList<>();
		StringBuilder companyNameChart = new StringBuilder();
		StringBuilder totalVolumeChart = new StringBuilder();
		StringBuilder totalPriceChart = new StringBuilder();
		StringBuilder totalMarketCapitalizationChart = new StringBuilder();
		
		
		StringBuilder query =new StringBuilder( "select company, total_volume, total_price,total_marketcapitalization  "
				+ "from Fact_Trade_Chart where datetrade = '2022-12-29' \r\n");
				
				if (search != "" && search != null) {
					query.append("and company like "+"'%"+search+"%'");
				}		
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query.toString());
			rs = ps.executeQuery();
			while (rs.next()) {
				companyNameChart.append(","+rs.getString(1));
				totalVolumeChart.append(","+Integer.toString(rs.getInt(2)));
				totalPriceChart.append(","+Integer.toString(rs.getInt(3)));
				totalMarketCapitalizationChart.append(","+Integer.toString(rs.getInt(4)));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		listElementFactChart.add(companyNameChart.toString().replaceFirst(",", ""));
		listElementFactChart.add(totalVolumeChart.toString().replaceFirst(",", ""));
		listElementFactChart.add(totalPriceChart.toString().replaceFirst(",", ""));
		listElementFactChart.add(totalMarketCapitalizationChart.toString().replaceFirst(",", ""));
		return listElementFactChart;
	}

	
	/**
	 * get end page FactTrade
	 * 
	 * @return endPage chi so end page
	 */
	@Override
	public int getEndPageFactTrade(String search) {
		int endPage = 0;
		int count = 0;
		StringBuilder query =new StringBuilder( "select count(*)"
				+ "from Fact_Trade as F, Dim_Company as DC, Dim_Date as DD "
				+ "where F.id_company = DC.id and F.id_date=DD.id and F.isDelete=0 ");
				
				if (search != "" && search != null) {
					query.append("and  DC.symbol like "+"'%"+search+"%'");
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
	 * Delete FactTrade
	 * 
	 * @param list list id FactTrade
	 */
	@Override
	public void deleteFactTrade(String ids) {
		if (ids == "") {
			return;
		}
		String[] s = ids.split(",");
		int[] idArray = new int[s.length];
		
		for (int i = 0; i < s.length; i++) {
			idArray[i] = Integer.parseInt(s[i]);
		}
		StringBuilder query = new StringBuilder("update Fact_Trade set isDelete = 1 where id in (");
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
	 * get FactTrade By Id
	 * 
	 * @param page chi so page
	 * @return list thong tin FactTrade
	 */
	@Override
	public FactTrade getFactTradeById(String id) {
		FactTrade FactTrade = new FactTrade();
		String query = "select * from Fact_Trade where id =?";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				FactTrade = new FactTrade(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getBigDecimal(4),
						rs.getBigDecimal(5), rs.getBigDecimal(6), rs.getBigDecimal(7), rs.getBigDecimal(8),
						rs.getBigDecimal(9), rs.getBigDecimal(10), rs.getBigDecimal(11), rs.getBigDecimal(12),
						rs.getBigDecimal(13), rs.getBigDecimal(14));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return FactTrade;
	}
	/**
	 * edit FactTrade By Id
	 * 
	 * @param FactTrade thong tin FactTrade
	 */
	@Override
	public void editFactTrade(FactTrade factTrade) {
		String query = "update Fact_Trade "
				+ "set id_date = ?,id_company= ?, price_reference =?, price_open =?,price_close =?, price_ceiling=?, price_floor=?, "
				+ "mean=?, volatility=?, volatility_percent=?, total_volume=?, total_price=?, total_marketcapitalization=? "
				+ "where id = ?;";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, factTrade.getId_date());
			ps.setInt(2, factTrade.getId_company());
			ps.setBigDecimal(3, factTrade.getPrice_reference());
			ps.setBigDecimal(4, factTrade.getPrice_open());
			ps.setBigDecimal(5, factTrade.getPrice_close());
			ps.setBigDecimal(6, factTrade.getPrice_ceiling());
			ps.setBigDecimal(7, factTrade.getPrice_floor());
			ps.setBigDecimal(8, factTrade.getMean());
			ps.setBigDecimal(9, factTrade.getVolatility());
			ps.setBigDecimal(10, factTrade.getVolatility_percent());
			ps.setBigDecimal(11, factTrade.getTotal_volume());
			ps.setBigDecimal(12, factTrade.getTotal_price());
			ps.setBigDecimal(13, factTrade.getTotal_marketcapitalization());
			ps.setInt(14, factTrade.getId());
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
	}
	/**
	 * add FactTrade
	 * 
	 * @param FactTrade thong tin FactTrade
	 */
	@Override
	public void addFactTrade(FactTrade factTrade) {
		boolean flagCheckIdDimCompanyDelete = checkIdDimCompanyDelete(factTrade);
		boolean flagCheckIdDimDateDelete = checkIdDimDateDelete(factTrade);
		if (flagCheckIdDimCompanyDelete || flagCheckIdDimDateDelete) {
			return;
		}
		String query = "INSERT  INTO  Fact_Trade "
				+ "(id_date,id_company ,price_reference,price_open ,price_close ,price_ceiling ,"
				+ "price_floor,mean,volatility,volatility_percent,total_volume,total_price,total_marketcapitalization ) "
				+ "values(?,?, ?,?,?,?,? ,? ,? ,?, ?,?,?);";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, factTrade.getId_date());
			ps.setInt(2, factTrade.getId_company());
			ps.setBigDecimal(3, factTrade.getPrice_reference());
			ps.setBigDecimal(4, factTrade.getPrice_open());
			ps.setBigDecimal(5, factTrade.getPrice_close());
			ps.setBigDecimal(6, factTrade.getPrice_ceiling());
			ps.setBigDecimal(7, factTrade.getPrice_floor());
			ps.setBigDecimal(8, factTrade.getMean());
			ps.setBigDecimal(9, factTrade.getVolatility());
			ps.setBigDecimal(10, factTrade.getVolatility_percent());
			ps.setBigDecimal(11, factTrade.getTotal_volume());
			ps.setBigDecimal(12, factTrade.getTotal_price());
			ps.setBigDecimal(13, factTrade.getTotal_marketcapitalization());
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
	}
	/**
	 * check Id  Dim Company is Delete before insert or edit
	 * 
	 * @param FactTrade thong tin FactTrade
	 * 
	 * @return boolean thong tin true(is delete)/ flase(not delete)
	 */
	private boolean  checkIdDimCompanyDelete(FactTrade factTrade){
		String query = "select * from Dim_Company where id =? and isDelete= 0";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, factTrade.getId_company());
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
	 * @param FactTrade thong tin FactTrade
	 * 
	 * @return boolean thong tin true(is delete)/ false(not delete)
	 */
	private boolean  checkIdDimDateDelete(FactTrade factTrade){
		String query = "select * from Dim_Date where id =? and isDelete= 0";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, factTrade.getId_date());
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

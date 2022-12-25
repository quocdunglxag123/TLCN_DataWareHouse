package dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.DBConnection;
import dao.DaoBusinessResult;
import dto.FactBusinessResultDto;
import model.FactBusinessResult;

public class DaoFactBusinessResultImpl implements DaoBusinessResult {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	/**
	 * Servlet implementation class View
	 * 
	 * @param page chi so page
	 * @return list thong tin FactBusinessResult
	 */
	@Override
	public List<FactBusinessResultDto> getFactBusinessResultByPage(String page,String search) {
		List<FactBusinessResultDto> list = new ArrayList<>();
		int pageDB = Integer.parseInt(page);
		StringBuilder query =new StringBuilder( "select F.id,DD.datetrade, DC.symbol, DE.symbol, F.status, F.profit\r\n"
				+ ", F.previous_period, F.same_period, F.profit_cummulative, F.eps_profit, F.eps_cummulative, F.price_earning_ratio\r\n"
				+ "from Fact_BusinessResult as F, Dim_Company as DC, Dim_Date as DD, Dim_Exchange as DE\r\n"
				+ "where F.id_company = DC.id and F.id_date=DD.id and F.id_exchange=DE.id and F.isDelete=0 ");
				
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
				list.add(new FactBusinessResultDto(rs.getInt(1), rs.getDate(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getFloat(6), rs.getFloat(7), rs.getFloat(8),
						rs.getFloat(9), rs.getFloat(10), rs.getFloat(11), rs.getFloat(12)));
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
	public List<String> getFactBusinessResultToChart() {
		/*
		 * List<String> listElementFactChart = new ArrayList<>(); StringBuilder
		 * companyNameChart = new StringBuilder(); StringBuilder totalVolumeChart = new
		 * StringBuilder(); StringBuilder totalPriceChart = new StringBuilder();
		 * StringBuilder totalMarketCapitalizationChart = new StringBuilder();
		 * 
		 * String query =
		 * "select name, total_volume, total_price, total_marketcapitalization " +
		 * "from Fact_Trade join Dim_Company on Fact_Trade.id_company = Dim_Company.id where Fact_Trade.isDelete=0 "
		 * ; try { conn = DBConnection.getConnection(); ps =
		 * conn.prepareStatement(query); rs = ps.executeQuery(); while (rs.next()) {
		 * companyNameChart.append(","+rs.getString(1));
		 * totalVolumeChart.append(","+Integer.toString(rs.getInt(2)));
		 * totalPriceChart.append(","+Integer.toString(rs.getInt(3)));
		 * totalMarketCapitalizationChart.append(","+Integer.toString(rs.getInt(4))); }
		 * } catch (Exception e) { System.out.println(e); }
		 * listElementFactChart.add(companyNameChart.toString().replaceFirst(",", ""));
		 * listElementFactChart.add(totalVolumeChart.toString().replaceFirst(",", ""));
		 * listElementFactChart.add(totalPriceChart.toString().replaceFirst(",", ""));
		 * listElementFactChart.add(totalMarketCapitalizationChart.toString().
		 * replaceFirst(",", "")); return listElementFactChart;
		 */
		return null ;
	}

	
	/**
	 * get end page Fact BusinessResult
	 * 
	 * @return endPage chi so end page
	 */
	@Override
	public int getEndPageFactBusinessResult(String search) {
		int endPage = 0;
		int count = 0;
		StringBuilder query =new StringBuilder( " select count(*) "
				+ "from Fact_BusinessResult as F, Dim_Company as DC, Dim_Date as DD, Dim_Exchange as DE\r\n"
				+ "where F.id_company = DC.id and F.id_date=DD.id and F.id_exchange=DE.id and F.isDelete=0 ");
				
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
	 * Delete FactBusinessResult
	 * 
	 * @param list list id FactBusinessResult
	 */
	@Override
	public void deleteFactBusinessResult(String ids) {
		if (ids == "") {
			return;
		}
		String[] s = ids.split(",");
		int[] idArray = new int[s.length];
		
		for (int i = 0; i < s.length; i++) {
			idArray[i] = Integer.parseInt(s[i]);
		}
		StringBuilder query = new StringBuilder("update Fact_BusinessResult set isDelete = 1 where id in (");
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
	 * get FactBusinessResult By Id
	 * 
	 * @param page chi so page
	 * @return list thong tin FactBusinessResult
	 */
	@Override
	public FactBusinessResult getFactBusinessResultById(String id) {
		FactBusinessResult factBusinessResult = new FactBusinessResult();
		String query = "select * from Fact_BusinessResult where id =?";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				factBusinessResult = new FactBusinessResult(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4),
						rs.getString(5), rs.getFloat(6), rs.getFloat(7), rs.getFloat(8),
						rs.getFloat(9), rs.getFloat(10), rs.getFloat(11), rs.getFloat(12));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return factBusinessResult;
	}
	/**
	 * edit FactBusinessResult By Id
	 * 
	 * @param FactBusinessResult thong tin FactBusinessResult
	 */
	@Override
	public void editFactBusinessResult(FactBusinessResult factBusinessResult) {
		String query = "update Fact_BusinessResult "
				+ "set id_date = ?,id_company= ?, id_exchange =?, "
				+ 	  "status =?,profit =?, previous_period=?, same_period=?, "
				+ 	  "profit_cummulative=?, eps_profit=?, eps_cummulative=?, "
				+ 	  "price_earning_ratio=?"
				+ "where id = ?;";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, factBusinessResult.getId_date());
			ps.setInt(2, factBusinessResult.getId_company());
			ps.setInt(3, factBusinessResult.getId_exchange());
			ps.setString(4, factBusinessResult.getStatus());
			ps.setFloat(5, factBusinessResult.getProfit());
			ps.setFloat(6, factBusinessResult.getPrevious_period());
			ps.setFloat(7, factBusinessResult.getSame_period());
			ps.setFloat(8, factBusinessResult.getProfit_cummulative());
			ps.setFloat(9, factBusinessResult.getEps_profit());
			ps.setFloat(10, factBusinessResult.getEps_cummulative());
			ps.setFloat(11, factBusinessResult.getPrice_earning_ratio());
			ps.setInt(12, factBusinessResult.getId());
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
	}
	/**
	 * add FactBusinessResult
	 * 
	 * @param FactBusinessResult thong tin FactBusinessResult
	 */
	@Override
	public void addFactBusinessResult(FactBusinessResult factBusinessResult) {
		boolean flagCheckIdDimCompanyDelete = checkIdDimCompanyDelete(factBusinessResult);
		boolean flagCheckIdDimDateDelete = checkIdDimDateDelete(factBusinessResult);
		boolean flagCheckIdDimExchangeDelete = checkIdDimExchangeDelete(factBusinessResult);
		if (flagCheckIdDimCompanyDelete || flagCheckIdDimDateDelete|| flagCheckIdDimExchangeDelete) {
			return;
		}
		String query = "INSERT  INTO  Fact_BusinessResult "
				+ "(id_date,id_company ,id_exchange ,"
				+ "status,profit ,previous_period ,same_period ,"
				+ "profit_cummulative,eps_profit,eps_cummulative,price_earning_ratio ) "
				+ "values(?,?,?,?,?,?,? ,? ,? ,?, ?);";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, factBusinessResult.getId_date());
			ps.setInt(2, factBusinessResult.getId_company());
			ps.setInt(3, factBusinessResult.getId_exchange());
			ps.setString(4, factBusinessResult.getStatus());
			ps.setFloat(5, factBusinessResult.getProfit());
			ps.setFloat(6, factBusinessResult.getPrevious_period());
			ps.setFloat(7, factBusinessResult.getSame_period());
			ps.setFloat(8, factBusinessResult.getProfit_cummulative());
			ps.setFloat(9, factBusinessResult.getEps_profit());
			ps.setFloat(10, factBusinessResult.getEps_cummulative());
			ps.setFloat(11, factBusinessResult.getPrice_earning_ratio());
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
	}
	/**
	 * check Id  Dim Company is Delete before insert or edit
	 * 
	 * @param FactBusinessResult thong tin FactBusinessResult
	 * 
	 * @return boolean thong tin true(is delete)/ flase(not delete)
	 */
	private boolean  checkIdDimCompanyDelete(FactBusinessResult factBusinessResult){
		String query = "select * from Dim_Company where id =? and isDelete= 0";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, factBusinessResult.getId_company());
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
	 * @param FactBusinessResult thong tin FactBusinessResult
	 * 
	 * @return boolean thong tin true(is delete)/ false(not delete)
	 */
	private boolean  checkIdDimDateDelete(FactBusinessResult factBusinessResult){
		String query = "select * from Dim_Date where id =? and isDelete= 0";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, factBusinessResult.getId_date());
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
	 * check Id Dim Exchange is Delete before insert or edit
	 * 
	 * @param FactBusinessResult thong tin FactBusinessResult
	 * 
	 * @return boolean thong tin true(is delete)/ false(not delete)
	 */
	private boolean  checkIdDimExchangeDelete(FactBusinessResult factBusinessResult){
		String query = "select * from Dim_Exchange where id =? and isDelete= 0";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, factBusinessResult.getId_exchange());
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

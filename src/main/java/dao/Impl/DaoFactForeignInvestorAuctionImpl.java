package dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.DBConnection;
import dao.DaoFactForeignInvestorAuction;
import dto.FactForeignInvestorAuctionDto;
import model.FactForeignInvestorAuction;

public class DaoFactForeignInvestorAuctionImpl implements DaoFactForeignInvestorAuction {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	/**
	 * Servlet implementation class View
	 * 
	 * @param page chi so page
	 * @return list thong tin FactForeignInvestorAuction
	 */
	@Override
	public List<FactForeignInvestorAuctionDto> getFactForeignInvestorAuctionByPage(String page,String search) {
		List<FactForeignInvestorAuctionDto> list = new ArrayList<>();
		int pageDB = Integer.parseInt(page);
		StringBuilder query =new StringBuilder( "select F.id, DD.datetrade, DC.symbol, F.room, F.percent_owned, F.room_available\r\n"
				+ "	, F.percent_room_available, F.buy_volume_auction, F.percent_buy_volume_auction_market,\r\n"
				+ "	F.sell_volume_auction, F.percent_sell_volume_auction_market, F.buy_price_auction,\r\n"
				+ "	F.percent_buy_price_auction_market, F.sell_price_auction,F.percent_sell_price_auction_market,F.difference_volume,F.difference_price\r\n"
				+ "	from Fact_ForeignInvestorAuction as F, Dim_Company as DC, Dim_Date as DD \r\n"
				+ "	where F.id_company = DC.id and F.id_date=DD.id and F.isDelete=0");
				
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
				list.add(new FactForeignInvestorAuctionDto(rs.getInt(1), rs.getDate(2), rs.getString(3), rs.getBigDecimal(4),
						rs.getBigDecimal(5), rs.getBigDecimal(6), rs.getBigDecimal(7), rs.getBigDecimal(8),
						rs.getBigDecimal(9), rs.getBigDecimal(10), rs.getBigDecimal(11), rs.getBigDecimal(12),
						rs.getBigDecimal(13), rs.getBigDecimal(14),rs.getBigDecimal(15),rs.getBigDecimal(16),rs.getBigDecimal(17)));
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
	public List<String> getFactForeignInvestorAuctionToChart() {
		return null;
		/*
		 * List<String> listElementFactChart = new ArrayList<>(); StringBuilder
		 * companyNameChart = new StringBuilder(); StringBuilder totalVolumeChart = new
		 * StringBuilder(); StringBuilder totalPriceChart = new StringBuilder();
		 * StringBuilder totalMarketCapitalizationChart = new StringBuilder();
		 * 
		 * String query =
		 * "select name, total_volume, total_price, total_marketcapitalization " +
		 * "from Fact_ForeignInvestorAuction join Dim_Company on Fact_ForeignInvestorAuction.id_company = Dim_Company.id where Fact_ForeignInvestorAuction.isDelete=0 "
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
		
	}

	
	/**
	 * get end page FactForeignInvestorAuction
	 * 
	 * @return endPage chi so end page
	 */
	@Override
	public int getEndPageFactForeignInvestorAuction(String search) {
		int endPage = 0;
		int count = 0;
		StringBuilder query =new StringBuilder( "select count(*)"
				+ "from Fact_ForeignInvestorAuction as F, Dim_Company as DC, Dim_Date as DD \r\n"
				+ "where F.id_company = DC.id and F.id_date=DD.id and F.isDelete=0");
				
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
	 * Delete FactForeignInvestorAuction
	 * 
	 * @param list list id FactForeignInvestorAuction
	 */
	@Override
	public void deleteFactForeignInvestorAuction(String ids) {
		if (ids == "") {
			return;
		}
		String[] s = ids.split(",");
		int[] idArray = new int[s.length];
		
		for (int i = 0; i < s.length; i++) {
			idArray[i] = Integer.parseInt(s[i]);
		}
		StringBuilder query = new StringBuilder("update Fact_ForeignInvestorAuction set isDelete = 1 where id in (");
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
	 * get FactForeignInvestorAuction By Id
	 * 
	 * @param page chi so page
	 * @return list thong tin FactForeignInvestorAuction
	 */
	@Override
	public FactForeignInvestorAuction getFactForeignInvestorAuctionById(String id) {
		FactForeignInvestorAuction FactForeignInvestorAuction = new FactForeignInvestorAuction();
		String query = "select * from Fact_ForeignInvestorAuction where id =?";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				FactForeignInvestorAuction = new FactForeignInvestorAuction(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getBigDecimal(4),
						rs.getBigDecimal(5), rs.getBigDecimal(6), rs.getBigDecimal(7), rs.getBigDecimal(8),
						rs.getBigDecimal(9), rs.getBigDecimal(10), rs.getBigDecimal(11), rs.getBigDecimal(12),
						rs.getBigDecimal(13), rs.getBigDecimal(14),rs.getBigDecimal(15),rs.getBigDecimal(16),rs.getBigDecimal(17));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return FactForeignInvestorAuction;
	}
	/**
	 * edit FactForeignInvestorAuction By Id
	 * 
	 * @param FactForeignInvestorAuction thong tin FactForeignInvestorAuction
	 */
	@Override
	public void editFactForeignInvestorAuction(FactForeignInvestorAuction factForeignInvestorAuction) {
		String query = "update Fact_ForeignInvestorAuction "
				+ "set id_date = ?,id_company= ?, room =?, percent_owned =?,room_available =?, percent_room_available=?, buy_volume_auction=?, "
				+ "percent_buy_volume_auction_market=?, sell_volume_auction=?, percent_sell_volume_auction_market=?, buy_price_auction=?, "
				+ "percent_buy_price_auction_market=?, sell_price_auction=?,"
				+ " percent_sell_price_auction_market=?, difference_volume=?, difference_price=?"
				+ "where id = ?;";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, factForeignInvestorAuction.getId_date());
			ps.setInt(2, factForeignInvestorAuction.getId_company());
			ps.setBigDecimal(3, factForeignInvestorAuction.getRoom());
			ps.setBigDecimal(4, factForeignInvestorAuction.getPercent_owned());
			ps.setBigDecimal(5, factForeignInvestorAuction.getRoom_available());
			ps.setBigDecimal(6, factForeignInvestorAuction.getPercent_room_available());
			ps.setBigDecimal(7, factForeignInvestorAuction.getBuy_volume_auction());
			ps.setBigDecimal(8, factForeignInvestorAuction.getPercent_buy_volume_auction_market());
			ps.setBigDecimal(9, factForeignInvestorAuction.getSell_volume_auction());
			ps.setBigDecimal(10, factForeignInvestorAuction.getPercent_sell_volume_auction_market());
			ps.setBigDecimal(11, factForeignInvestorAuction.getBuy_price_auction());
			ps.setBigDecimal(12, factForeignInvestorAuction.getPercent_buy_price_auction_market());
			ps.setBigDecimal(13, factForeignInvestorAuction.getSell_price_auction());
			ps.setBigDecimal(14, factForeignInvestorAuction.getPercent_sell_price_auction_market());
			ps.setBigDecimal(15, factForeignInvestorAuction.getDifference_volume());
			ps.setBigDecimal(16, factForeignInvestorAuction.getDifference_price());
			ps.setInt(17, factForeignInvestorAuction.getId());
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
	}
	/**
	 * add FactForeignInvestorAuction
	 * 
	 * @param FactForeignInvestorAuction thong tin FactForeignInvestorAuction
	 */
	@Override
	public void addFactForeignInvestorAuction(FactForeignInvestorAuction factForeignInvestorAuction) {
		boolean flagCheckIdDimCompanyDelete = checkIdDimCompanyDelete(factForeignInvestorAuction);
		boolean flagCheckIdDimDateDelete = checkIdDimDateDelete(factForeignInvestorAuction);
		if (flagCheckIdDimCompanyDelete || flagCheckIdDimDateDelete) {
			return;
		}
		String query = "INSERT  INTO  Fact_ForeignInvestorAuction "
				+ "(id_date,id_company ,room,percent_owned ,room_available ,percent_room_available ,"
				+ "buy_volume_auction,percent_buy_volume_auction_market,sell_volume_auction,percent_sell_volume_auction_market,"
				+ "buy_price_auction,percent_buy_price_auction_market,"
				+ "sell_price_auction,percent_sell_price_auction_market,difference_volume,difference_price ) "
				+ "values(?,?, ?,?,?,?,? ,? ,? ,?, ?,?,?,?,?,?);";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, factForeignInvestorAuction.getId_date());
			ps.setInt(2, factForeignInvestorAuction.getId_company());
			ps.setBigDecimal(3, factForeignInvestorAuction.getRoom());
			ps.setBigDecimal(4, factForeignInvestorAuction.getPercent_owned());
			ps.setBigDecimal(5, factForeignInvestorAuction.getRoom_available());
			ps.setBigDecimal(6, factForeignInvestorAuction.getPercent_room_available());
			ps.setBigDecimal(7, factForeignInvestorAuction.getBuy_volume_auction());
			ps.setBigDecimal(8, factForeignInvestorAuction.getPercent_buy_volume_auction_market());
			ps.setBigDecimal(9, factForeignInvestorAuction.getSell_volume_auction());
			ps.setBigDecimal(10, factForeignInvestorAuction.getPercent_sell_volume_auction_market());
			ps.setBigDecimal(11, factForeignInvestorAuction.getBuy_price_auction());
			ps.setBigDecimal(12, factForeignInvestorAuction.getPercent_buy_price_auction_market());
			ps.setBigDecimal(13, factForeignInvestorAuction.getSell_price_auction());
			ps.setBigDecimal(14, factForeignInvestorAuction.getPercent_sell_price_auction_market());
			ps.setBigDecimal(15, factForeignInvestorAuction.getDifference_volume());
			ps.setBigDecimal(16, factForeignInvestorAuction.getDifference_price());
			ps.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
	}
	/**
	 * check Id  Dim Company is Delete before insert or edit
	 * 
	 * @param FactForeignInvestorAuction thong tin FactForeignInvestorAuction
	 * 
	 * @return boolean thong tin true(is delete)/ flase(not delete)
	 */
	private boolean  checkIdDimCompanyDelete(FactForeignInvestorAuction factForeignInvestorAuction){
		String query = "select * from Dim_Company where id =? and isDelete= 0";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, factForeignInvestorAuction.getId_company());
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
	 * @param FactForeignInvestorAuction thong tin FactForeignInvestorAuction
	 * 
	 * @return boolean thong tin true(is delete)/ false(not delete)
	 */
	private boolean  checkIdDimDateDelete(FactForeignInvestorAuction factForeignInvestorAuction){
		String query = "select * from Dim_Date where id =? and isDelete= 0";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setInt(1, factForeignInvestorAuction.getId_date());
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

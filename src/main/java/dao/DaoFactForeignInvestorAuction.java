package dao;

import java.util.List;

import dto.FactForeignInvestorAuctionDto;
import model.FactForeignInvestorAuction;

public interface DaoFactForeignInvestorAuction {
	List<FactForeignInvestorAuctionDto> getFactForeignInvestorAuctionByPage(String page,String search);
	List<String> getFactForeignInvestorAuctionToChart(String Search);
	int getEndPageFactForeignInvestorAuction(String search);
	void deleteFactForeignInvestorAuction(String ids);
	FactForeignInvestorAuction getFactForeignInvestorAuctionById(String id);
	void editFactForeignInvestorAuction(FactForeignInvestorAuction factForeignInvestorAuction);
	void addFactForeignInvestorAuction(FactForeignInvestorAuction factForeignInvestorAuction);
}

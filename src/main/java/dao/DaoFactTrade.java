package dao;

import java.util.List;

import dto.FactTradeDto;
import model.FactTrade;

public interface DaoFactTrade {
	List<FactTradeDto> getFactTradeByPage(String page);
	List<String> getFactTradeToChart();
	int getEndPageFactTrade();
	void deleteFactTrade(String ids);
	FactTrade getFactTradeById(String id);
	void editFactTrade(FactTrade FactTrade);
	void addFactTrade(FactTrade FactTrade);
}

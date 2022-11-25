package dao;

import java.util.List;

import model.DateTrade;

public interface DaoDateTrade {
	List<DateTrade> getDateTradeByPage(String page);
	int getEndPageDateTrade();
	void deleteDateTrade(String ids);
	DateTrade getDateTradeById(String id);
	void editDateTrade(DateTrade dateTrade);
	void addDateTrade(DateTrade dateTrade);
}

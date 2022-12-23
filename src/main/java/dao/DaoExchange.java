package dao;

import java.util.List;

import model.Exchange;

public interface DaoExchange {
	List<Exchange> getExchangeByPage(String page,String search);
	int getEndPageExchange(String search);
	void deleteExchange(String ids);
	Exchange getExchangeById(String id);
	void editExchange(Exchange exchange);
	void addExchange(Exchange exchange);
}

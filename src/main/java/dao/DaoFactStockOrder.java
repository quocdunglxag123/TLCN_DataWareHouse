package dao;

import java.util.List;

import dto.FactStockOrderDto;
import model.FactStockOrder;

public interface DaoFactStockOrder {
	List<FactStockOrderDto> getFactStockOrderByPage(String page,String search);
	List<String> getFactStockOrderToChart(String Search);
	int getEndPageFactStockOrder(String search);
	void deleteFactStockOrder(String ids);
	FactStockOrder getFactStockOrderById(String id);
	void editFactStockOrder(FactStockOrder factStockOrder);
	void addFactStockOrder(FactStockOrder factStockOrder);
}

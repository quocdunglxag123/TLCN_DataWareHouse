package model;

import java.math.BigDecimal;

public class FactStockOrder {
	private int id;
	private int id_date;
	private int id_company;
	private BigDecimal price_close;
	private BigDecimal total_volume_auction;
	private BigDecimal total_price_auction;
	private BigDecimal best_buy_price;
	private BigDecimal best_buy_volume;
	private BigDecimal best_sell_price;
	private BigDecimal best_sell_volume;
	private BigDecimal total_order_buy;
	private BigDecimal total_order_sell;
	private BigDecimal total_order_buy_minus_sell;
	private BigDecimal total_volume_buy;
	private BigDecimal total_volume_sell;
	private BigDecimal total_volume_buy_minus_sell;
	

	

	public FactStockOrder() {
	}




	public FactStockOrder(int id, int id_date, int id_company, BigDecimal price_close, BigDecimal total_volume_auction,
			BigDecimal total_price_auction, BigDecimal best_buy_price, BigDecimal best_buy_volume,
			BigDecimal best_sell_price, BigDecimal best_sell_volume, BigDecimal total_order_buy,
			BigDecimal total_order_sell, BigDecimal total_order_buy_minus_sell, BigDecimal total_volume_buy,
			BigDecimal total_volume_sell, BigDecimal total_volume_buy_minus_sell) {
		super();
		this.id = id;
		this.id_date = id_date;
		this.id_company = id_company;
		this.price_close = price_close;
		this.total_volume_auction = total_volume_auction;
		this.total_price_auction = total_price_auction;
		this.best_buy_price = best_buy_price;
		this.best_buy_volume = best_buy_volume;
		this.best_sell_price = best_sell_price;
		this.best_sell_volume = best_sell_volume;
		this.total_order_buy = total_order_buy;
		this.total_order_sell = total_order_sell;
		this.total_order_buy_minus_sell = total_order_buy_minus_sell;
		this.total_volume_buy = total_volume_buy;
		this.total_volume_sell = total_volume_sell;
		this.total_volume_buy_minus_sell = total_volume_buy_minus_sell;
	}




	public int getId() {
		return id;
	}




	public void setId(int id) {
		this.id = id;
	}




	public int getId_date() {
		return id_date;
	}




	public void setId_date(int id_date) {
		this.id_date = id_date;
	}




	public int getId_company() {
		return id_company;
	}




	public void setId_company(int id_company) {
		this.id_company = id_company;
	}




	public BigDecimal getPrice_close() {
		return price_close;
	}




	public void setPrice_close(BigDecimal price_close) {
		this.price_close = price_close;
	}




	public BigDecimal getTotal_volume_auction() {
		return total_volume_auction;
	}




	public void setTotal_volume_auction(BigDecimal total_volume_auction) {
		this.total_volume_auction = total_volume_auction;
	}




	public BigDecimal getTotal_price_auction() {
		return total_price_auction;
	}




	public void setTotal_price_auction(BigDecimal total_price_auction) {
		this.total_price_auction = total_price_auction;
	}




	public BigDecimal getBest_buy_price() {
		return best_buy_price;
	}




	public void setBest_buy_price(BigDecimal best_buy_price) {
		this.best_buy_price = best_buy_price;
	}




	public BigDecimal getBest_buy_volume() {
		return best_buy_volume;
	}




	public void setBest_buy_volume(BigDecimal best_buy_volume) {
		this.best_buy_volume = best_buy_volume;
	}




	public BigDecimal getBest_sell_price() {
		return best_sell_price;
	}




	public void setBest_sell_price(BigDecimal best_sell_price) {
		this.best_sell_price = best_sell_price;
	}




	public BigDecimal getBest_sell_volume() {
		return best_sell_volume;
	}




	public void setBest_sell_volume(BigDecimal best_sell_volume) {
		this.best_sell_volume = best_sell_volume;
	}




	public BigDecimal getTotal_order_buy() {
		return total_order_buy;
	}




	public void setTotal_order_buy(BigDecimal total_order_buy) {
		this.total_order_buy = total_order_buy;
	}




	public BigDecimal getTotal_order_sell() {
		return total_order_sell;
	}




	public void setTotal_order_sell(BigDecimal total_order_sell) {
		this.total_order_sell = total_order_sell;
	}




	public BigDecimal getTotal_order_buy_minus_sell() {
		return total_order_buy_minus_sell;
	}




	public void setTotal_order_buy_minus_sell(BigDecimal total_order_buy_minus_sell) {
		this.total_order_buy_minus_sell = total_order_buy_minus_sell;
	}




	public BigDecimal getTotal_volume_buy() {
		return total_volume_buy;
	}




	public void setTotal_volume_buy(BigDecimal total_volume_buy) {
		this.total_volume_buy = total_volume_buy;
	}




	public BigDecimal getTotal_volume_sell() {
		return total_volume_sell;
	}




	public void setTotal_volume_sell(BigDecimal total_volume_sell) {
		this.total_volume_sell = total_volume_sell;
	}




	public BigDecimal getTotal_volume_buy_minus_sell() {
		return total_volume_buy_minus_sell;
	}




	public void setTotal_volume_buy_minus_sell(BigDecimal total_volume_buy_minus_sell) {
		this.total_volume_buy_minus_sell = total_volume_buy_minus_sell;
	}




	

}

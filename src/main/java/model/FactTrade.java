package model;

import java.math.BigDecimal;

public class FactTrade {
	private int id;
	private int id_date;
	private int id_company;
	private BigDecimal price_reference;
	private BigDecimal price_open;
	private BigDecimal price_close;
	private BigDecimal price_ceiling;
	private BigDecimal price_floor;
	private BigDecimal mean;
	private BigDecimal volatility;
	private BigDecimal volatility_percent;
	private BigDecimal total_volume;
	private BigDecimal total_price;
	private BigDecimal total_marketcapitalization;
	

	public FactTrade() {
	}

	

	public FactTrade(int id, int id_date, int id_company, BigDecimal price_reference, BigDecimal price_open,
			BigDecimal price_close, BigDecimal price_ceiling, BigDecimal price_floor, BigDecimal mean,
			BigDecimal volatility, BigDecimal volatility_percent, BigDecimal total_volume, BigDecimal total_price,
			BigDecimal total_marketcapitalization) {
		super();
		this.id = id;
		this.id_date = id_date;
		this.id_company = id_company;
		this.price_reference = price_reference;
		this.price_open = price_open;
		this.price_close = price_close;
		this.price_ceiling = price_ceiling;
		this.price_floor = price_floor;
		this.mean = mean;
		this.volatility = volatility;
		this.volatility_percent = volatility_percent;
		this.total_volume = total_volume;
		this.total_price = total_price;
		this.total_marketcapitalization = total_marketcapitalization;
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


	public BigDecimal getPrice_reference() {
		return price_reference;
	}


	public void setPrice_reference(BigDecimal price_reference) {
		this.price_reference = price_reference;
	}


	public BigDecimal getPrice_open() {
		return price_open;
	}


	public void setPrice_open(BigDecimal price_open) {
		this.price_open = price_open;
	}


	public BigDecimal getPrice_close() {
		return price_close;
	}


	public void setPrice_close(BigDecimal price_close) {
		this.price_close = price_close;
	}


	public BigDecimal getPrice_ceiling() {
		return price_ceiling;
	}


	public void setPrice_ceiling(BigDecimal price_ceiling) {
		this.price_ceiling = price_ceiling;
	}


	public BigDecimal getPrice_floor() {
		return price_floor;
	}


	public void setPrice_floor(BigDecimal price_floor) {
		this.price_floor = price_floor;
	}


	public BigDecimal getMean() {
		return mean;
	}


	public void setMean(BigDecimal mean) {
		this.mean = mean;
	}


	public BigDecimal getVolatility() {
		return volatility;
	}


	public void setVolatility(BigDecimal volatility) {
		this.volatility = volatility;
	}


	public BigDecimal getVolatility_percent() {
		return volatility_percent;
	}


	public void setVolatility_percent(BigDecimal volatility_percent) {
		this.volatility_percent = volatility_percent;
	}


	public BigDecimal getTotal_volume() {
		return total_volume;
	}


	public void setTotal_volume(BigDecimal total_volume) {
		this.total_volume = total_volume;
	}


	public BigDecimal getTotal_price() {
		return total_price;
	}


	public void setTotal_price(BigDecimal total_price) {
		this.total_price = total_price;
	}


	public BigDecimal getTotal_marketcapitalization() {
		return total_marketcapitalization;
	}


	public void setTotal_marketcapitalization(BigDecimal total_marketcapitalization) {
		this.total_marketcapitalization = total_marketcapitalization;
	}

	

	


}

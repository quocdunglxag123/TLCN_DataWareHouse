package dto;

import java.math.BigDecimal;
import java.util.Date;

public class FactTradeDto {
	private int id;
	private Date dateTrade;
	private String companyName;
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
	
	public FactTradeDto() {
	}

	
	public FactTradeDto(int id, Date dateTrade, String companyName, BigDecimal price_reference, BigDecimal price_open,
			BigDecimal price_close, BigDecimal price_ceiling, BigDecimal price_floor, BigDecimal mean,
			BigDecimal volatility, BigDecimal volatility_percent, BigDecimal total_volume, BigDecimal total_price,
			BigDecimal total_marketcapitalization) {
		super();
		this.id = id;
		this.dateTrade = dateTrade;
		this.companyName = companyName;
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


	public Date getDateTrade() {
		return dateTrade;
	}

	public void setDateTrade(Date dateTrade) {
		this.dateTrade = dateTrade;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
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

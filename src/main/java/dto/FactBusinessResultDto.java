package dto;

import java.util.Date;

public class FactBusinessResultDto {
	private int id;
	private Date dateTrade;
	private String companyName;
	private String exchangeName;
	private String status;
	private float profit;
	private float previous_period;
	private float same_period;
	private float profit_cummulative;
	private float eps_profit;
	private float eps_cummulative;
	private float price_earning_ratio;
	

	public FactBusinessResultDto() {
	}


	public FactBusinessResultDto(int id, Date dateTrade, String companyName, String exchangeName, String status,
			float profit, float previous_period, float same_period, float profit_cummulative, float eps_profit,
			float eps_cummulative, float price_earning_ratio) {
		super();
		this.id = id;
		this.dateTrade = dateTrade;
		this.companyName = companyName;
		this.exchangeName = exchangeName;
		this.status = status;
		this.profit = profit;
		this.previous_period = previous_period;
		this.same_period = same_period;
		this.profit_cummulative = profit_cummulative;
		this.eps_profit = eps_profit;
		this.eps_cummulative = eps_cummulative;
		this.price_earning_ratio = price_earning_ratio;
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


	public String getExchangeName() {
		return exchangeName;
	}


	public void setExchangeName(String exchangeName) {
		this.exchangeName = exchangeName;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public float getProfit() {
		return profit;
	}


	public void setProfit(float profit) {
		this.profit = profit;
	}


	public float getPrevious_period() {
		return previous_period;
	}


	public void setPrevious_period(float previous_period) {
		this.previous_period = previous_period;
	}


	public float getSame_period() {
		return same_period;
	}


	public void setSame_period(float same_period) {
		this.same_period = same_period;
	}


	public float getProfit_cummulative() {
		return profit_cummulative;
	}


	public void setProfit_cummulative(float profit_cummulative) {
		this.profit_cummulative = profit_cummulative;
	}


	public float getEps_profit() {
		return eps_profit;
	}


	public void setEps_profit(float eps_profit) {
		this.eps_profit = eps_profit;
	}


	public float getEps_cummulative() {
		return eps_cummulative;
	}


	public void setEps_cummulative(float eps_cummulative) {
		this.eps_cummulative = eps_cummulative;
	}


	public float getPrice_earning_ratio() {
		return price_earning_ratio;
	}


	public void setPrice_earning_ratio(float price_earning_ratio) {
		this.price_earning_ratio = price_earning_ratio;
	}


	
}

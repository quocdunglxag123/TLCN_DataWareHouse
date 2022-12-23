package model;

public class FactBusinessResult {
	private int id;
	private int id_date;
	private int id_company;
	private int id_exchange;
	private String status;
	private float profit;
	private float previous_period;
	private float same_period;
	private float profit_cummulative;
	private float eps_profit;
	private float eps_cummulative;
	private float price_earning_ratio;
	

	public FactBusinessResult() {
	}


	public FactBusinessResult(int id, int id_date, int id_company, int id_exchange, String status, float profit,
			float previous_period, float same_period, float profit_cummulative, float eps_profit, float eps_cummulative,
			float price_earning_ratio) {
		super();
		this.id = id;
		this.id_date = id_date;
		this.id_company = id_company;
		this.id_exchange = id_exchange;
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


	public int getId_exchange() {
		return id_exchange;
	}


	public void setId_exchange(int id_exchange) {
		this.id_exchange = id_exchange;
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

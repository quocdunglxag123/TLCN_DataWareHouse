package dto;

import java.util.Date;

public class DateTrade {
	private int id;
	private Date dateTrade;
	

	
	public DateTrade() {
	}


	public DateTrade(int id, Date dateTrade) {
		super();
		this.id = id;
		this.dateTrade = dateTrade;
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

	


}

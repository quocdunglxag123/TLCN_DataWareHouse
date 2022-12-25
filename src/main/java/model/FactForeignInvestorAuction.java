package model;

import java.math.BigDecimal;

public class FactForeignInvestorAuction {
	private int id;
	private int id_date;
	private int id_company;
	private BigDecimal room;
	private BigDecimal percent_owned;
	private BigDecimal room_available;
	private BigDecimal percent_room_available;
	private BigDecimal buy_volume_auction;
	private BigDecimal percent_buy_volume_auction_market;
	private BigDecimal sell_volume_auction;
	private BigDecimal percent_sell_volume_auction_market;
	private BigDecimal buy_price_auction;
	private BigDecimal percent_buy_price_auction_market;
	private BigDecimal sell_price_auction;
	private BigDecimal percent_sell_price_auction_market;
	private BigDecimal difference_volume;
	private BigDecimal difference_price;
	

	

	public FactForeignInvestorAuction() {
	}




	public FactForeignInvestorAuction(int id, int id_date, int id_company, BigDecimal room, BigDecimal percent_owned,
			BigDecimal room_available, BigDecimal percent_room_available, BigDecimal buy_volume_auction,
			BigDecimal percent_buy_volume_auction_market, BigDecimal sell_volume_auction,
			BigDecimal percent_sell_volume_auction_market, BigDecimal buy_price_auction,
			BigDecimal percent_buy_price_auction_market, BigDecimal sell_price_auction,
			BigDecimal percent_sell_price_auction_market, BigDecimal difference_volume, BigDecimal difference_price) {
		super();
		this.id = id;
		this.id_date = id_date;
		this.id_company = id_company;
		this.room = room;
		this.percent_owned = percent_owned;
		this.room_available = room_available;
		this.percent_room_available = percent_room_available;
		this.buy_volume_auction = buy_volume_auction;
		this.percent_buy_volume_auction_market = percent_buy_volume_auction_market;
		this.sell_volume_auction = sell_volume_auction;
		this.percent_sell_volume_auction_market = percent_sell_volume_auction_market;
		this.buy_price_auction = buy_price_auction;
		this.percent_buy_price_auction_market = percent_buy_price_auction_market;
		this.sell_price_auction = sell_price_auction;
		this.percent_sell_price_auction_market = percent_sell_price_auction_market;
		this.difference_volume = difference_volume;
		this.difference_price = difference_price;
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




	public BigDecimal getRoom() {
		return room;
	}




	public void setRoom(BigDecimal room) {
		this.room = room;
	}




	public BigDecimal getPercent_owned() {
		return percent_owned;
	}




	public void setPercent_owned(BigDecimal percent_owned) {
		this.percent_owned = percent_owned;
	}




	public BigDecimal getRoom_available() {
		return room_available;
	}




	public void setRoom_available(BigDecimal room_available) {
		this.room_available = room_available;
	}




	public BigDecimal getPercent_room_available() {
		return percent_room_available;
	}




	public void setPercent_room_available(BigDecimal percent_room_available) {
		this.percent_room_available = percent_room_available;
	}




	public BigDecimal getBuy_volume_auction() {
		return buy_volume_auction;
	}




	public void setBuy_volume_auction(BigDecimal buy_volume_auction) {
		this.buy_volume_auction = buy_volume_auction;
	}




	public BigDecimal getPercent_buy_volume_auction_market() {
		return percent_buy_volume_auction_market;
	}




	public void setPercent_buy_volume_auction_market(BigDecimal percent_buy_volume_auction_market) {
		this.percent_buy_volume_auction_market = percent_buy_volume_auction_market;
	}




	public BigDecimal getSell_volume_auction() {
		return sell_volume_auction;
	}




	public void setSell_volume_auction(BigDecimal sell_volume_auction) {
		this.sell_volume_auction = sell_volume_auction;
	}




	public BigDecimal getPercent_sell_volume_auction_market() {
		return percent_sell_volume_auction_market;
	}




	public void setPercent_sell_volume_auction_market(BigDecimal percent_sell_volume_auction_market) {
		this.percent_sell_volume_auction_market = percent_sell_volume_auction_market;
	}




	public BigDecimal getBuy_price_auction() {
		return buy_price_auction;
	}




	public void setBuy_price_auction(BigDecimal buy_price_auction) {
		this.buy_price_auction = buy_price_auction;
	}




	public BigDecimal getPercent_buy_price_auction_market() {
		return percent_buy_price_auction_market;
	}




	public void setPercent_buy_price_auction_market(BigDecimal percent_buy_price_auction_market) {
		this.percent_buy_price_auction_market = percent_buy_price_auction_market;
	}




	public BigDecimal getSell_price_auction() {
		return sell_price_auction;
	}




	public void setSell_price_auction(BigDecimal sell_price_auction) {
		this.sell_price_auction = sell_price_auction;
	}




	public BigDecimal getPercent_sell_price_auction_market() {
		return percent_sell_price_auction_market;
	}




	public void setPercent_sell_price_auction_market(BigDecimal percent_sell_price_auction_market) {
		this.percent_sell_price_auction_market = percent_sell_price_auction_market;
	}




	public BigDecimal getDifference_volume() {
		return difference_volume;
	}




	public void setDifference_volume(BigDecimal difference_volume) {
		this.difference_volume = difference_volume;
	}




	public BigDecimal getDifference_price() {
		return difference_price;
	}




	public void setDifference_price(BigDecimal difference_price) {
		this.difference_price = difference_price;
	}





}

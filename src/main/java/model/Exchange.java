package model;

public class Exchange {
	private int id;
	private String symbol;
	private String name;
	private String info;

	public Exchange() {
	}

	public Exchange(int id, String symbol, String name, String info) {
		super();
		this.id = id;
		this.symbol = symbol;
		this.name = name;
		this.info = info;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSymbol() {
		return symbol;
	}

	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
	


}

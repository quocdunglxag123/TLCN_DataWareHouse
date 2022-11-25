package connection;

import java.sql.DriverManager;

import java.sql.Connection;

public class DBConnection {
	public static Connection getConnection() throws Exception {
		String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url, userID, password);
	}
	public static final String serverName = "localhost";
	public static final String dbName = "TLCN";
	public static final String portNumber = "1433";
	public static final String userID = "sa";
	public static final String password = "sa";
	public static void main(String[] args) {
		try {
			System.out.println(getConnection());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

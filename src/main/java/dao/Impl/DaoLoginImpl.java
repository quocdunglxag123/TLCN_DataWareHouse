package dao.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.DBConnection;
import dao.DaoLogin;
import model.User;

public class DaoLoginImpl implements DaoLogin {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	@Override
	public User getUserByUserNamePassword(User user) {
		User userDB = new User();
		String query = "select * from UserLogin " + "Where userid=?  COLLATE SQL_Latin1_General_CP1_CS_AS "
				+ "and password=?  COLLATE SQL_Latin1_General_CP1_CS_AS;";
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, user.getUserId());
			ps.setString(2, user.getPassword());
			rs = ps.executeQuery();
			if (rs.next()) {
				userDB = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5));
			}
			if (rs.next()) {
				return null;
			}
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return userDB;
	}

	@Override
	public boolean addUser(User user) {
		String query = "insert into UserLogin(userid,password,username) " + "values(?,?,?)";
		int rowAffected=0;
		try {
			conn = DBConnection.getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, user.getUserId());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getUserName());
			rowAffected= ps.executeUpdate();
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		if (rowAffected>0) {
			return true;
		}else {
			return false;
		}
	}

}

package dao;

import model.User;

public interface DaoLogin {
	User getUserByUserNamePassword(User user);
	boolean addUser(User user);
}

package mapping;

import model.User;

public class UserMapping {
	public User userToModel(String userId, String password,String userName) {
		User user = new User();
		user.setUserId(userId);
		user.setPassword(password);
		user.setUserName(userName);
		return user;
	}

}

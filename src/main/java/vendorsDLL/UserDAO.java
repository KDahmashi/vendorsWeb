package vendorsDLL;

import java.util.List;

import vendorsModel.User;

public interface UserDAO {
	public Integer AddUser(User user);
	public List<User>  GetByID(long userID);
	public User  UserLogin(String email , String password);
	int deleteUser(long userID);
}

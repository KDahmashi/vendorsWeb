package vendorsModel;

import java.util.List;

public class User {

	public long userID;
	public int userTypeID; 
	public String  name;
	public String email; 
	public String password; 
	public int statusID;
	
	public List<Menu> menu;

	public List<Menu> getMenu() {
		return menu;
	}
	public void setMenu(List<Menu> menu) {
		this.menu = menu;
	}
	public long getUserID() {
		return userID;
	}
	public void setUserID(long userID) {
		this.userID = userID;
	}
	public int getUserTypeID() {
		return userTypeID;
	}
	public void setUserTypeID(int userTypeID) {
		this.userTypeID = userTypeID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getStatusID() {
		return statusID;
	}
	public void setStatusID(int statusID) {
		this.statusID = statusID;
	}

}

package vendorsDLL;

import java.util.List;

import vendorsModel.Category;
import vendorsModel.Menu;
import vendorsModel.Products;
import vendorsModel.SubCategory;
import vendorsModel.User;

public interface UserDAO {
	public Integer AddUser(User user);
	public Integer AddCategory(Category category);
	public Integer AddSubCategory(SubCategory subCategory);
	public Integer AddProducts(Products products);
	public List<User>  GetByID(long userID);
	public User  UserLogin(String email , String password);
	public int deleteUser(long userID);
	public int DeleteProduct(long productID);
	public List<Menu> GetUserMenu(long userTypeID);
}
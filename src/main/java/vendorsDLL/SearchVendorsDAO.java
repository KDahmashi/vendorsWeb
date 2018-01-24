package vendorsDLL;

import java.util.List;

import vendorsModel.SearchVendors;


public interface SearchVendorsDAO {
	
	public List<SearchVendors> findVendors(String VendorNameEn, String catName, String subCatName, String productName);
	public List<SearchVendors> getAllVendors();
	


}

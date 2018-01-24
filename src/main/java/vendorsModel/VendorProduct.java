package vendorsModel;

public class VendorProduct {
	
	public long vendorProductID;
	public long vendorID;
	public long productID;
	public long SubCatID;
	public String otherProduct;
	
	public String catName;
	public String subCatName;
	public String productName;
	public String notes;
	public long getVendorProductID() {
		return vendorProductID;
	}
	public void setVendorProductID(long vendorProductID) {
		this.vendorProductID = vendorProductID;
	}
	public long getVendorID() {
		return vendorID;
	}
	public void setVendorID(long vendorID) {
		this.vendorID = vendorID;
	}
	public long getProductID() {
		return productID;
	}
	public void setProductID(long productID) {
		this.productID = productID;
	}
	public String getNotes() {
		return notes;
	}
	public void setNotes(String notes) {
		this.notes = notes;
	}
	
	

	
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
	public String getSubCatName() {
		return subCatName;
	}
	public void setSubCatName(String subCatName) {
		this.subCatName = subCatName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}

	public long getSubCatID() {
		return SubCatID;
	}
	public void setSubCatID(long subCatID) {
		SubCatID = subCatID;
	}
	public String getOtherProduct() {
		return otherProduct;
	}
	public void setOtherProduct(String otherProduct) {
		this.otherProduct = otherProduct;
	}
	

}

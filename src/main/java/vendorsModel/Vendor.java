package vendorsModel;

import java.sql.Date;

public class Vendor {
	
	public long vendorID;
	public long userID;
	public String vendorNameEn;
	public String vendorNameAr;
	public int vendorTypeID;
	public String email;
	public String lanNumber;
	public String mobileNumber;
	public String webSiteurl;
	public int statsID;
	public String crNumber;
	public String statusAr;
	public String statusEn;
	public String commentReason;
	public String crDateBeginning;
	public String crDateExpire;
	public String fax;
	
	
	
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getCrDateBeginning() {
		return crDateBeginning;
	}
	public void setCrDateBeginning(String crDateBeginning) {
		this.crDateBeginning = crDateBeginning;
	}
	public String getCrDateExpire() {
		return crDateExpire;
	}
	public void setCrDateExpire(String crDateExpire) {
		this.crDateExpire = crDateExpire;
	}
	public String getStatusAr() {
		return statusAr;
	}
	public void setStatusAr(String statusAr) {
		this.statusAr = statusAr;
	}
	public String getStatusEn() {
		return statusEn;
	}
	public void setStatusEn(String statusEn) {
		this.statusEn = statusEn;
	}
	public String getCommentReason() {
		return commentReason;
	}
	public void setCommentReason(String commentReason) {
		this.commentReason = commentReason;
	}
	public String getCrNumber() {
		return crNumber;
	}
	public void setCrNumber(String crNumber) {
		this.crNumber = crNumber;
	}
	public long getVendorID() {
		return vendorID;
	}
	public void setVendorID(long vendorID) {
		this.vendorID = vendorID;
	}
	public long getUserID() {
		return userID;
	}
	public void setUserID(long userID) {
		this.userID = userID;
	}
	public String getVendorNameEn() {
		return vendorNameEn;
	}
	public void setVendorNameEn(String vendorNameEn) {
		this.vendorNameEn = vendorNameEn;
	}
	public String getVendorNameAr() {
		return vendorNameAr;
	}
	public void setVendorNameAr(String vendorNameAr) {
		this.vendorNameAr = vendorNameAr;
	}
	public int getVendorTypeID() {
		return vendorTypeID;
	}
	public void setVendorTypeID(int vendorTypeID) {
		this.vendorTypeID = vendorTypeID;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLanNumber() {
		return lanNumber;
	}
	public void setLanNumber(String lanNumber) {
		this.lanNumber = lanNumber;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getWebSiteurl() {
		return webSiteurl;
	}
	public void setWebSiteurl(String webSiteurl) {
		this.webSiteurl = webSiteurl;
	}
	public int getStatsID() {
		return statsID;
	}
	public void setStatsID(int statsID) {
		this.statsID = statsID;
	}
	
	
	

}

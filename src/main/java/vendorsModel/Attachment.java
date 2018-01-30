package vendorsModel;

public class Attachment {
	
	public Long attachmentID;
	public int attachmentTypeID;
	public Long vendorID;
	public String fileName;
	public String attachmentAr;
	public String attachmentEn;
	
	
	public String getAttachmentAr() {
		return attachmentAr;
	}
	public void setAttachmentAr(String attachmentAr) {
		this.attachmentAr = attachmentAr;
	}
	public String getAttachmentEn() {
		return attachmentEn;
	}
	public void setAttachmentEn(String attachmentEn) {
		this.attachmentEn = attachmentEn;
	}
	public Long getAttachmentID() {
		return attachmentID;
	}
	public void setAttachmentID(Long attachmentID) {
		this.attachmentID = attachmentID;
	}
	public int getAttachmentTypeID() {
		return attachmentTypeID;
	}
	public void setAttachmentTypeID(int attachmentTypeID) {
		this.attachmentTypeID = attachmentTypeID;
	}
	public Long getVendorID() {
		return vendorID;
	}
	public void setVendorID(Long vendorID) {
		this.vendorID = vendorID;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	

}

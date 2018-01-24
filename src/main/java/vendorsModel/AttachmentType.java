package vendorsModel;

public class AttachmentType {
	
	public int attachmentTypeID;
	public String attachmentAr;
	public String attachmentEn;
	public String fileName;
	
	public String getFileName() {
		return attachmentEn.replace(" ", "");
	}
	public int getAttachmentTypeID() {
		return attachmentTypeID;
	}
	public void setAttachmentTypeID(int attachmentTypeID) {
		this.attachmentTypeID = attachmentTypeID;
	}
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


}

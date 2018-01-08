package vendorsModel;

public class Bank {
	
	public long bankID;
	public long vendorID;
	public String bankName;
	public String iban;
	public long getBankID() {
		return bankID;
	}
	public void setBankID(long bankID) {
		this.bankID = bankID;
	}
	public long getVendorID() {
		return vendorID;
	}
	public void setVendorID(long vendorID) {
		this.vendorID = vendorID;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getIban() {
		return iban;
	}
	public void setIban(String iban) {
		this.iban = iban;
	}
	
	
	
	

}

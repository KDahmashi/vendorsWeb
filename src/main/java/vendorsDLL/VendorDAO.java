package vendorsDLL;

import java.util.List;
import java.util.Map;

import vendorsModel.Bank;
import vendorsModel.Branch;
import vendorsModel.ContactPerson;
import vendorsModel.Vendor;
import vendorsModel.VendorProduct;


public interface VendorDAO {
	
	
public Long AddVendor(Vendor vendor);
public Integer AddBank(Bank bank);
public Integer AddContactPerson(ContactPerson contactPerson);
public Integer AddVendorProduct(VendorProduct vendorProduct);
public Integer AddBranch(Branch branch);
public int deleteBank(long bankID);

public  Map<Integer, String> GetAllVendorTypes();
public List<Bank> GetBanks(long vendorID);

}

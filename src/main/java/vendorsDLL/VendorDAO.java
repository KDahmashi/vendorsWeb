package vendorsDLL;

import vendorsModel.Bank;
import vendorsModel.Branch;
import vendorsModel.ContactPerson;
import vendorsModel.Vendor;

public interface VendorDAO {
	
	
public Integer AddVendor(Vendor vendor);
public Integer AddBank(Bank bank);
public Integer AddContactPerson(ContactPerson contactPerson);

public Integer AddBranch(Branch branch);

}

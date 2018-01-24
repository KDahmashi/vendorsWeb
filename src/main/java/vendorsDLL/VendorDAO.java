package vendorsDLL;

import java.util.List;
import java.util.Map;

import vendorsModel.Attachment;
import vendorsModel.AttachmentType;
import vendorsModel.Bank;
import vendorsModel.ContactPerson;
import vendorsModel.Vendor;
import vendorsModel.VendorBranches;
import vendorsModel.VendorProduct;


public interface VendorDAO {
	
	
public Long AddVendor(Vendor vendor);
public Integer AddBank(Bank bank);
public Integer AddContactPerson(ContactPerson contactPerson);
public Integer AddVendorProduct(VendorProduct vendorProduct);
public Integer AddBranch(VendorBranches branch);
public int deleteBank(long bankID);
public int deleteContactPerson(long contactPersonID);

public  Map<Integer, String> GetAllVendorTypes();
public List<Bank> GetBanks(long vendorID);
public List<ContactPerson> GetContactPerson(long vendorID);

public Vendor GetVendorByUserID(long userID);
public  Map<Long, String> GetAllCategory();
public  Map<Long, String> GetSubCategory(Long CatID);
public  Map<Long, String> GetProducts(Long SubCatID);

public List<VendorProduct> GetVendorProductByID(long VendorID);
public int DeleteVendorProduct(long vendorProductID) ;


public List<VendorBranches> GetVendorBranchesByID(long VendorID);
public int DeleteVendorBranches(long branchesID) ;


public  Map<Integer, String> GetAllCities(Integer stateID);
public  Map<Integer, String> GetAllStates(Integer countryID);
public  Map<Integer, String> GetAllCountries();

public Integer UpdatStatus(long vendorID, int statusID);

public List<AttachmentType> GetAttachmentTypes();
public Integer AddAttachment(Attachment attachment);
public List<Attachment> GetAllAttachments(long VendorID);

}

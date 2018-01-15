package vendorsDLL;

import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

import vendorsModel.Bank;
import vendorsModel.Branch;
import vendorsModel.ContactPerson;
import vendorsModel.Menu;
import vendorsModel.Vendor;
import vendorsModel.VendorProduct;

import vendorsModel.VendorType;

public class VendorsImpl implements VendorDAO {
	
	
	private DataSource dataSource;


	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	  public Long AddVendor(Vendor vendor) {
	    	
	    	try {
	    		
	    		SimpleJdbcCall jdbcCall = new 
	                SimpleJdbcCall(dataSource).withProcedureName("AddVendor")
	                .withoutProcedureColumnMetaDataAccess().declareParameters(
	                		new SqlParameter( "userID_in", Types.BIGINT ),
	                		new SqlParameter( "vendorNameEn_in", Types.VARCHAR ),
	                		new SqlParameter( "vendorNameAr_in", Types.VARCHAR ),
	                		new SqlParameter( "vendorTypeID_in", Types.INTEGER ),
	                		new SqlParameter( "email_in", Types.VARCHAR ),
	                		new SqlParameter( "lanNumber_in", Types.VARCHAR ),
	                		new SqlParameter( "mobileNumber_in", Types.VARCHAR ),
	                		new SqlParameter( "webSiteurl_in", Types.VARCHAR ),
	                		new SqlParameter( "crNumber_in", Types.VARCHAR ),
		    				new SqlOutParameter("result", Types.BIGINT ));
	                       
	
	    				
	    			Map<String, Object> result = new HashMap<String, Object>(2);
	    				result.put("userID_in",vendor.userID);
	    				result.put("vendorNameEn_in", vendor.vendorNameEn);
	    				result.put("vendorNameAr_in", vendor.vendorNameAr);
	    				result.put("vendorTypeID_in", vendor.vendorTypeID);
	    				result.put("email_in", vendor.email);
	    				result.put("lanNumber_in", vendor.lanNumber);
	    				result.put("mobileNumber_in", vendor.mobileNumber);
	    				result.put("webSiteurl_in", vendor.webSiteurl);
	    				result.put("crNumber_in", vendor.crNumber);
	    			 
	    				
	    			result = jdbcCall.execute(result);
	    			
	    			return (Long) result.get("result");
	  
	             
	    	}catch(Exception ex)
	    	{
	    		String exc=ex.getMessage();

	    		
	    		 return Long.valueOf(0); 
	    	}	
	            
	}
	  
	  
	  public Integer AddBank(Bank bank) {
	    	
	    	try {
	    		
	    		SimpleJdbcCall jdbcCall = new 
	                SimpleJdbcCall(dataSource).withProcedureName("AddBank")
	                .withoutProcedureColumnMetaDataAccess().declareParameters(
	                		new SqlParameter( "vendorID_in", Types.BIGINT ),
	                		new SqlParameter( "bankName_in", Types.VARCHAR ),
	                		new SqlParameter( "iban_in", Types.VARCHAR ),
		    				new SqlOutParameter("result", Types.INTEGER ));
	                       
	
	    				
	    			Map<String, Object> result = new HashMap<String, Object>(2);
	    				result.put("vendorID_in",bank.vendorID);
	    				result.put("bankName_in", bank.bankName);
	    				result.put("iban_in", bank.iban);
	    			 
	    				
	    			result = jdbcCall.execute(result);
	    			
	    			return (Integer) result.get("result");
	  
	             
	    	}catch(Exception ex)
	    	{
	    		String exc=ex.getMessage();
	    		
	    		 return 0; 
	    	}	
	            
	}
	  
	  
	  
	  public Integer AddContactPerson(ContactPerson contactPerson) {
	    	
	    	try {
	    		
	    		SimpleJdbcCall jdbcCall = new 
	                SimpleJdbcCall(dataSource).withProcedureName("AddContactPerson")
	                .withoutProcedureColumnMetaDataAccess().declareParameters(
	                		new SqlParameter( "vendorID_in", Types.BIGINT ),
	                		new SqlParameter( "fullName_in", Types.VARCHAR ),
	                		new SqlParameter( "mobile_in", Types.VARCHAR ),
	                		new SqlParameter( "email_in", Types.VARCHAR ),
		    				new SqlOutParameter("result", Types.INTEGER ));
	                       
	
	    				
	    			Map<String, Object> result = new HashMap<String, Object>(2);
	    				result.put("vendorID_in",contactPerson.vendorID);
	    				result.put("fullName_in", contactPerson.fullName);
	    				result.put("mobile_in", contactPerson.mobile);
	    				result.put("email_in", contactPerson.email);
	    			 
	    				
	    			result = jdbcCall.execute(result);
	    			
	    			return (Integer) result.get("result");
	  
	             
	    	}catch(Exception ex)
	    	{
	    		String exc=ex.getMessage();
	    		
	    		 return 0; 
	    	}	
	            
	}
	  
	  
	  
	  public Integer AddBranch(Branch branch) {
	    	
	    	try {
	    		
	    		SimpleJdbcCall jdbcCall = new 
	                SimpleJdbcCall(dataSource).withProcedureName("AddContactPerson")
	                .withoutProcedureColumnMetaDataAccess().declareParameters(
	                		new SqlParameter( "vendorID_in", Types.BIGINT ),
	                		new SqlParameter( "cityID_in", Types.BIGINT ),
		    				new SqlOutParameter("result", Types.INTEGER ));
	                       
	
	    				
	    			Map<String, Object> result = new HashMap<String, Object>(2);
	    				result.put("vendorID_in",branch.vendorID);
	    				result.put("cityID_in", branch.cityID);
	    			 
	    				
	    			result = jdbcCall.execute(result);
	    			
	    			return (Integer) result.get("result");
	  
	             
	    	}catch(Exception ex)
	    	{
	    		String exc=ex.getMessage();
	    		
	    		 return 0; 
	    	}	
	            
	}
	  
  
	  
	  public Integer AddVendorProduct(VendorProduct vendorProduct) {
	    	
	    	try {
	    		
	    		SimpleJdbcCall jdbcCall = new 
	                SimpleJdbcCall(dataSource).withProcedureName("AddVendorProduct")
	                .withoutProcedureColumnMetaDataAccess().declareParameters(
	                		new SqlParameter( "vendorID_in", Types.BIGINT ),
	                		new SqlParameter( "productID_in", Types.BIGINT ),
	                		new SqlParameter( "notes_in", Types.VARCHAR ),
		    				new SqlOutParameter("result", Types.INTEGER ));
	                       
	
	    				
	    			Map<String, Object> result = new HashMap<String, Object>(2);
	    				result.put("vendorID_in",vendorProduct.vendorID);
	    				result.put("productID_in", vendorProduct.productID);
	    				result.put("notes_in", vendorProduct.notes);
	    			 
	    				
	    			result = jdbcCall.execute(result);
	    			
	    			return (Integer) result.get("result");
	  
	             
	    	}catch(Exception ex)
	    	{
	    		String exc=ex.getMessage();
	    		
	    		 return 0; 
	    	}	
	            
	}
	  
	    public  Map<Integer, String> GetAllVendorTypes()
	    {	
	    	  Map<Integer, String> lst = new HashMap<Integer, String>();	      
	    	try {
	        
	    		SimpleJdbcCall jdbcCall = new 
		                SimpleJdbcCall(dataSource).withProcedureName("GetAllVendorTypes")
		                .withoutProcedureColumnMetaDataAccess().declareParameters();	            			    				                   
		    				
		    			Map<String, Object> result = new HashMap<String, Object>(2);    					    				 
		    				result = jdbcCall.execute(result);

		    	            List<Map<String, Object>> list = (List) result.get("#result-set-1");	    
		    	            
	            for (Map<String, Object> item : list) {	 	            	
	            	lst.put((Integer) (item.get("typeID")), (String) (item.get("typeEn")));    	             	
	            }       	                    
	            
	    	}catch(Exception ex)
	    	{
	    		String exc=ex.getMessage();
	    		 return lst;  
	    	}
	            
	             return lst;  	          
	    
	    }
	    
	    
	    // Get all Bank of vendor 
	    public List<Bank> GetBanks(long vendorID)
	    {
	
	    	List<Bank> lstBank= new ArrayList<Bank>();
	      
	    	try {	    		
	        

	    		SimpleJdbcCall jdbcCall = new 
		                SimpleJdbcCall(dataSource).withProcedureName("GetBanksByVendorID")
		                .withoutProcedureColumnMetaDataAccess().declareParameters(
		                		new SqlParameter( "vendorID_in", Types.INTEGER));	            			    				                   
		    				
		    			Map<String, Object> result = new HashMap<String, Object>(2);
		    				result.put("vendorID_in", vendorID);  		    				 

		    				result = jdbcCall.execute(result);

		    	            List<Map<String, Object>> list = (List) result.get("#result-set-1");
	           

	            for (Map<String, Object> item : list) {	 
	            	Bank bank = new Bank();
	            	  
	            	bank.bankID=(Long) (item.get("bankID"));
	            	bank.vendorID= vendorID;
	            	bank.bankName=(String)item.get("bankName");
	            	bank.iban=(String)item.get("iban");
	            	
	               	
	            	
	            	lstBank.add(bank);
	            }
	            	            
	        
	             
	    	}catch(Exception ex)
	    	{
	    		String exc=ex.getMessage();
	    		 return lstBank;  
	    	}
	            
	             return lstBank;   
	    	    
	    }

	    
	    
	    public int deleteBank(long bankID)    {
	 	   
	    	try {	    		
	        
	    		SimpleJdbcCall jdbcCall = new 
		                SimpleJdbcCall(dataSource).withProcedureName("DeleteBank")
		                .withoutProcedureColumnMetaDataAccess().declareParameters(
		                		new SqlParameter( "bankID_in", Types.INTEGER ),		                		
			    				new SqlOutParameter("result", Types.INTEGER ));                     
		    				
		    			Map<String, Object> result = new HashMap<String, Object>(2);
		    				result.put("bankID_in", bankID);  				
		    			 
		    				
		    			result = jdbcCall.execute(result);
		    			
		    			return (Integer) result.get("result");		                        	            
	        
	             
	    	}catch(Exception ex)
	    	{
	    		String exc=ex.getMessage();
	    		 return 0;  
	    	}        
	    
	    
	    
}  
	    

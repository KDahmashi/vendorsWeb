package vendorsDLL;

import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

import vendorsModel.SearchVendors;
import vendorsModel.User;


public class SearchVendorsImp implements SearchVendorsDAO {

	private DataSource dataSource;


	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	@Override
	public List<SearchVendors> findVendors(String VendorNameEn, String catName, String subCatName, String productName) {
		
		List<SearchVendors> lstvendor= new ArrayList<SearchVendors>();
	      
    	try {	    		
        
    		SimpleJdbcCall jdbcCall = new 
	                SimpleJdbcCall(dataSource).withProcedureName("SearchVendors")
	                .withoutProcedureColumnMetaDataAccess().declareParameters(
	                		new SqlParameter( "vendorName_in", Types.VARCHAR ),
	                		new SqlParameter( "catName_in", Types.VARCHAR ),
	                		new SqlParameter( "subCatName_in", Types.VARCHAR ),
	                		new SqlParameter( "productName_in", Types.VARCHAR ));
		    				
	                       
	
	    				
	    			Map<String, Object> result = new HashMap<String, Object>(2);
	    				result.put("vendorName_in", VendorNameEn);
	    				result.put("catName_in", catName);
	    				result.put("subCatName_in", subCatName);
	    				result.put("productName_in", productName);
	    			 
	    				
	    			result = jdbcCall.execute(result);   		
    		
  

            List<Map<String, Object>> list = (List) result.get("#result-set-1");
           

            for (Map<String, Object> item : list) {	 
            	SearchVendors vendor = new SearchVendors();
            	  
            	vendor.vendorID=(Long) (item.get("vendorID"));
            	vendor.vendorNameEn=(String) (item.get("VendorNameEn"));
            	vendor.vendorNameAr=(String) (item.get("VendorNameAr"));
            	vendor.fullName=(String) (item.get("fullName"));
            	vendor.mobile=(String) (item.get("mobile"));
            	/*vendor.productName=(String) (item.get("productName"));
            	vendor.catName=(String) (item.get("catName"));
            	vendor.subCatName=(String) (item.get("subCatName"));*/
            	//vendor.webSiteurl=(String) (item.get("webSiteurl"));
            	vendor.emailPerson=(String) (item.get("emailPerson"));
            	vendor.statusAr=(String) (item.get("statusAr"));
            	vendor.statusEn=(String) (item.get("statusEn"));
            	
            	 	
            	
            	lstvendor.add(vendor);
            }
            	            
        
             
    	}catch(Exception ex)
    	{   	
    		new ExceptionImp().LogException(dataSource,Thread.currentThread().getStackTrace()[1].getMethodName(),ex.toString());
    		 return lstvendor;  
    	}
            
             return lstvendor;  
    
    
             
    
    }

	@Override
	public List<SearchVendors> findRejectedVendors(String VendorNameEn, String catName, String subCatName,
			String productName) {
		List<SearchVendors> lstvendor= new ArrayList<SearchVendors>();
	      
    	try {	    		
        
    		SimpleJdbcCall jdbcCall = new 
	                SimpleJdbcCall(dataSource).withProcedureName("SearchRejectedVendors")
	                .withoutProcedureColumnMetaDataAccess().declareParameters(
	                		new SqlParameter( "vendorName_in", Types.VARCHAR ),
	                		new SqlParameter( "catName_in", Types.VARCHAR ),
	                		new SqlParameter( "subCatName_in", Types.VARCHAR ),
	                		new SqlParameter( "productName_in", Types.VARCHAR ));
		    				
	                       
	
	    				
	    			Map<String, Object> result = new HashMap<String, Object>(2);
	    				result.put("vendorName_in", VendorNameEn);
	    				result.put("catName_in", catName);
	    				result.put("subCatName_in", subCatName);
	    				result.put("productName_in", productName);
	    			 
	    				
	    			result = jdbcCall.execute(result);   		
    		
  

            List<Map<String, Object>> list = (List) result.get("#result-set-1");
           

            for (Map<String, Object> item : list) {	 
            	SearchVendors vendor = new SearchVendors();
            	  
            	vendor.vendorID=(Long) (item.get("vendorID"));
            	vendor.vendorNameEn=(String) (item.get("VendorNameEn"));
            	vendor.vendorNameAr=(String) (item.get("VendorNameAr"));
            	vendor.fullName=(String) (item.get("fullName"));
            	vendor.mobile=(String) (item.get("mobile"));
            	/*vendor.productName=(String) (item.get("productName"));
            	vendor.catName=(String) (item.get("catName"));
            	vendor.subCatName=(String) (item.get("subCatName"));*/
            	//vendor.webSiteurl=(String) (item.get("webSiteurl"));
            	vendor.emailPerson=(String) (item.get("emailPerson"));
            	vendor.statusAr=(String) (item.get("statusAr"));
            	vendor.statusEn=(String) (item.get("statusEn"));
            	
            	 	
            	
            	lstvendor.add(vendor);
            }
            	            
        
             
    	}catch(Exception ex)
    	{   	
    		new ExceptionImp().LogException(dataSource,Thread.currentThread().getStackTrace()[1].getMethodName(),ex.toString());
    		 return lstvendor;  
    	}
            
             return lstvendor;
	}

	
	

}

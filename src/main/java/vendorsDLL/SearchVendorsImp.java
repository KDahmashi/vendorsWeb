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
           
           // String name1=(String)list.get(0).get("email");

            for (Map<String, Object> item : list) {	 
            	SearchVendors vendor = new SearchVendors();
            	  
            	vendor.vendorNameEn=(String) (item.get("VendorNameEn"));
            	vendor.vendorNameAr=(String) (item.get("VendorNameAr"));
            	vendor.catName=(String) (item.get("catName"));
            	vendor.subCatName=(String) (item.get("subCatName"));
            	vendor.productName=(String) (item.get("productName"));
            	
            	//vendor.statsID= (Integer) (item.get("statusID"));        	
            	
            	lstvendor.add(vendor);
            }
            	            
        
             
    	}catch(Exception ex)
    	{
    		String exc=ex.getMessage();
    		 return lstvendor;  
    	}
            
             return lstvendor;  
    
    
             
    
    }

	@Override
	public List<SearchVendors> findVendors(SearchVendors searchVendors) {
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
	    				result.put("vendorName_in", searchVendors.vendorNameEn);
	    				result.put("catName_in", searchVendors.catName);
	    				result.put("subCatName_in", searchVendors.subCatName);
	    				result.put("productName_in", searchVendors.productName);
	    			 
	    				
	    			result = jdbcCall.execute(result);   		
    		
  

            List<Map<String, Object>> list = (List) result.get("#result-set-1");
           
           // String name1=(String)list.get(0).get("email");

            for (Map<String, Object> item : list) {	 
            	SearchVendors vendor = new SearchVendors();
            	  
            	vendor.vendorNameEn=(String) (item.get("VendorNameEn"));
            	vendor.vendorNameAr=(String) (item.get("VendorNameAr"));
            	vendor.catName=(String) (item.get("catName"));
            	vendor.subCatName=(String) (item.get("subCatName"));
            	vendor.productName=(String) (item.get("productName"));
            	vendor.mobileNumber=(Long) (item.get("mobileNumber"));
            	vendor.lanNumber=(Long) (item.get("lanNumber"));
            	vendor.email=(String) (item.get("email"));
            	vendor.webSiteurl=(String) (item.get("webSiteurl"));
            	
            	
            	//vendor.statsID= (Integer) (item.get("statusID"));        	
            	
            	lstvendor.add(vendor);
            }
            	            
        
             
    	}catch(Exception ex)
    	{
    		String exc=ex.getMessage();
    		 return lstvendor;  
    	}
            
             return lstvendor;
	}
	

}

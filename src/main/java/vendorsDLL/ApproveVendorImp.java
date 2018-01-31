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
import vendorsModel.Vendor;


public class ApproveVendorImp implements ApproveVendorDAO {
	
	private DataSource dataSource;


	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	  public Vendor GetVendorByID(long vendorID)
    {  
    	Vendor vendor = new Vendor();
    	try {
    		SimpleJdbcCall jdbcCall = new 
	                SimpleJdbcCall(dataSource).withProcedureName("GetVendorByVendorID")
	                .withoutProcedureColumnMetaDataAccess().declareParameters(
	                		new SqlParameter( "vendorID_in", Types.BIGINT));	            			    				                   
	    				
	    			Map<String, Object> result = new HashMap<String, Object>(2);
	    				result.put("vendorID_in", vendorID);  		    				 

	    				result = jdbcCall.execute(result);

	    	            List<Map<String, Object>> list = (List) result.get("#result-set-1");	           

            for (Map<String, Object> item : list) {	 
            
            //	vendor.userID=userID;
            	vendor.vendorID=(Long) (item.get("vendorID"));
            	vendor.vendorTypeID=(Integer) (item.get("vendorTypeID"));
            	
            	vendor.vendorNameEn=(String) (item.get("VendorNameEn"));
            	vendor.vendorNameAr=(String) (item.get("VendorNameAr"));	
            	vendor.email=(String) (item.get("email"));
            	vendor.mobileNumber=(String) (item.get("mobileNumber"));
            	vendor.lanNumber=(String) (item.get("lanNumber"));
            	vendor.webSiteurl=(String) (item.get("webSiteurl"));
            	vendor.crNumber=(String) (item.get("crNumber"));
            	
            }
            	            
        
             
    	}catch(Exception ex)
    	{
    		new ExceptionImp().LogException(dataSource,Thread.currentThread().getStackTrace()[1].getMethodName(),ex.toString());
    		 return vendor;  
    	}
            
             return vendor;   
    	    
    }
}

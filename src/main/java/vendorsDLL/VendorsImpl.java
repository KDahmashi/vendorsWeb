package vendorsDLL;

import java.sql.Types;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

import vendorsModel.Vendor;

public class VendorsImpl implements VendorDAO {
	
	
	private DataSource dataSource;


	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	  public Integer AddVendor(Vendor vendor) {
	    	
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
		    				new SqlOutParameter("result", Types.INTEGER ));
	                       
	
	    				
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
	    			
	    			return (Integer) result.get("result");
	  
	             
	    	}catch(Exception ex)
	    	{
	    		String exc=ex.getMessage();
	    		
	    		 return 0; 
	    	}	
	            
	}

}

package vendorsDLL;

import java.sql.Types;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;




public class ExceptionImp implements ExceptionDAO{
	
	
	
	 public void LogException(DataSource Source,String exceptionFrom,String exception) {	    	
	    	try {
	    		
	    		SimpleJdbcCall jdbcCall = new 
	                SimpleJdbcCall(Source).withProcedureName("AddException")
	                .withoutProcedureColumnMetaDataAccess().declareParameters(	                		
	                		new SqlParameter( "functionName_in", Types.VARCHAR ),
	                		new SqlParameter( "exception_in", Types.VARCHAR ));
	                       
	
	    				
	    			Map<String, Object> result = new HashMap<String, Object>(2);	    				
	    				result.put("functionName_in", exceptionFrom);
	    				result.put("exception_in",exception);
	    			 
	    				
	    			 jdbcCall.execute(result);
	    			
	    			
	  
	             
	    	}catch(Exception ex)
	    	{
	    		   	
	    	}	
	            
	}

}

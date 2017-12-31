package vendorsDLL;
import vendorsModel.User;


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



public class UserImpl  implements  UserDAO{
	
	private DataSource dataSource;


	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
    
	    
	    public Integer AddUser(User user) {
	    	
	    	try {
	    		
	    		SimpleJdbcCall jdbcCall = new 
	                SimpleJdbcCall(dataSource).withProcedureName("AddUser")
	                .withoutProcedureColumnMetaDataAccess().declareParameters(
	                		new SqlParameter( "userTypeID_in", Types.INTEGER ),
	                		new SqlParameter( "name_in", Types.VARCHAR ),
	                		new SqlParameter( "email_in", Types.VARCHAR ),
	                		new SqlParameter( "password_in", Types.VARCHAR ),
		    				new SqlOutParameter("result", Types.INTEGER ));
	                       
	
	    				
	    			Map<String, Object> result = new HashMap<String, Object>(2);
	    				result.put("userTypeID_in", 1);
	    				result.put("name_in", user.name);
	    				result.put("email_in", user.email);
	    				result.put("password_in", user.password);
	    			 
	    				
	    			result = jdbcCall.execute(result);
	    			
	    			return (Integer) result.get("result");
	  
	             
	    	}catch(Exception ex)
	    	{
	    		String exc=ex.getMessage();
	    		
	    		 return 0; 
	    	}	
	            
	}
	    

	    // Get User 
	    public List<User> GetByID(long userID)
	    {
	
	    	List<User> lstUser= new ArrayList<User>();
	      
	    	try {	    		
	        
	        SimpleJdbcCall jdbcCall = new 
	                SimpleJdbcCall(dataSource).withProcedureName("GetUserByID");

	             SqlParameterSource in = new MapSqlParameterSource().addValue("userID_in", userID);
	             Map<String, Object> result = jdbcCall.execute(in);

	            List<Map<String, Object>> list = (List) result.get("#result-set-1");
	           
	           // String name1=(String)list.get(0).get("email");

	            for (Map<String, Object> item : list) {	 
	            	  User user = new User();
	            	  
	                user.userID=(Long) (item.get("userID"));
	            	user.userTypeID= (Integer) (item.get("userTypeID"));
	            	user.name=(String)item.get("name");
	            	user.email=(String)item.get("email");
	            	
	            	user.statusID= (Integer) (item.get("statusID"));        	
	            	
	            	lstUser.add(user);
	            }
	            	            
	        
	             
	    	}catch(Exception ex)
	    	{
	    		String exc=ex.getMessage();
	    		 return lstUser;  
	    	}
	            
	             return lstUser;  
	    
	    
	             
	    
	    }
	    
	    
	    public int deleteUser(long userID)    {
	   
	    	try {	    		
	        
	    		SimpleJdbcCall jdbcCall = new 
		                SimpleJdbcCall(dataSource).withProcedureName("DeleteUser")
		                .withoutProcedureColumnMetaDataAccess().declareParameters(
		                		new SqlParameter( "userID_in", Types.INTEGER ),		                		
			    				new SqlOutParameter("result", Types.INTEGER ));                     
		    				
		    			Map<String, Object> result = new HashMap<String, Object>(2);
		    				result.put("userID_in", userID);  				
		    			 
		    				
		    			result = jdbcCall.execute(result);
		    			
		    			return (Integer) result.get("result");		                        	            
	        
	             
	    	}catch(Exception ex)
	    	{
	    		String exc=ex.getMessage();
	    		 return 0;  
	    	}        
	         
	       
	    
	    }
	    
	    
	    // User Login 
	    public User UserLogin(String email , String password)
	    {
	
	        User user= new User();
	      
	    	try {	    		
	        
	              
		    		SimpleJdbcCall jdbcCall = new 
			                SimpleJdbcCall(dataSource).withProcedureName("LoginUser")
			                .withoutProcedureColumnMetaDataAccess().declareParameters(
			                		new SqlParameter( "email_in", Types.VARCHAR),		                		
				    				new SqlParameter("password_in", Types.VARCHAR ));                     
			    				
			    			Map<String, Object> result = new HashMap<String, Object>(2);
			    				result.put("email_in", email);  
			    				result.put("password_in", password);  
			    				
			    				result = jdbcCall.execute(result);

	            List<Map<String, Object>> list = (List) result.get("#result-set-1");
	           
	            for (Map<String, Object> item : list) {	 
	            	  
	            	user.userID=(Long) (item.get("userID"));
	            	user.userTypeID= (Integer) (item.get("userTypeID"));
	            	user.name=(String)item.get("name");
	            	user.email=(String)item.get("email");
	            	
	            	user.statusID= (Integer) (item.get("statusID"));        		            	
	          
	            }
	            	            
	        
	             
	    	}catch(Exception ex)
	    	{
	    		String exc=ex.getMessage();
	    		exc="";
	    		  
	    	}
	            
	             return user;  
	    }
	    

}

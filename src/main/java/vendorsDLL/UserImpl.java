package vendorsDLL;
import vendorsModel.User;
import vendorsModel.Category;
import vendorsModel.Menu;
import vendorsModel.Products;
import vendorsModel.SubCategory;

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
		                		new SqlParameter( "userID_in", Types.BIGINT ),		                		
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
	    
	    
	 // Get all menu of User 
	    public List<Menu> GetUserMenu(long userTypeID)
	    {
	
	    	List<Menu> lstMenu= new ArrayList<Menu>();
	      
	    	try {	    		
	        

	    		SimpleJdbcCall jdbcCall = new 
		                SimpleJdbcCall(dataSource).withProcedureName("GetAllMenus")
		                .withoutProcedureColumnMetaDataAccess().declareParameters(
		                		new SqlParameter( "userTypeID_in", Types.INTEGER));	            			    				                   
		    				
		    			Map<String, Object> result = new HashMap<String, Object>(2);
		    				result.put("userTypeID_in", userTypeID);  		    				 

		    				result = jdbcCall.execute(result);

		    	            List<Map<String, Object>> list = (List) result.get("#result-set-1");
	           

	            for (Map<String, Object> item : list) {	 
	            	Menu menu = new Menu();
	            	  
	            	menu.menuID=(Integer) (item.get("menuID"));
	            	menu.menuEn= (String) (item.get("menuEn"));
	            	menu.menuAr=(String)item.get("menuAr");
	            	menu.menuUrl=(String)item.get("menuUrl");
	            	
	            	menu.userTypeID= (Integer) (item.get("userTypeID"));        	
	            	
	            	lstMenu.add(menu);
	            }
	            	            
	        
	             
	    	}catch(Exception ex)
	    	{
	    		String exc=ex.getMessage();
	    		 return lstMenu;  
	    	}
	            
	             return lstMenu;  
	    
	    
	             
	    
	    }
	    
public Integer AddCategory(Category categor) {
	    	
	    	try {
	    		
	    		SimpleJdbcCall jdbcCall = new 
	                SimpleJdbcCall(dataSource).withProcedureName("AddCategory")
	                .withoutProcedureColumnMetaDataAccess().declareParameters(
	                		new SqlParameter( "catName_in", Types.VARCHAR ),
		    				new SqlOutParameter("result", Types.INTEGER ));
	                       
	
	    				
	    			Map<String, Object> result = new HashMap<String, Object>(2);
	    				result.put("catName_in", categor.catName);
	    			 
	    				result = jdbcCall.execute(result);
		    			
		    			return (Integer) result.get("result");
	    				
	    			
	  
	             
	    	}catch(Exception ex)
	    	{
	    		String exc=ex.getMessage();
	    		
	    		 return 0; 
	    	}	
	            
	}

public Integer AddSubCategory(SubCategory subCategory) {
	
	try {
		
		SimpleJdbcCall jdbcCall = new 
            SimpleJdbcCall(dataSource).withProcedureName("AddSubCategory")
            .withoutProcedureColumnMetaDataAccess().declareParameters(
            		new SqlParameter( "catID_in", Types.BIGINT),
            		new SqlParameter( "subCatName_in", Types.VARCHAR ),
    				new SqlOutParameter("result", Types.INTEGER ));
                   

				
			Map<String, Object> result = new HashMap<String, Object>(2);
			    
			    result.put("catID_in", subCategory.catID);
				result.put("subCatName_in", subCategory.subCatName);
			 
				result = jdbcCall.execute(result);
    			
    			return (Integer) result.get("result");
				
			

         
	}catch(Exception ex)
	{
		String exc=ex.getMessage();
		
		 return 0; 
	}	
        
}
	


public Integer AddProducts(Products products) {
	
	try {
		
		SimpleJdbcCall jdbcCall = new 
            SimpleJdbcCall(dataSource).withProcedureName("AddProduct")
            .withoutProcedureColumnMetaDataAccess().declareParameters(
            		new SqlParameter( "subCatID_in", Types.BIGINT),
            		new SqlParameter( "productName_in", Types.VARCHAR ),
    				new SqlOutParameter("result", Types.INTEGER ));
                   

				
			Map<String, Object> result = new HashMap<String, Object>(2);
			    
			    result.put("subCatID_in", products.subCatID);
				result.put("productName_in", products.productName);
			 
				result = jdbcCall.execute(result);
    			
    			return (Integer) result.get("result");
				
			

         
	}catch(Exception ex)
	{
		String exc=ex.getMessage();
		
		 return 0; 
	}	
        
}


public int DeleteProduct(long productID)    {
	   
	try {	    		
    
		SimpleJdbcCall jdbcCall = new 
                SimpleJdbcCall(dataSource).withProcedureName("DeleteProduct")
                .withoutProcedureColumnMetaDataAccess().declareParameters(
                		new SqlParameter( "productID_in", Types.BIGINT ),		                		
	    				new SqlOutParameter("result", Types.INTEGER ));                     
    				
    			Map<String, Object> result = new HashMap<String, Object>(2);
    				result.put("productID_in", productID);  				
    			 
    				
    			result = jdbcCall.execute(result);
    			
    			return (Integer) result.get("result");		                        	            
    
         
	}catch(Exception ex)
	{
		String exc=ex.getMessage();
		 return 0;  
	}        
     
   

}



}
package com.tcc.vendorsWeb;

import java.io.IOException;




import vendorsDLL.UserDAO;
import vendorsDLL.VendorDAO;
import vendorsModel.Alert;
import vendorsModel.Attachment;
import vendorsModel.Bank;
import vendorsModel.Category;
import vendorsModel.ContactPerson;
import vendorsModel.Products;
import vendorsModel.SubCategory;
import vendorsModel.User;
import vendorsModel.Vendor;
import vendorsModel.VendorBranches;
import vendorsModel.VendorProduct;

import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vendorsBLL.UserManager;




@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	private static final Long CatID = null;

	private static final Long SubCatID = null;
	
	@Autowired
	private ApplicationContext context;


	 
		@RequestMapping(value = "/addUser", method = RequestMethod.GET)
		public String addUser(Map model) {		
			User user = new User();			
			model.put("user", user);			
			
			
			
			return "addUser";
		}
	 
	  @RequestMapping(value = "/addUser" ,method = RequestMethod.POST)
	    public String addUser(@ModelAttribute("userForm") User user,
	            Map<String, Object> model) {		   
		   
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			 UserDAO userDAO = (UserDAO) context.getBean("UserDAO");     	       
	        
		        userDAO.AddUser(user);	        
		   
	
	        return "redirect:home";
	    }
	  
	  
		@RequestMapping(value="/deleteUser/{userID}",method = RequestMethod.GET)
		public ModelAndView deleteUser(@PathVariable long userID){
			
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			 UserDAO userDAO = (UserDAO) context.getBean("UserDAO");     	       
	        
		        userDAO.deleteUser(userID);	        
		   
	
		
			return new ModelAndView("redirect:/home");
		}
		

		@RequestMapping(value = "/login", method = RequestMethod.GET)
		public String loginUser(Map model,@ModelAttribute("alert") Alert alert) {		
			
			
			
			User user = new User();			
			model.put("user", user);
			model.put("alert", alert);
			
			return "login";
		}
	
	  @RequestMapping(value = "/login" ,method = RequestMethod.POST ,params = "Login")
	    public String  loginUser(@ModelAttribute("userForm") User user,
	            Map<String, Object> model,final RedirectAttributes redirectAttributes,HttpSession session) {
	
		  String dd=user.getName();
		   dd=user.getEmail();	   
		   
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			 UserDAO userDAO = (UserDAO) context.getBean("UserDAO");     	       
	        
			 user= userDAO.UserLogin(user.getEmail(),user.getPassword());	        
		   
			if(user.name!=null) {
				user.menu=userDAO.GetUserMenu(user.userTypeID);
				// session=request.getSession(false);
				 session.setAttribute("user", user);				
			
				 if(user.userTypeID==1)// Vendor User
					 return "redirect:VendorHome";
				 else // other Procurement users
					 return "redirect:home";
			}
			else
			{
				Alert alert =new Alert();  
				alert.Visible="show";
				alert.Message="Invalid user name or password ";
						
				redirectAttributes.addFlashAttribute("alert", alert);
			   return "redirect:login";
			}
			
	    }
	  
	  @RequestMapping(value="/logout",method = RequestMethod.GET)
		public ModelAndView logoutUser(HttpSession session){
			
		  session.invalidate();
		    
			return new ModelAndView("redirect:/login");
		}
	  
	  
	  @RequestMapping(value = "/addCategory", method = RequestMethod.GET)
		public ModelAndView addCategory(Map model,HttpSession session) {		
			Category category = new Category();			
			model.put("category", category);
			
			SubCategory SubCategory = new SubCategory();			
			model.put("SubCategory", SubCategory);
			
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");      
			         
					
			model.put("categoryList", vendorDAO.GetAllCategory());
			// user Session 
			 User userSession=(User)session.getAttribute("user");
			 if(userSession==null)
				 return new ModelAndView("redirect:/login");
			 
			 if(!new UserManager().isAuthorised(userSession.menu,"addCategory"))
				 return new ModelAndView("redirect:/login");//UnAuthorised Access of this page 
			 
		        model.put("userSession", userSession);
			
			
			return new ModelAndView("addCategory");
		}
	  
	  @RequestMapping(value = "/addCategory" ,method = RequestMethod.POST,params = "addCategory")
	    public String addCategory(@ModelAttribute("userForm") Category category,
	            Map<String, Object> model) {		   
		   
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			 UserDAO userDAO = (UserDAO) context.getBean("UserDAO");     	       
	        
		        userDAO.AddCategory(category);	        
		     
	
	        return "redirect:addCategory";
	    }
	  @RequestMapping(value = "/addCategory" ,method = RequestMethod.POST,params = "addSubCategory")
	    public String addSubCategory(@ModelAttribute("userForm") SubCategory subCategory,
	            Map<String, Object> model) {		   
		   
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			 UserDAO userDAO = (UserDAO) context.getBean("UserDAO");     	       
	        
		      userDAO.AddSubCategory(subCategory);	        
		     
	
	        return "redirect:addCategory";
	    }
	  
	  
	  @RequestMapping(value = "/addProducts", method = RequestMethod.GET)
		public ModelAndView addProducts(Map model,HttpSession session) {		
		 
		  Products products = new Products();			
			model.put("products", products);
			
			
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");      
			         
					
			model.put("categoryList", vendorDAO.GetAllCategory());
			
			// user Session 
			 User userSession=(User)session.getAttribute("user");
			 if(userSession==null)
				 return new ModelAndView("redirect:/login");
			 if(!new UserManager().isAuthorised(userSession.menu,"addProducts"))
				 return new ModelAndView("redirect:/login");//UnAuthorised Access of this page 
			 
		        model.put("userSession", userSession);
			
			return new ModelAndView("addProducts");
	  
	  
	  
}

	  
	  
	  @RequestMapping(value = "/addProducts" ,method = RequestMethod.POST,params = "addProducts")
	    public String addProducts(@ModelAttribute("userForm") Products products,
	            Map<String, Object> model) {		   
		   
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			 UserDAO userDAO = (UserDAO) context.getBean("UserDAO");     	       
	        
		      userDAO.AddProducts(products);	        
		     
	
	        return "redirect:addProducts";
	    }
	  
	  
	  
		@RequestMapping(value="/DeletProduct/{productID}",method = RequestMethod.GET)
		public ModelAndView DeletProduct(@PathVariable long productID){
			
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			 UserDAO userDAO = (UserDAO) context.getBean("UserDAO");     	       
	        
		        userDAO.DeleteProduct(productID);	        
		   
	
		
			return new ModelAndView("redirect:/addProducts");
		}
		
		  @RequestMapping(value = "/vendorProfile", method = RequestMethod.GET)
			public String vendorProfile(Map model,HttpSession session) {		
			  context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
				VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");         
				
			
				 // user Session 
				 User userSession=(User)session.getAttribute("user");
				 if(userSession==null)
					 return "redirect:/login";
				 
				 /*if(!new UserManager().isAuthorised(userSession.menu,"vendorMain"))
					 retu rn "redirect:/login";//UnAuthorised Access of this page 
	*/					
					
					Vendor vendor =vendorDAO.GetVendorByUserID(userSession.userID);			
					model.put("vendor", vendor);	
					
					     	
					 List<Bank> bankList=vendorDAO.GetBanks(vendor.vendorID);
					 model.put("bankList", bankList);
					 
					 List<VendorProduct> productList=vendorDAO.GetVendorProductByID(vendor.vendorID);
					 model.put("productList", productList);
					 
					 List<ContactPerson> contactList=vendorDAO.GetContactPerson(vendor.vendorID);
					 model.put("contactList", contactList);
					 
					 List<VendorBranches> branchesList=vendorDAO.GetVendorBranchesByID(vendor.vendorID);
					 model.put("branchesList", branchesList);
					 
					 List<Attachment> attachList=vendorDAO.GetAllAttachments(vendor.vendorID);
					 model.put("attachList", attachList);
					
					 
					
				return "vendorProfile";
				
			}
	  
	  
}
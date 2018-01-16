package com.tcc.vendorsWeb;

import java.io.IOException;

import vendorsDLL.SearchVendorsDAO;
import vendorsDLL.UserDAO;
import vendorsDLL.VendorDAO;
import vendorsModel.Alert;
import vendorsModel.Bank;
import vendorsModel.ContactPerson;
import vendorsModel.Menu;
import vendorsModel.SearchVendors;
import vendorsModel.User;
import vendorsModel.Vendor;
import vendorsModel.VendorProduct;
import vendorsModel.VendorType;
import vendorsBLL.UserManager;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;



@Controller
public class VendorController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ApplicationContext context;
	
	
	@RequestMapping(value = "/vendorMain", method = RequestMethod.GET)
	public String vendorMain(Map model,HttpSession session) {		

		
		context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
		VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");         
		model.put("VendorTypeList", vendorDAO.GetAllVendorTypes());
		
		
		 // user Session 
		 User userSession=(User)session.getAttribute("user");
		 if(userSession==null)
			 return "redirect:/login";
		 
		 if(!new UserManager().isAuthorised(userSession.menu,"vendorMain"))
			 return "redirect:/login";//UnAuthorised Access of this page 
		 
		 Vendor vendor =vendorDAO.GetVendorByUserID(userSession.userID);			
			model.put("vendor", vendor);	
			
	        model.put("userSession", userSession);
		
		return "vendorMain";
	}

	

	@RequestMapping(value = "/vendorMain" ,method = RequestMethod.POST)
	    public String vendorMain(@ModelAttribute("vendorForm") Vendor vendor,
	            Map<String, Object> model,HttpSession session) {
	
		  User userSession=(User)session.getAttribute("user");
		  vendor.userID=userSession.userID;
		   
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");     	       
	        
			Long vendorId=vendorDAO.AddVendor(vendor);	
			
			session.setAttribute("vendorId", vendorId);				
		   
	
	        return "redirect:vendorInfo";
	    }
	  
	  @RequestMapping(value = "/search", method = RequestMethod.GET)
		public ModelAndView searchVendors(HttpSession session, Map model , @ModelAttribute("searchResults")SearchVendors searchResults) {		
			List<SearchVendors> searchResultslist = new ArrayList<SearchVendors>();
			SearchVendors searchVendors = new SearchVendors();			
			
			 // user Session 
			 User userSession=(User)session.getAttribute("user");
			 if(userSession==null)
				 return new ModelAndView("redirect:/login");
			 
		        model.put("userSession", userSession);
		        
			
			 ModelAndView model1 = new ModelAndView("search");
			
	        try {
	         
	        	context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
	        	SearchVendorsDAO searchDAO = (SearchVendorsDAO) context.getBean("SearchVendorsDAO");    
	        	
	        	if(searchResults.vendorNameEn!=null) {
	        		 searchResultslist =searchDAO.findVendors(searchResults.vendorNameEn, searchResults.catName, searchResults.subCatName, searchResults.productName);
	        	}else
	        		 searchResultslist =searchDAO.findVendors("tcc", "", "", "");
	        	
	        	 model1.addObject("searchInput", searchVendors);
	        	 model1.addObject("search", searchResultslist);

	        } catch (Exception ex) {
	        	String ss=ex.getMessage();
	    
	        }
	       
	        return model1;
			
		}
		
		@RequestMapping(value = "/search", method = RequestMethod.POST)
	    public String search(@ModelAttribute("searchInput") SearchVendors searchVendors,
	            Map<String, Object> model, final RedirectAttributes redirect) {
	
			redirect.addFlashAttribute("searchResults",searchVendors);
	        return "redirect:search";
	    }



		  
		@RequestMapping(value = "/vendorInfo", method = RequestMethod.GET)
		public String vendorInfo(Map model,HttpSession session) {		
			Bank bank = new Bank();
			model.put("bank", bank);
			
			ContactPerson contactPerson = new ContactPerson();
			model.put("contactPerson", contactPerson);
			
			Long vendorId=(Long)session.getAttribute("vendorId");
			
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");     	
			 List<Bank> bankList=vendorDAO.GetBanks(vendorId);
			 model.put("bankList", bankList);
			
				
			return "vendorInfo";
		}	
		

		@RequestMapping(value = "/vendorInfo" ,method = RequestMethod.POST, params = "AddBank")
		    public String addBank(@ModelAttribute("vendorForm") Bank bank,
		            Map<String, Object> model,HttpSession session) {
		
			  User userSession=(User)session.getAttribute("user");
			
			  Long vendorId=(Long)session.getAttribute("vendorId");
			   
				context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
				VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");     	       
		        
				bank.vendorID=vendorId;
				vendorDAO.AddBank(bank);	        
			   
		
		        return "redirect:vendorInfo";
		    }
		
		@RequestMapping(value = "/vendorInfo" ,method = RequestMethod.POST ,params = "AddPerson")
	    public String addPerson(@ModelAttribute("vendorForm") ContactPerson contactPerson,
	            Map<String, Object> model,HttpSession session) {
	
		  User userSession=(User)session.getAttribute("user");
		
		  Long vendorId=(Long)session.getAttribute("vendorId");
		   
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");     	       
	        
			contactPerson.vendorID=vendorId;
			vendorDAO.AddContactPerson(contactPerson);	        
		   
	
	        return "redirect:vendorInfo";
	    }
		
		
		@RequestMapping(value="/deleteBank/{bankID}",method = RequestMethod.GET)
		public ModelAndView deleteBank(@PathVariable long bankID){
			
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			 VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");     	       
	        
			 vendorDAO.deleteBank(bankID);	        
		   
	
		
			return new ModelAndView("redirect:/vendorInfo");
		}
		
		@RequestMapping(value = "/vendorProduct", method = RequestMethod.GET)
		public String vendorProduct(Map model,HttpSession session) {		

			
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");         
			model.put("categoryList", vendorDAO.GetAllCategory());
			
			VendorProduct vendorProduct= new VendorProduct();
			model.put("vendorProduct", vendorProduct);
			
			 // user Session 
			 User userSession=(User)session.getAttribute("user");
			 if(userSession==null)
				 return "redirect:/login";
			 
			/* if(!new UserManager().isAuthorised(userSession.menu,"vendorMain"))
				 return "redirect:/login";//UnAuthorised Access of this page 
*/			 	
				model.put("userSession", userSession);
			
			return "vendorProduct";
		}	

		@RequestMapping(value = "/subCategory", method = RequestMethod.GET)
		public @ResponseBody String GetSubCategory(@RequestParam("id") Long id) {
			//logger.debug("finding cities for state " + state);
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO"); 
			
			return new Gson().toJson(vendorDAO.GetSubCategory(id));
		}
			
		
}

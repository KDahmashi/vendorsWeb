package com.tcc.vendorsWeb;

import java.io.IOException;

import vendorsDLL.SearchVendorsDAO;
import vendorsDLL.UserDAO;
import vendorsDLL.VendorDAO;
import vendorsModel.Alert;
import vendorsModel.SearchVendors;
import vendorsModel.User;
import vendorsModel.Vendor;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;






@Controller
public class VendorController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ApplicationContext context;
	
	
	@RequestMapping(value = "/vendorMain", method = RequestMethod.GET)
	public String vendorMain(Map model,HttpSession session) {		
		Vendor vendor = new Vendor();			
		model.put("vendor", vendor);			
		
		 // user Session 
		 User userSession=(User)session.getAttribute("user");
		 if(userSession==null)
			 return "redirect:/login";
		 
	        model.put("userSession", userSession);
		
		return "vendorMain";
	}
	
	
	  @RequestMapping(value = "/vendorMain" ,method = RequestMethod.POST)
	    public String vendorMain(@ModelAttribute("vendorForm") Vendor vendor,
	            Map<String, Object> model) {
	
		  vendor.userID=18;
		   
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");     	       
	        
			vendorDAO.AddVendor(vendor);	        
		   
	
	        return "redirect:home";
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


	  @RequestMapping(value = "/login" ,method = RequestMethod.POST ,params = "Login1")
	    public String  loginUser1(@ModelAttribute("userForm") User user,
	            Map<String, Object> model,final RedirectAttributes redirectAttributes,HttpSession session) {
	  
		  return "redirect:addUser";
	  }
		
}

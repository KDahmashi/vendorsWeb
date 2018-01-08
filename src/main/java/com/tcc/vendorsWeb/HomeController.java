package com.tcc.vendorsWeb;

import java.io.IOException;
import java.text.DateFormat;
//import vendorsDLL.*;


import vendorsBLL.*;
import vendorsDLL.SearchVendorsDAO;
import vendorsDLL.UserDAO;
import vendorsDLL.VendorDAO;
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
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

//import javax.activation.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



//import vendorsDLL.*;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ApplicationContext context;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
		
	 @RequestMapping(value= {"/", "/home"})
	    public ModelAndView home(HttpSession session) throws IOException{
		 
		 ModelAndView model = new ModelAndView("home");
		 try {
			 
			 // user Session 
		 User userSession=(User)session.getAttribute("user");
		 if(userSession==null)
			 return new ModelAndView("redirect:/login");
		 
		 
		 
						
		   context= new ClassPathXmlApplicationContext("Spring-Module.xml");				
		   UserDAO customerDAO = (UserDAO) context.getBean("UserDAO");    
	        
	        List<User> listUsers = customerDAO.GetByID(7);
	       
	        model.addObject("userList", listUsers);	     
	        model.addObject("userSession", userSession);
		
	     
	        
		 }catch(Exception ex)
		 {
			 String XX=ex.getMessage();
		 }
	        return model;
	    }
	 
	 @RequestMapping(value= {"/VendorHome"})
	    public ModelAndView VendorHome(HttpSession session) throws IOException{
		 
		 ModelAndView model = new ModelAndView("VendorHome");
		 try {
			 
			 // user Session 
		 User userSession=(User)session.getAttribute("user");
		 if(userSession==null)
			 return new ModelAndView("redirect:/login");
		 
	        model.addObject("userSession", userSession);
		
	     
	        
		 }catch(Exception ex)
		 {
			 String XX=ex.getMessage();
		 }
	        return model;
	    }
	 
		  
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
			public ModelAndView searchVendors(Map model , @ModelAttribute("searchResults")SearchVendors searchResults) {		
				List<SearchVendors> searchResultslist = new ArrayList<SearchVendors>();
				SearchVendors searchVendors = new SearchVendors();			
				
				
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

}

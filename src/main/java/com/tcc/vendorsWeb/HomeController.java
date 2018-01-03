package com.tcc.vendorsWeb;

import java.io.IOException;
import java.text.DateFormat;
//import vendorsDLL.*;


import vendorsBLL.*;
import vendorsDLL.UserDAO;
import vendorsDLL.VendorDAO;
import vendorsModel.Alert;
import vendorsModel.User;
import vendorsModel.Vendor;

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
		 User userSession=(User)session.getAttribute("user");
		 if(userSession!=null) {
						
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");				
		   UserDAO customerDAO = (UserDAO) context.getBean("UserDAO");    
	        
	        List<User> listUsers = customerDAO.GetByID(7);
	       
	        model.addObject("userList", listUsers);
	        model.addObject("username", userSession.name);
		 }
		 else
			 return new ModelAndView("redirect:/login");
	        
		 }catch(Exception ex)
		 {
			 String XX=ex.getMessage();
		 }
	        return model;
	    }
	 
	 
	/*	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
		public String addUser(Map model) {		
			User user = new User();
			user.email="rereree";
			model.put("user", user);			
			
			return "addUser";
		}
	 
	  @RequestMapping(value = "/addUser" ,method = RequestMethod.POST)
	    public String addUser(@ModelAttribute("userForm") User user,
	            Map<String, Object> model) {
	
		  String dd=user.getName();
		   dd=user.getEmail();	   
		   
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			 UserDAO customerDAO = (UserDAO) context.getBean("UserDAO");     	       
	        
		        customerDAO.AddUser(user);	        
		   
	
	        return "home";
	    }
	  
	  
		@RequestMapping(value="/deleteUser/{userID}",method = RequestMethod.GET)
		public ModelAndView deleteUser(@PathVariable long userID){
			
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			 UserDAO customerDAO = (UserDAO) context.getBean("UserDAO");     	       
	        
		        customerDAO.deleteUser(userID);	        
		   
	
		
			return new ModelAndView("redirect:/home");
		}
		

		@RequestMapping(value = "/login", method = RequestMethod.GET)
		public String loginUser(Map model,@ModelAttribute("alert") Alert alert) {		
			
			
			
			User user = new User();			
			model.put("user", user);
			model.put("alert", alert);
			
			return "login";
		}
	
	  @RequestMapping(value = "/login" ,method = RequestMethod.POST)
	    public String  loginUser(@ModelAttribute("userForm") User user,
	            Map<String, Object> model,final RedirectAttributes redirectAttributes) {
	
		  String dd=user.getName();
		   dd=user.getEmail();	   
		   
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			 UserDAO customerDAO = (UserDAO) context.getBean("UserDAO");     	       
	        
			 User user1= customerDAO.UserLogin(user.getEmail(),user.getPassword());	        
		   
			if(user1.name!=null) {
				
				model.put("loggedInUser", user1.name);
				return "redirect:home";
			}
			else
			{
				Alert alert =new Alert();  
				alert.Visible="visible";
				alert.Message="Invalid user name or password ";
						
				redirectAttributes.addFlashAttribute("alert", alert);
			   return "redirect:login";
			}
			
	    }*/
	  
		@RequestMapping(value = "/vendorMain", method = RequestMethod.GET)
		public String vendorMain(Map model) {		
			Vendor vendor = new Vendor();			
			model.put("vendor", vendor);			
			
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
	
	
}

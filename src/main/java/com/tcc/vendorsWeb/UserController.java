package com.tcc.vendorsWeb;

import java.io.IOException;




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


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;




@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
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
				alert.Visible="visible";
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

}

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



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;






@Controller
public class VendorController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ApplicationContext context;


	  @RequestMapping(value = "/login" ,method = RequestMethod.POST ,params = "Login1")
	    public String  loginUser1(@ModelAttribute("userForm") User user,
	            Map<String, Object> model,final RedirectAttributes redirectAttributes,HttpSession session) {
	  
		  return "redirect:addUser";
	  }
		
}

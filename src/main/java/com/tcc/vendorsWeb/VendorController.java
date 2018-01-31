package com.tcc.vendorsWeb;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import vendorsDLL.ApproveVendorDAO;
import vendorsDLL.SearchVendorsDAO;
import vendorsDLL.UserDAO;
import vendorsDLL.VendorDAO;
import vendorsModel.Alert;
import vendorsModel.Attachment;
import vendorsModel.AttachmentType;
import vendorsModel.Bank;
import vendorsModel.VendorBranches;
import vendorsModel.ContactPerson;
import vendorsModel.Menu;
import vendorsModel.SearchVendors;
import vendorsModel.UpdateStatus;
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

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

 
import java.io.File; 




@Controller
public class VendorController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ApplicationContext context;
	
	
	@RequestMapping(value = "/vendorMain", method = RequestMethod.GET)
	public String vendorMain(Map model,HttpSession session, @ModelAttribute("alert") Alert alert) {		

		
		context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
		VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");         
		model.put("VendorTypeList", vendorDAO.GetAllVendorTypes());
		model.put("alert", alert);
		
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
	            Map<String, Object> model,HttpSession session ,final RedirectAttributes redirectAttributes) {
	
		  User userSession=(User)session.getAttribute("user");
		  vendor.userID=userSession.userID;
		   
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");     	       
	        
			Long vendorId=vendorDAO.AddVendor(vendor);	
			 if(vendorId==-2) {
				   Alert alert =new Alert();  
					alert.Visible="show";alert.Message="Vendor is already exist";
					redirectAttributes.addFlashAttribute("alert", alert);
					return "redirect:vendorMain";
			   }
			 
			session.setAttribute("vendorId", vendorId);				   
	
	        return "redirect:vendorInfo";
	    }
	  
	/*                                   Get Search                                                                                   */
	  
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
	        		 searchResultslist =searchDAO.findVendors("", "", "", "");
	        	
	        	 model1.addObject("searchInput", searchVendors);
	        	 model1.addObject("search", searchResultslist);
	        	 
	        	 /*context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
	 			VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO"); 
	 			
	 		
	        	 model1.addObject("jsonList", new Gson().toJson(vendorDAO.GetAllStates(1)));*/
	        	 

	        } catch (Exception ex) {
	        	String ss=ex.getMessage();
	    
	        }
	       
	        return model1;
			
		}
	  
	  /*                                   Redirect to Search page                                                                      */
		
		@RequestMapping(value = "/search", method = RequestMethod.POST)
	    public String search(@ModelAttribute("searchInput") SearchVendors searchVendors,
	            Map<String, Object> model, final RedirectAttributes redirect) {
	
			redirect.addFlashAttribute("searchResults",searchVendors);
	        return "redirect:search";
	    }
		
	/*                                                                                                                                    */
		  
		@RequestMapping(value = "/vendorInfo", method = RequestMethod.GET)
		public String vendorInfo(Map model,HttpSession session, @ModelAttribute("alert") Alert alert) {		
			
			 // user Session 
			 User userSession=(User)session.getAttribute("user");
			 if(userSession==null)
				 return "redirect:/login";
			 
			 if(!new UserManager().isAuthorised(userSession.menu,"vendorMain"))
				 return "redirect:/login";//UnAuthorised Access of this page 
			
			Bank bank = new Bank();
			model.put("bank", bank);
			model.put("userSession", userSession);
			
			ContactPerson contactPerson = new ContactPerson();
			model.put("contactPerson", contactPerson);
			model.put("alert", alert);
			Long vendorId=(Long)session.getAttribute("vendorId");
			
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");     	
			 List<Bank> bankList=vendorDAO.GetBanks(vendorId);
			 model.put("bankList", bankList);
			 
			  
				model.put("countryList", vendorDAO.GetAllCountries());
				VendorBranches branch= new VendorBranches();
				model.put("branch", branch);
			
			 List<ContactPerson> contactPersonList=vendorDAO.GetContactPerson(vendorId);
			 model.put("contactPersonList", contactPersonList);
			 
			 List<VendorBranches> branchList=vendorDAO.GetVendorBranchesByID(vendorId);
			 model.put("BrancheList", branchList);
				
			return "vendorInfo";
		}	
		

		@RequestMapping(value = "/vendorInfo" ,method = RequestMethod.POST, params = "AddBank")
		    public String addBank(@ModelAttribute("vendorForm") Bank bank,
		            Map<String, Object> model,HttpSession session ,final RedirectAttributes redirectAttributes) {
		
			  User userSession=(User)session.getAttribute("user");
			
			  Long vendorId=(Long)session.getAttribute("vendorId");
			   
				context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
				VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");     	       
		        
				bank.vendorID=vendorId;
				int result=vendorDAO.AddBank(bank);	   
				if(result==-2) {
					   Alert alert =new Alert();  
						alert.Visible="show";alert.Message="Bank is already exist";
						redirectAttributes.addFlashAttribute("alert", alert);
						return "redirect:vendorInfo";
				   }
			   
		
		        return "redirect:vendorInfo";
		    }
		
		@RequestMapping(value = "/vendorInfo" ,method = RequestMethod.POST ,params = "AddPerson")
	    public String addPerson(@ModelAttribute("vendorForm") ContactPerson contactPerson,
	            Map<String, Object> model,HttpSession session ,final RedirectAttributes redirectAttributes) {
	
		  User userSession=(User)session.getAttribute("user");
		
		  Long vendorId=(Long)session.getAttribute("vendorId");
		   
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");     	       
	        
			contactPerson.vendorID=vendorId;
			int result=vendorDAO.AddContactPerson(contactPerson);	        
			if(result==-2) {
				   Alert alert =new Alert();  
					alert.Visible="show";alert.Message="Person is already exist";
					redirectAttributes.addFlashAttribute("alert", alert);
					return "redirect:vendorInfo";
			   }
	
	        return "redirect:vendorInfo";
	    }
		
/*                                   Approve Button And Update Status                                                                                   */
		
		@RequestMapping(value = "/approve", method = RequestMethod.POST, params="approve" )
	    public String approve(@ModelAttribute("aprooveInput") UpdateStatus approveVendors,
	            Map<String, Object> model, final RedirectAttributes redirect, HttpSession session ,@RequestParam(value="id", required=false) long vendorID ) {
			
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			  VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO"); 
			  UpdateStatus update = new UpdateStatus();
			  ModelAndView model1 = new ModelAndView("approve");
			
				 // user Session 
				 User userSession=(User)session.getAttribute("user");
				 if(userSession==null)
					 return "redirect:/login";
				 
				 if(!new UserManager().isAuthorised(userSession.menu,"search"))
					 return "redirect:/login";//UnAuthorised Access of this page 
				 
				   vendorDAO.UpdatStatus(vendorID, 1, approveVendors.comment);
				   model1.addObject("aprooveInput", vendorDAO);
					
	        return "redirect:/search";
	        
	    }
		
		/*                                   Reject Button And Update Status                                                                                   */
		
		@RequestMapping(value = "/approve", method = RequestMethod.POST, params="reject" )
	    public String reject(@ModelAttribute("aprooveInput") UpdateStatus approveVendors,
	            Map<String, Object> model, final RedirectAttributes redirect, HttpSession session , @RequestParam(value="id", required=false) long vendorID ) {
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			  VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO"); 
			  UpdateStatus update = new UpdateStatus();
			  ModelAndView model1 = new ModelAndView("approve");
			  
				
				 // user Session 
				 User userSession=(User)session.getAttribute("user");
				 if(userSession==null)
					 return "redirect:/login";
				 
				 if(!new UserManager().isAuthorised(userSession.menu,"search"))
					 return "redirect:/login";//UnAuthorised Access of this page 
				 
				   vendorDAO.UpdatStatus(vendorID, 0, approveVendors.comment);			
				   model1.addObject("aprooveInput", vendorDAO);
				   return "redirect:/search";
	    }
	  
		/*                                   Approve single vendor page                                                                                   */
		  @RequestMapping(value = "/approve", method = RequestMethod.GET)
			public String approveVendors(Map model,HttpSession session, @RequestParam(value="id", required=false) long vendorID) {		
			  context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			  ApproveVendorDAO approveVendorDAO = (ApproveVendorDAO) context.getBean("ApproveVendorDAO");         
				
			
				 // user Session 
				 User userSession=(User)session.getAttribute("user");
				 if(userSession==null)
					 return "redirect:/login";
				 
				 if(!new UserManager().isAuthorised(userSession.menu,"search"))
					 return "redirect:/login";//UnAuthorised Access of this page 
				 
				   Vendor vendor =approveVendorDAO.GetVendorByID(vendorID);			
					model.put("vendor", vendor);	
					
					context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
					VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");     	
					 List<Bank> bankList=vendorDAO.GetBanks(vendorID);
					 model.put("bankList", bankList);
					 
					 List<VendorProduct> productList=vendorDAO.GetVendorProductByID(vendorID);
					 model.put("productList", productList);
					 
					 List<ContactPerson> contactList=vendorDAO.GetContactPerson(vendorID);
					 model.put("contactList", contactList);
					 
					 List<VendorBranches> branchesList=vendorDAO.GetVendorBranchesByID(vendorID);
					 model.put("branchesList", branchesList);
					 
					 List<Attachment> attachList=vendorDAO.GetAllAttachments(vendorID);
					 model.put("attachList", attachList);
					
					 UpdateStatus update = new UpdateStatus();
					 model.put("update", update);
					
					 model.put("userSession", userSession);
					 
				return "approve";
				
			}
		  
		 /* 		 /*                                                                                                                                     */
		@RequestMapping(value="/deleteBank/{bankID}",method = RequestMethod.GET)
		public ModelAndView deleteBank(@PathVariable long bankID){
			
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			 VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");     	       
	        
			 vendorDAO.deleteBank(bankID);	        
		   
	
		
			return new ModelAndView("redirect:/vendorInfo");
		}
		@RequestMapping(value="/deleteContactPerson/{contactPersonID}",method = RequestMethod.GET)
		public ModelAndView deleteContactPerson(@PathVariable long contactPersonID){
			
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			 VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");     	       
	        
			 vendorDAO.deleteContactPerson(contactPersonID);	        
		   
	
		
			return new ModelAndView("redirect:/vendorInfo");
		}		
		
		@RequestMapping(value = "/vendorProduct", method = RequestMethod.GET)
		public String vendorProduct(Map model,HttpSession session,@ModelAttribute("alert") Alert alert) {		

			
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");         
			model.put("categoryList", vendorDAO.GetAllCategory());
			
			VendorProduct vendorProduct= new VendorProduct();
			model.put("vendorProduct", vendorProduct);
			
			 // user Session 
			 User userSession=(User)session.getAttribute("user");
			 if(userSession==null)
				 return "redirect:/login";
			 
			 if(!new UserManager().isAuthorised(userSession.menu,"vendorMain"))
				 return "redirect:/login";//UnAuthorised Access of this page 
			 
			 	 Long vendorId=(Long)session.getAttribute("vendorId");
			List<VendorProduct> productList= vendorDAO.GetVendorProductByID(vendorId);
			 model.put("productList", productList);
			 
				List<AttachmentType> attachmentTypeList= vendorDAO.GetAttachmentTypes();
				model.put("attachmentTypeList", attachmentTypeList);
				
				List<Attachment> attachmentList= vendorDAO.GetAllAttachments(vendorId);
				model.put("attachmentList", attachmentList);
			 
				model.put("userSession", userSession);				
				model.put("alert",alert);
			return "vendorProduct";
		}	

		@RequestMapping(value = "/GetSubCategory", method = RequestMethod.GET)
		public @ResponseBody String GetSubCategory(@RequestParam("id") Long id) {
			//logger.debug("finding cities for state " + state);
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO"); 
			
			return new Gson().toJson(vendorDAO.GetSubCategory(id));
		}		
		@RequestMapping(value = "/GetProducts", method = RequestMethod.GET)
		public @ResponseBody String Getproducts(@RequestParam("id") Long id) {
			//logger.debug("finding cities for state " + state);
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO"); 
			
			return new Gson().toJson(vendorDAO.GetProducts(id));
		}	
		
		@RequestMapping(value = "/vendorProduct" ,method = RequestMethod.POST, params = "vendorProduct")
	    public String addVendorProduct(@ModelAttribute("vendorForm") VendorProduct vendorProduct,
	            Map<String, Object> model,HttpSession session,RedirectAttributes redirectAttributes) {
			
	
		  User userSession=(User)session.getAttribute("user");
		
		  Long vendorId=(Long)session.getAttribute("vendorId");
		   
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");     	       
	        
			vendorProduct.vendorID=vendorId;
			int result=vendorDAO.AddVendorProduct(vendorProduct);	        
			if(result==-2) {
				   Alert alert =new Alert();  
					alert.Visible="show";alert.Message="this Product is already exist";
					redirectAttributes.addFlashAttribute("alert", alert);
					return "redirect:vendorProduct";
			   }
	
	        return "redirect:vendorProduct";
	    }
		@RequestMapping(value="/deleteProduct/{vendorProductID}",method = RequestMethod.GET)
		public ModelAndView deleteProduct(@PathVariable long vendorProductID){
			
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			 VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");     	       
	        
			 vendorDAO.DeleteVendorProduct(vendorProductID);	   
		
			return new ModelAndView("redirect:/vendorProduct");
		}
		@RequestMapping(value = "/GetAllStates", method = RequestMethod.GET)
		public @ResponseBody String GetAllStates(@RequestParam("id") Integer id) {
			//logger.debug("finding cities for state " + state);
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO"); 
			
			return new Gson().toJson(vendorDAO.GetAllStates(id));
		}	
		@RequestMapping(value = "/GetAllCities", method = RequestMethod.GET)
		public @ResponseBody String GetAllCities(@RequestParam("id") Integer id) {
			//logger.debug("finding cities for state " + state);
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO"); 
			
			return new Gson().toJson(vendorDAO.GetAllCities(id));
		}	
		
		@RequestMapping(value = "/vendorInfo" ,method = RequestMethod.POST, params = "branch")
	    public String addBranch(@ModelAttribute("vendorForm") VendorBranches branch,
	            Map<String, Object> model,HttpSession session ,RedirectAttributes redirectAttributes) {
	

			  User userSession=(User)session.getAttribute("user");
			
			  Long vendorId=(Long)session.getAttribute("vendorId");
			   
				context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
				VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");     	       
		        
				branch.vendorID=vendorId;
				int result=vendorDAO.AddBranch(branch);	        
				if(result==-2) {
					   Alert alert =new Alert();  
						alert.Visible="show";alert.Message="branch is already exist";
						redirectAttributes.addFlashAttribute("alert", alert);
						return "redirect:vendorInfo";
				   }
		
		        return "redirect:vendorInfo";
	    }
		
		
		@RequestMapping(value="/deleteBranches/{branchesID}",method = RequestMethod.GET)
		public ModelAndView deleteBranches(@PathVariable long branchesID){
			
			context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
			 VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");     	       
	        
			 vendorDAO.DeleteVendorBranches(branchesID);	   
		
			return new ModelAndView("redirect:/vendorInfo");
		}
	

		 @RequestMapping(value="/uploadStatus",method=RequestMethod.POST)
		    public String uploadStatus() {
		        return "uploadStatus";
		    }
		 
		    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
		    public String handleFormUpload(@RequestParam("name") String fileName, @RequestParam("typeID") int TypeID,
		        @RequestParam("file") MultipartFile file,RedirectAttributes redirectAttributes,HttpSession session) {

		    	
		    	   if (file.isEmpty()) {

						Alert alert =new Alert();  
						alert.Visible="show";alert.Message="Please select a file to upload";
			            redirectAttributes.addFlashAttribute("alert",alert );
			            return "redirect:vendorProduct";
			        }
		        if (!file.isEmpty()) {	
		        	 context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
		  			 VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");     
		  			 
		        	   try {
		        		   String name=file.getOriginalFilename();		        		
		        		   
		        		   ServletContext context = session.getServletContext();  	
		        		   Long vendorId=(Long)session.getAttribute("vendorId");
		        		   String folderName="vendor"+String.valueOf(vendorId);
		        		   
			                   /* File path = new File(context.getRealPath("/WEB-INF/uploads") + File.separator +
				                        file.getOriginalFilename());  */
			                    
			                    String directory = context.getRealPath("/resources/uploads") + File.separator +folderName;   
						if (!new File(directory).exists())
							new File(directory).mkdirs();
						
						File path = new File(directory +File.separator + fileName+ '.'+ name.substring(name.lastIndexOf(".") + 1));  

		       		    byte[] bytes = file.getBytes();  
		       		    BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(path));  
		       		    stream.write(bytes);  
		       		    stream.flush();  
		       		    stream.close();  
		       		    
		       		 Attachment attachment=new Attachment();
		       		attachment.vendorID=vendorId;
		       		attachment.attachmentTypeID=TypeID;
		       		attachment.fileName= "resources/uploads/"+folderName+ '/'+fileName + '.'+ name.substring(name.lastIndexOf(".") + 1) ;
		       		
		       		 vendorDAO.AddAttachment(attachment);	
				            redirectAttributes.addFlashAttribute("message",
				                        "You successfully uploaded '" + file.getOriginalFilename() + "'");

				        } catch (IOException e) {
				            e.printStackTrace();
				        }
		        	   
		        		       
		  	        
		  			   
		        	
		           return "redirect:vendorProduct";
		       } else {
		           return "redirect:vendorProduct";
		       }
		    }
		    @RequestMapping(value = "/vendorProduct" ,method = RequestMethod.POST, params = "completeProfile")
		    public String completeProfile(HttpSession session) {
		
			  User userSession=(User)session.getAttribute("user");
			
			  Long vendorId=(Long)session.getAttribute("vendorId");
			   
				context= new ClassPathXmlApplicationContext("Spring-Module.xml");		
				VendorDAO vendorDAO = (VendorDAO) context.getBean("VendorDAO");     	       
		        
				
				  vendorDAO.UpdatStatus(vendorId, 3, "Your profile is successfully submitted and it is under review ");	        
			   
		
		        return "redirect:VendorHome";
		    }

}

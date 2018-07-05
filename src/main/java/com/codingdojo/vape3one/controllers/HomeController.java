package com.codingdojo.vape3one.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.vape3one.models.Item;
import com.codingdojo.vape3one.models.User;
import com.codingdojo.vape3one.services.ItemService;
import com.codingdojo.vape3one.services.UserService;
import com.codingdojo.vape3one.validator.UserValidator;

@Controller
public class HomeController {
	private final ItemService itemService;
	private final UserValidator userValidator;
	private final UserService userService;
	
	public HomeController(ItemService itemService, UserValidator userValidator, UserService userService) {
		this.itemService = itemService;
		this.userService = userService;
		this.userValidator = userValidator;
	}
	
////////////////////for login and registration/////////////////////////////
	@RequestMapping("/registration")
    public String registerForm(@ModelAttribute("user") User user) {
        return "views/registrationPage.jsp";
    }
	
//	for adminregistration
	@RequestMapping("/registrationadmin")
    public String registerFormAdmin(@ModelAttribute("user") User user) {
        return "views/registrationPageAdmin.jsp";
    }
	
    @RequestMapping("/login")
    public String login() {
        return "views/loginPage.jsp";
    }
    
    @RequestMapping(value="/registrationadmin", method=RequestMethod.POST)
    public String registerAdmin(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
        userValidator.validate(user, result);
        if(result.hasErrors()) {
            return "views/registrationPageAdmin.jsp";
        } else {
        	if(user.getAdminCode().equals("iamawesome")) {
        		user.setIsAdmin("yes");
        		session.setAttribute("isadmin", "yes");
        	}
        	
        	User u = userService.registerUser(user);
            session.setAttribute("userId", u.getId());
            session.setAttribute("isLoggedIn", "yes");
            return "redirect:/";    	  	
        }    
    }
    
    @RequestMapping(value="/registration", method=RequestMethod.POST)
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
        userValidator.validate(user, result);
        if(result.hasErrors()) {
            return "views/registrationPage.jsp";
        }
        User u = userService.registerUser(user);
        session.setAttribute("userId", u.getId());
        session.setAttribute("isLoggedIn", "yes");
        return "redirect:/";
    }
    
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {
        boolean isAuthenticated = userService.authenticateUser(email,  password);
        if(isAuthenticated) {
        	User u = userService.findByEmail(email);
        	session.setAttribute("userId", u.getId());
        	session.setAttribute("isLoggedIn", "yes");
        	System.out.println("isadmin = " + u.getIsAdmin());
        	String user1 = u.getIsAdmin();    	
        	if(user1 != null) {
        		session.setAttribute("isadmin", "yes");
            	System.out.println("usersession isadmin = " + session.getAttribute("isadmin"));
        		return "views/index.jsp";
        	} else {
        		System.out.println("usersession isadmin = " + session.getAttribute("isadmin"));
        		return "views/index.jsp";
        	}
        } else {
        	model.addAttribute("error", "Invalid Credentials. Please try again.");
        	return "views/loginPage.jsp";
        }
    }
    
 
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
        // invalidate session
        // redirect to login page
    }
	
	
	
	
	
	
	
	

	@RequestMapping("/")
	public String index(Model model, HttpSession session) {
		return ("views/index.jsp");
	}
	
	@RequestMapping("/admin")
	public String adminPage(HttpSession session) {
    	
		System.out.println("isloggedin: " + session.getAttribute("isLoggedIn") + ", and isAdmin: " + session.getAttribute("isadmin"));
		if(session.getAttribute("isadmin") != null) {
			return ("views/admin.jsp");	
		} else {
			return "redirect:/";
		}
		
		
		
	}
	
	
	@RequestMapping("/eliquids")
	public String eliquid(Model model) {
		List<Item> alleliquids = itemService.getAllItems("eliquid");
		model.addAttribute("alleliquids", alleliquids);
		return ("views/eliquidshop.jsp");
	}
	
	@RequestMapping("/devices")
	public String showAllDevices(Model model) {
		List<Item> alldevices = itemService.getAllItems("device");
		model.addAttribute("alldevices", alldevices);
		return ("views/deviceshop.jsp");
	}
	
	@RequestMapping("/tanks")
	public String showAllTanks(Model model) {
		List<Item> alltanks = itemService.getAllItems("tank");
		model.addAttribute("alltanks", alltanks);
		return ("views/tanksshop.jsp");
	}

	@RequestMapping("/accessories")
	public String showAllAccessories(Model model) {
		List<Item> allaccessories = itemService.getAllItems("accessory");
		model.addAttribute("allaccessories", allaccessories);
		return ("views/accessoryshop.jsp");
	}
	
	@RequestMapping("/sales")
	public String showAllSales(Model model, HttpSession session) {
		List<Item> allsales = itemService.getAllSaleItems("yes");
		model.addAttribute("allsales", allsales);
		model.addAttribute("amiadmin", session.getAttribute("isadmin"));
		return ("views/saleshop.jsp");
	}
	

//MAKE SURE THAT YOU HAVE AN ADMIT VALIDATION THAT THE USER CAN ONLY GO TO THIS LINK IF THEYRE THE ADMIN.	
	@RequestMapping("/newdevice")
	public String newDevice(@ModelAttribute("device") Item item, HttpSession session) {
		if(session.getAttribute("isadmin") == "yes") {
		return ("views/newDevice.jsp");
		} else {
			return "redirect:/";
		}
	}
	
	@RequestMapping("/new")
	public String newitem(@ModelAttribute("item") Item item, HttpSession session) {
		if(session.getAttribute("isadmin") == "yes") {
		return ("views/newitem.jsp");
		} else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/newitem", method=RequestMethod.POST)
	public String createNewItem(@Valid @ModelAttribute("item") Item item, BindingResult result) {
		if(result.hasErrors()) {
			System.out.println("error adding a new item");
			return("/views/newitem.jsp");
		} else {
			itemService.createItem(item);
			System.out.println("Successfully added a new item");
			return "redirect:/admin";
		}
	}
	
	
	@RequestMapping(value="/newdevice", method=RequestMethod.POST)
	public String createNewDevice(@Valid @ModelAttribute("device") Item item, BindingResult result) {
		if(result.hasErrors()) {
			System.out.println("error adding a new item");
			return("/views/newDevice.jsp");
		} else {
			itemService.createNewDevice(item);
			System.out.println("Successfully added a new item(device)");
			return "redirect:/admin";
		}
	}
		
	
	@RequestMapping("/sales/{itemtype}")
    public String saleItem(@PathVariable("itemtype") String itemtype1, Model model) {
	 	List<Item> allsales = itemService.getSaleItems(itemtype1);
		model.addAttribute("allsales", allsales);
		return ("views/saleshop.jsp");
    }
	
	
	@RequestMapping("/accessories/{accessorytype}")
    public String accessoryType(@PathVariable("accessorytype") String accessorytype1, Model model) {
	 	List<Item> allaccessories = itemService.getAccessoryItems(accessorytype1);
		model.addAttribute("allaccessories", allaccessories);
		return ("views/accessoryshop.jsp");
    }
	
	@RequestMapping("/items/{id}")
	public String showItem(Model model, @PathVariable("id") Long id, HttpSession session) {
		Item item = itemService.getItem(id);
		model.addAttribute("showitem", item);
		model.addAttribute("amiadmin", session.getAttribute("isadmin"));
		return ("views/showItem.jsp");
	}
	
	
	
	
}

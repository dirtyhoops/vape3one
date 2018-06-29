package com.codingdojo.vape3one.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.vape3one.models.Item;
import com.codingdojo.vape3one.services.ItemService;

@Controller
public class HomeController {
	private final ItemService itemService;
	
	public HomeController(ItemService itemService) {
		this.itemService = itemService;
	}

	@RequestMapping("/")
	public String index() {
		return ("views/index.jsp");
	}
	
	@RequestMapping("/admin")
	public String adminPage() {
		return ("views/admin.jsp");
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
	public String showAllSales(Model model) {
		List<Item> allsales = itemService.getAllSaleItems("yes");
		model.addAttribute("allsales", allsales);
		return ("views/saleshop.jsp");
	}
	

//MAKE SURE THAT YOU HAVE AN ADMIT VALIDATION THAT THE USER CAN ONLY GO TO THIS LINK IF THEYRE THE ADMIN.	
	@RequestMapping("/newdevice")
	public String newDevice(@ModelAttribute("device") Item item) {
		return ("views/newDevice.jsp");
	}
	
	@RequestMapping("/new")
	public String newitem(@ModelAttribute("item") Item item) {
		return ("views/newitem.jsp");
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
	public String showItem(Model model, @PathVariable("id") Long id) {
		Item item = itemService.getItem(id);
		model.addAttribute("showitem", item);
		return ("views/showItem.jsp");
	}
	
	
	
	
}

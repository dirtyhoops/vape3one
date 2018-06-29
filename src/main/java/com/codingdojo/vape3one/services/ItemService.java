package com.codingdojo.vape3one.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.vape3one.models.Item;
import com.codingdojo.vape3one.repositories.ItemRepo;

@Service
public class ItemService {
	private final ItemRepo itemRepo;
	
	public ItemService(ItemRepo itemRepo) {
		this.itemRepo = itemRepo;
	}
	
	//get all items
	public List<Item> getAllItem() {
		return itemRepo.findAll();
	}
	
	//create eliquid juice
	public Item createItem(Item i) {
		return itemRepo.save(i);
	}
	
	//create device
	public Item createNewDevice(Item i) {
		return itemRepo.save(i);
	}
	
	//get all devices
	public List<Item> getAllItems(String type) {
		return (List<Item>) itemRepo.getAllItems(type);
	}
	
	//get all devices
	public List<Item> getAllSaleItems(String isitsale) {
		return (List<Item>) itemRepo.getAllSales(isitsale);
	}
		
	//get all sales item depends on the type
	public List<Item> getSaleItems(String type) {
		return (List<Item>) itemRepo.getSaleItems(type);
	}
	
	//get all accessory depends on the accessorytype
	public List<Item> getAccessoryItems(String accessorytype) {
		return (List<Item>) itemRepo.getAccessoryItems(accessorytype);
	}
	
	//get an item
	public Item getItem(Long id) {
		Optional<Item> i = itemRepo.findById(id);
		if(i.isPresent()) {
			return i.get();	
		} else {
			return null;
		}
		
		
	}

	

	
}

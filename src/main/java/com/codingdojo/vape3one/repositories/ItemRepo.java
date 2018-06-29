package com.codingdojo.vape3one.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.codingdojo.vape3one.models.Item;

public interface ItemRepo extends CrudRepository<Item, Long> {
	List<Item> findAll();
	
	@Query(value="SELECT * FROM items WHERE type = ?1", nativeQuery=true)
	List<Item> getAllItems(String type);
	
	
	
	@Query(value="SELECT * FROM items WHERE isitsale = ?1", nativeQuery=true)
	List<Item> getAllSales(String isitsale);
	
	@Query(value="SELECT * FROM items WHERE isitsale='yes' AND type = ?1", nativeQuery=true)
	List<Item> getSaleItems(String type);
	
	@Query(value="SELECT * FROM items WHERE type='accessory' and accessorytype = ?1", nativeQuery=true)
	List<Item> getAccessoryItems(String accessorytype);
	
//	@Query(value="SELECT * from items WHERE isitsale='yes' ORDER BY price ASC")
//	List<Item> getSaleItemsPriceASC()
//	
}

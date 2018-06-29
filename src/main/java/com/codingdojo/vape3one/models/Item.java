package com.codingdojo.vape3one.models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="items")
public class Item {
	@Id
	@GeneratedValue()
	private Long id;
	
	@Size(min=1, message="name can't be empty")
	private String name;
	
	private String brand;
	
	@Size(min=1, message="type can't be empty")
	private String type;
	
//	make sure this allows more than 255 characters
	@Size(min=1, message="description can't be empty")
	private String description;
	
//	going to change this to many images later
	@Size(min=1, message="image can't be empty")
	private String image;
	
	@Min((long) 0.01)
	private double price;
	
	private int quantity;
	
	private String isitsale;
	
	private String categories;

	private String image1;
	private String image2;
	private String image3;
	private String image4;
	private String image5;
	private String image6;
	private String image7;
	private String resistance;
	private String accessorytype;
	
//	it's not a must so there's no validation it can be empty if the item is not a liquid
	private String flavor;
	

	@DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
	private Date created_at;
	@DateTimeFormat(pattern = "MM/dd/yyyy HH:mm:ss")
	private Date updated_at;
	
	public Item() {
		
	}

	

	public Item(Long id, @Size(min = 1, message = "name can't be empty") String name, String brand,
			@Size(min = 1, message = "type can't be empty") String type,
			@Size(min = 1, message = "description can't be empty") String description,
			@Size(min = 1, message = "image can't be empty") String image, @Min(0) double price, int quantity,
			String isitsale, String categories, String image1, String image2, String image3, String image4,
			String image5, String image6, String image7, String resistance, String accessorytype, String flavor,
			Date created_at, Date updated_at) {
		super();
		this.id = id;
		this.name = name;
		this.brand = brand;
		this.type = type;
		this.description = description;
		this.image = image;
		this.price = price;
		this.quantity = quantity;
		this.isitsale = isitsale;
		this.categories = categories;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
		this.image4 = image4;
		this.image5 = image5;
		this.image6 = image6;
		this.image7 = image7;
		this.resistance = resistance;
		this.accessorytype = accessorytype;
		this.flavor = flavor;
		this.created_at = created_at;
		this.updated_at = updated_at;
	}



	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	public String getImage4() {
		return image4;
	}

	public void setImage4(String image4) {
		this.image4 = image4;
	}

	public String getImage5() {
		return image5;
	}

	public void setImage5(String image5) {
		this.image5 = image5;
	}

	public String getImage6() {
		return image6;
	}

	public void setImage6(String image6) {
		this.image6 = image6;
	}

	public String getImage7() {
		return image7;
	}

	public void setImage7(String image7) {
		this.image7 = image7;
	}

	public String getResistance() {
		return resistance;
	}

	public void setResistance(String resistance) {
		this.resistance = resistance;
	}


	@PrePersist
	protected void onCreate(){
		this.created_at = new Date();
	}
	
	@PreUpdate
	protected void onUpdate(){
	    this.updated_at = new Date();
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public String getCategories() {
		return categories;
	}








	public void setCategories(String categories) {
		this.categories = categories;
	}








	public void setImage(String image) {
		this.image = image;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getIsitsale() {
		return isitsale;
	}

	public void setIsitsale(String isitsale) {
		this.isitsale = isitsale;
	}

	public String getFlavor() {
		return flavor;
	}

	public void setFlavor(String flavor) {
		this.flavor = flavor;
	}

	public double getPrice() {
		return price;
	}
	
	public void setPrice(double price) {
		this.price = price;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public Date getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}

	public String getAccessorytype() {
		return accessorytype;
	}

	public void setAccessorytype(String accessorytype) {
		this.accessorytype = accessorytype;
	}
	
	
	

}

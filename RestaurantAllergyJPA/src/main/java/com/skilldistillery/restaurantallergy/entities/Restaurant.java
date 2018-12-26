package com.skilldistillery.restaurantallergy.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Restaurant {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String name;
	@Column(name="price_range")
	private Integer priceRange;
	@Column(name="store_number")
	private String storeNumber;
	private String phone;
	private String website;
	@Column(name="date_created")
	private Date dateCreated;
	private Boolean active;
	
	/*
	 * getters / setters
	 */
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Integer getPriceRange() {
		return priceRange;
	}
	public void setPriceRange(Integer priceRange) {
		this.priceRange = priceRange;
	}
	
	public String getStoreNumber() {
		return storeNumber;
	}
	public void setStoreNumber(String storeNumber) {
		this.storeNumber = storeNumber;
	}
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	
	public Date getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}
	
	public Boolean getActive() {
		return active;
	}
	public void setActive(Boolean active) {
		this.active = active;
	}
	
	/*
	 * hashCode / equals
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Restaurant other = (Restaurant) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	/*
	 * toString
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Restaurant [id=").append(id)
				.append(", name=").append(name)
				.append(", priceRange=").append(priceRange)
				.append(", storeNumber=").append(storeNumber)
				.append(", phone=").append(phone)
				.append(", website=").append(website)
				.append(", dateCreated=").append(dateCreated)
				.append(", active=").append(active)
				.append("]");
		return builder.toString();
	}
	
	/*
	 * constructors
	 */
	public Restaurant() {
		super();
	}
	
	public Restaurant(int id, String name, Integer priceRange, String storeNumber, String phone, String website,
			Date dateCreated, Boolean active) {
		super();
		this.id = id;
		this.name = name;
		this.priceRange = priceRange;
		this.storeNumber = storeNumber;
		this.phone = phone;
		this.website = website;
		this.dateCreated = dateCreated;
		this.active = active;
	}
	
}

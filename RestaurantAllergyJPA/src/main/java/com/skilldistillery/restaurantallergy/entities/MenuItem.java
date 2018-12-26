package com.skilldistillery.restaurantallergy.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class MenuItem {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String category;
	private String title;
	private String description;
	private String price;
	private Integer calories;
	@Column(name="cooking_process")
	private String cookingProcess;
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
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	public Integer getCalories() {
		return calories;
	}
	public void setCalories(Integer calories) {
		this.calories = calories;
	}
	
	public String getCookingProcess() {
		return cookingProcess;
	}
	public void setCookingProcess(String cookingProcess) {
		this.cookingProcess = cookingProcess;
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
		MenuItem other = (MenuItem) obj;
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
		builder.append("MenuItem [id=").append(id)
				.append(", category=").append(category)
				.append(", title=")
				.append(title)
				.append(", description=").append(description)
				.append(", price=").append(price)
				.append(", calories=").append(calories)
				.append(", cookingProcess=").append(cookingProcess)
				.append(", active=").append(active)
				.append("]");
		return builder.toString();
	}
	
	/*
	 * constructors
	 */
	public MenuItem() {
		super();
	}
	
	public MenuItem(int id, String category, String title, String description, String price, Integer calories,
			String cookingProcess, Boolean active) {
		super();
		this.id = id;
		this.category = category;
		this.title = title;
		this.description = description;
		this.price = price;
		this.calories = calories;
		this.cookingProcess = cookingProcess;
		this.active = active;
	}
	
}

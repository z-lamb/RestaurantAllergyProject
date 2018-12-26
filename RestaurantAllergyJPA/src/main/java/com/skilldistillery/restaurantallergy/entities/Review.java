package com.skilldistillery.restaurantallergy.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Review {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String text;
	private String rating;
	@Column(name="date_created")
	private Date dateCreated;
	private Integer useful;
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
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	
	public Date getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}
	
	public Integer getUseful() {
		return useful;
	}
	public void setUseful(Integer useful) {
		this.useful = useful;
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
		Review other = (Review) obj;
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
		builder.append("Review [id=").append(id)
				.append(", text=").append(text)
				.append(", rating=").append(rating)
				.append(", dateCreated=").append(dateCreated)
				.append(", useful=").append(useful)
				.append(", active=").append(active)
				.append("]");
		return builder.toString();
	}
	
	/*
	 * constructors
	 */
	public Review() {
		super();
	}
	
	public Review(int id, String text, String rating, Date dateCreated, Integer useful, Boolean active) {
		super();
		this.id = id;
		this.text = text;
		this.rating = rating;
		this.dateCreated = dateCreated;
		this.useful = useful;
		this.active = active;
	}
	
}

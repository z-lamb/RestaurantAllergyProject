package com.skilldistillery.restaurantallergy.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class GoodFor {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(name="good_for")
	private String goodFor;
	
	/*
	 * getters / setters
	 */
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGoodFor() {
		return goodFor;
	}
	public void setGoodFor(String goodFor) {
		this.goodFor = goodFor;
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
		GoodFor other = (GoodFor) obj;
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
		builder.append("GoodFor [id=").append(id)
				.append(", goodFor=").append(goodFor)
				.append("]");
		return builder.toString();
	}
	
	/*
	 * constructors
	 */
	public GoodFor() {
		super();
	}
	public GoodFor(int id, String goodFor) {
		super();
		this.id = id;
		this.goodFor = goodFor;
	}
	
	
}

package com.skilldistillery.restaurantallergy.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Delivery {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private Double fee;
	private Double min;
	private Integer time;
	
	/*
	 * getters / setters
	 */
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public Double getFee() {
		return fee;
	}
	public void setFee(Double fee) {
		this.fee = fee;
	}
	
	public Double getMin() {
		return min;
	}
	public void setMin(Double min) {
		this.min = min;
	}
	
	public Integer getTime() {
		return time;
	}
	public void setTime(Integer time) {
		this.time = time;
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
		Delivery other = (Delivery) obj;
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
		builder.append("Delivery [id=").append(id)
				.append(", fee=").append(fee)
				.append(", min=").append(min)
				.append(", time=").append(time)
				.append("]");
		return builder.toString();
	}
	
	/*
	 * constructors
	 */
	public Delivery() {
		super();
	}
	public Delivery(int id, Double fee, Double min, Integer time) {
		super();
		this.id = id;
		this.fee = fee;
		this.min = min;
		this.time = time;
	}
	
}

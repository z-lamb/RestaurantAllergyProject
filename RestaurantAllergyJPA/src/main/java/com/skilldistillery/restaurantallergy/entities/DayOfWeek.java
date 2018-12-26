package com.skilldistillery.restaurantallergy.entities;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class DayOfWeek {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String weekday;
	
	/*
	 * getters / setters
	 */
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getWeekday() {
		return weekday;
	}
	public void setWeekday(String weekday) {
		this.weekday = weekday;
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
		DayOfWeek other = (DayOfWeek) obj;
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
		builder.append("DayOfWeek [id=").append(id)
				.append(", weekday=").append(weekday)
				.append("]");
		return builder.toString();
	}
	
	/*
	 * constructors
	 */
	public DayOfWeek() {
		super();
	}
	public DayOfWeek(int id, String weekday) {
		super();
		this.id = id;
		this.weekday = weekday;
	}
	
}

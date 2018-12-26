package com.skilldistillery.restaurantallergy.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="business_info")
public class BusinessInfo {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private Boolean vegitarians;
	private Boolean reservations;
	private Boolean delivery;
	@Column(name="take_out")
	private Boolean takeOut;
	@Column(name="credit_cards")
	private Boolean creditCards;
	@Column(name="mobile_pay")
	private Boolean mobilePay;
	private String parking;
	private Boolean kids;
	private Boolean groups;
	private String ambiance;
	@Column(name="noise_level")
	private NoiseLevel noiseLevel;
	private Boolean dancing;
	private Alcohol alcohol;
	@Column(name="happy_hour")
	private Boolean happyHour;
	@Column(name="coat_check")
	private Boolean coatCheck;
	private Boolean smoking;
	@Column(name="outdoor_seating")
	private Boolean outdoorSeating;
	private Boolean wifi;
	private Boolean tv;
	@Column(name="waiter_service")
	private Boolean waiterService;
	private Boolean caters;
	
	/*
	 * getters / setters
	 */
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public Boolean getVegitarians() {
		return vegitarians;
	}
	public void setVegitarians(Boolean vegitarians) {
		this.vegitarians = vegitarians;
	}
	
	public Boolean getReservations() {
		return reservations;
	}
	public void setReservations(Boolean reservations) {
		this.reservations = reservations;
	}
	
	public Boolean getDelivery() {
		return delivery;
	}
	public void setDelivery(Boolean delivery) {
		this.delivery = delivery;
	}
	
	public Boolean getTakeOut() {
		return takeOut;
	}
	public void setTakeOut(Boolean takeOut) {
		this.takeOut = takeOut;
	}
	
	public Boolean getCreditCards() {
		return creditCards;
	}
	public void setCreditCards(Boolean creditCards) {
		this.creditCards = creditCards;
	}
	
	public Boolean getMobilePay() {
		return mobilePay;
	}
	public void setMobilePay(Boolean mobilePay) {
		this.mobilePay = mobilePay;
	}
	
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	
	public Boolean getKids() {
		return kids;
	}
	public void setKids(Boolean kids) {
		this.kids = kids;
	}
	
	public Boolean getGroups() {
		return groups;
	}
	public void setGroups(Boolean groups) {
		this.groups = groups;
	}
	
	public String getAmbiance() {
		return ambiance;
	}
	public void setAmbiance(String ambiance) {
		this.ambiance = ambiance;
	}
	
	public NoiseLevel getNoiseLevel() {
		return noiseLevel;
	}
	public void setNoiseLevel(NoiseLevel noiseLevel) {
		this.noiseLevel = noiseLevel;
	}
	
	public Boolean getDancing() {
		return dancing;
	}
	public void setDancing(Boolean dancing) {
		this.dancing = dancing;
	}
	
	public Alcohol getAlcohol() {
		return alcohol;
	}
	public void setAlcohol(Alcohol alcohol) {
		this.alcohol = alcohol;
	}
	
	public Boolean getHappyHour() {
		return happyHour;
	}
	public void setHappyHour(Boolean happyHour) {
		this.happyHour = happyHour;
	}
	
	public Boolean getCoatCheck() {
		return coatCheck;
	}
	public void setCoatCheck(Boolean coatCheck) {
		this.coatCheck = coatCheck;
	}
	
	public Boolean getSmoking() {
		return smoking;
	}
	public void setSmoking(Boolean smoking) {
		this.smoking = smoking;
	}
	
	public Boolean getOutdoorSeating() {
		return outdoorSeating;
	}
	public void setOutdoorSeating(Boolean outdoorSeating) {
		this.outdoorSeating = outdoorSeating;
	}
	
	public Boolean getWifi() {
		return wifi;
	}
	public void setWifi(Boolean wifi) {
		this.wifi = wifi;
	}
	
	public Boolean getTv() {
		return tv;
	}
	public void setTv(Boolean tv) {
		this.tv = tv;
	}
	
	public Boolean getWaiterService() {
		return waiterService;
	}
	public void setWaiterService(Boolean waiterService) {
		this.waiterService = waiterService;
	}
	
	public Boolean getCaters() {
		return caters;
	}
	public void setCaters(Boolean caters) {
		this.caters = caters;
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
		BusinessInfo other = (BusinessInfo) obj;
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
		builder.append("BusinessInfo [id=").append(id)
				.append(", vegitarians=").append(vegitarians)
				.append(", reservations=").append(reservations)
				.append(", delivery=").append(delivery)
				.append(", takeOut=").append(takeOut)
				.append(", creditCards=").append(creditCards)
				.append(", mobilePay=").append(mobilePay)
				.append(", parking=").append(parking)
				.append(", kids=").append(kids)
				.append(", groups=").append(groups)
				.append(", ambiance=").append(ambiance)
				.append(", noiseLevel=").append(noiseLevel)
				.append(", dancing=").append(dancing)
				.append(", alcohol=").append(alcohol)
				.append(", happyHour=").append(happyHour)
				.append(", coatCheck=").append(coatCheck)
				.append(", smoking=").append(smoking)
				.append(", outdoorSeating=").append(outdoorSeating)
				.append(", wifi=").append(wifi)
				.append(", tv=").append(tv)
				.append(", waiterService=").append(waiterService)
				.append(", caters=").append(caters)
				.append("]");
		return builder.toString();
	}
	
	/*
	 * constructors
	 */
	public BusinessInfo() {
		super();
	}
	
	public BusinessInfo(int id, Boolean vegitarians, Boolean reservations, Boolean delivery, Boolean takeOut,
			Boolean creditCards, Boolean mobilePay, String parking, Boolean kids, Boolean groups, String ambiance,
			NoiseLevel noiseLevel, Boolean dancing, Alcohol alcohol, Boolean happyHour, Boolean coatCheck,
			Boolean smoking, Boolean outdoorSeating, Boolean wifi, Boolean tv, Boolean waiterService, Boolean caters) {
		super();
		this.id = id;
		this.vegitarians = vegitarians;
		this.reservations = reservations;
		this.delivery = delivery;
		this.takeOut = takeOut;
		this.creditCards = creditCards;
		this.mobilePay = mobilePay;
		this.parking = parking;
		this.kids = kids;
		this.groups = groups;
		this.ambiance = ambiance;
		this.noiseLevel = noiseLevel;
		this.dancing = dancing;
		this.alcohol = alcohol;
		this.happyHour = happyHour;
		this.coatCheck = coatCheck;
		this.smoking = smoking;
		this.outdoorSeating = outdoorSeating;
		this.wifi = wifi;
		this.tv = tv;
		this.waiterService = waiterService;
		this.caters = caters;
	}
	
	
	
}

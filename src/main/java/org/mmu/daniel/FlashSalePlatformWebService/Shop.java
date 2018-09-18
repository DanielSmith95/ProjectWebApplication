package org.mmu.daniel.FlashSalePlatformWebService;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.google.gson.Gson;

@Entity
@Table(name = "SHOPS")
public class Shop {
	
	@Id 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "SHOP_ID")
	private int shopId;
	
	@Column(name = "OWNER_ID")
	private int ownerId;
	
	@Column(name = "SHOP_NAME")
	private String shopName; 
	
	@Column(name = "ADDRESS_LINE_1")
	private String addressLine1;
	
	@Column(name = "ADDRESS_LINE_2")
	private String addressLine2;
	
	@Column(name = "ADDRESS_LINE_3")
	private String addressLine3; 
	
	@Column(name = "POSTCODE")
	private String postcode;
	
	@Column(name = "LATITUDE")
	private String latitude;
	
	@Column(name = "LONGITUDE")
	private String longitude;
	
	@Column(name = "TELEPHONE_NO")
	private String telephoneNo;
	
	@Column(name = "SHOP_EMAIL")
	private String shopEmail;
	
	@Column(name = "BIOGRAPHY")
	private String biography; 
	
	@Column(name = "OPENING_HOURS")
	private String openingHours;
	
	
	public Shop() {
		
	}

	public int getShopId() {
		return shopId;
	}
	
	public void setShopId(int shopId) {
		this.shopId = shopId;
	}
	
	public int getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(int ownerId) {
		this.ownerId = ownerId;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getAddressLine1() {
		return addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	public String getAddressLine3() {
		return addressLine3;
	}

	public void setAddressLine3(String addressLine3) {
		this.addressLine3 = addressLine3;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getShopEmail() {
		return shopEmail;
	}

	public void setshopEmail(String shopEmail) {
		this.shopEmail = shopEmail;
	}

	public String getBiography() {
		return biography;
	}

	public void setBiography(String biography) {
		this.biography = biography;
	}

	public String getOpeningHours() {
		return openingHours;
	}

	public void setOpeningHours(String openingHours) {
		this.openingHours = openingHours;
	}

	public String getTelephoneNo() {
		return telephoneNo;
	}

	public void setTelephoneNo(String telephoneNo) {
		this.telephoneNo = telephoneNo;
	}

	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
}

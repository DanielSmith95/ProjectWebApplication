	package org.mmu.daniel.FlashSalePlatformWebService;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.google.gson.Gson;

@Entity
@Table(name = "SALES")
public class Sale {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "SALE_ID")
	private int saleId;
	
	@Column(name = "SHOP_ID")
	private int shopId;
	
	@Column(name = "SALE_TITLE")
	private String saleTitle;
	
	@Column(name = "ORIGINAL_PRICE")
	private String originalPrice;
	
	@Column(name = "SALE_PRICE")
	private String salePrice;
	
	@Column(name = "DESCRIPTION")
	private String saleDescription;
	
	@Column(name = "SALE_CATEGORY")
	private int saleCategory;
	
	@Column(name = "IMAGE_REFERENCE")
	private String imageReference;
	
	public Sale() {
		
	}
	
	public int getSaleId() {
		return saleId;
	}

	public void setSaleId(int saleId) {
		this.saleId = saleId;
	}

	public int getShopId() {
		return shopId;
	}

	public void setShopId(int shopId) {
		this.shopId = shopId;
	}

	public String getSaleTitle() {
		return saleTitle;
	}

	public void setSaleTitle(String saleTitle) {
		this.saleTitle = saleTitle;
	}

	public String getOriginalPrice() {
		return originalPrice;
	}

	public void setOriginalPrice(String originalPrice) {
		this.originalPrice = originalPrice;
	}

	public String getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(String salePrice) {
		this.salePrice = salePrice;
	}

	public String getSaleDescription() {
		return saleDescription;
	}

	public void setSaleDescription(String saleDescription) {
		this.saleDescription = saleDescription;
	}

	public int getSaleCategory() {
		return saleCategory;
	}

	public void setSaleCategory(int saleCategory) {
		this.saleCategory = saleCategory;
	}
	
	public String getImageReference() {
		return imageReference;
	}

	public void setImageReference(String imageReference) {
		this.imageReference = imageReference;
	}

	@Override
	public String toString() {
		return new Gson().toJson(this);
	}
}

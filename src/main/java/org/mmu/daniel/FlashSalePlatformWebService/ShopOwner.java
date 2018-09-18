package org.mmu.daniel.FlashSalePlatformWebService;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "SHOP_OWNERS")
public class ShopOwner {
	
	@Id 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "OWNER_ID")
	private int ownerId;
	
	@Column(name = "FIRST_NAME")
	private String firstName; 
	
	@Column(name = "SURNAME")
	private String surname; 
	
	@Column(name = "EMAIL")
	private String email; 
	
	@Column(name = "PASSWORD")
	private String password;
	
	public ShopOwner() {
		
	}

	public int getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(int ownerId) {
		this.ownerId = ownerId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}

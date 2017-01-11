package com.josephcalver.olderly.models;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

public class Client {

	private int id;

	@NotBlank
	@Size(min = 2, max = 20)
	private String firstName;

	@NotBlank
	@Size(min = 2, max = 20)
	private String lastName;

	@NotBlank
	@Size(min = 10, max = 100)
	private String address;

	@NotBlank
	@Size(min = 11, max = 11)
	@Pattern(regexp = "^[0-9]{1,11}$")
	private String telephone;

	public Client() {

	}

	public Client(String firstName, String lastName, String address, String telephone) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.telephone = telephone;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	@Override
	public String toString() {
		return "Client [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", address=" + address
				+ ", telephone=" + telephone + "]";
	}

}

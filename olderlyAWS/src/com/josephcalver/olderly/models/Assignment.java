package com.josephcalver.olderly.models;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

public class Assignment {

	private int id;

	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private String date;

	@NotBlank
	private String time;

	@NotBlank
	private String duration;

	@NotBlank
	@Size(min = 1, max = 500)
	private String description;

	private String volunteer;

	private int clientId;
	private String firstName;
	private String lastName;
	private String address;
	private String telephone;

	public Assignment() {

	}

	public Assignment(String date, String time, String duration, String description, int clientId) {
		this.date = date;
		this.time = time;
		this.duration = duration;
		this.description = description;
		this.clientId = clientId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getVolunteer() {
		return volunteer;
	}

	public void setVolunteer(String volunteer) {
		this.volunteer = volunteer;
	}

	public int getClientId() {
		return clientId;
	}

	public void setClientId(int clientId) {
		this.clientId = clientId;
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
		return "Assignment [id=" + id + ", date=" + date + ", time=" + time + ", duration=" + duration
				+ ", description=" + description + ", volunteer=" + volunteer + ", clientId=" + clientId + "]";
	}
	
}

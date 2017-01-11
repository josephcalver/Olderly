package com.josephcalver.olderly.models;

import java.util.Date;

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

	public Assignment() {

	}

	public Assignment(String date, String time, String description) {
		this.date = date;
		this.time = time;
		this.description = description;
	}

	public Assignment(int id, String date, String time, String description) {
		this.id = id;
		this.date = date;
		this.time = time;
		this.description = description;
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Assignment [id=" + id + ", date=" + date + ", time=" + time + ", duration=" + duration
				+ ", description=" + description + ", volunteer=" + volunteer + "]";
	}

}

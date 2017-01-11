package com.josephcalver.olderly.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.josephcalver.olderly.dao.VolunteersDao;
import com.josephcalver.olderly.models.Assignment;

@Service("volunteersService")
public class VolunteersService {

	private VolunteersDao volunteersDao;

	@Autowired
	public void setVolunteersDao(VolunteersDao volunteersDao) {
		this.volunteersDao = volunteersDao;
	}

	public void signUp(String username, int id) {
		volunteersDao.addVolunteer(username, id);
	}

	public void cancel(int id) {
		volunteersDao.cancelVolunteer(id);
	}

	public List<Assignment> getMyAssignments(String username) {
		return volunteersDao.getMyAssignments(username);
	}

	public void cancelAllAssignments() {
		
	}
	
	/*
	public void cancelMyAssignments(String currentUser) {
		volunteersDao.cancelMyAssignments(currentUser);
	}
	*/
	
	public void cancelAllAssignments(String username) {
		volunteersDao.cancelAllAssignments(username);
	}

}

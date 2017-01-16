package com.josephcalver.olderly.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
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

	@Secured("ROLE_USER")
	public void signUp(String username, int id) {
		volunteersDao.addVolunteer(username, id);
	}

	@Secured("ROLE_USER")
	public void cancel(int id) {
		volunteersDao.cancelVolunteer(id);
	}

	@Secured({ "ROLE_USER", "ROLE_GUEST_USER" })
	public List<Assignment> getMyAssignments(String username) {
		return volunteersDao.getMyAssignments(username);
	}

	@Secured("ROLE_ADMIN")
	public void cancelAllAssignments(String username) {
		volunteersDao.cancelAllAssignments(username);
	}

}

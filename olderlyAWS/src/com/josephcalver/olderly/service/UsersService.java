package com.josephcalver.olderly.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;

import com.josephcalver.olderly.dao.UsersDao;
import com.josephcalver.olderly.models.User;

@Service("usersService")
public class UsersService {

	private UsersDao usersDao;

	@Autowired
	public void setUsersDao(UsersDao usersDao) {
		this.usersDao = usersDao;
	}

	public void create(User user) {
		usersDao.create(user);
	}

	public boolean exists(String username) {
		return usersDao.exists(username);
	}

	@Secured("IS_AUTHENTICATED_FULLY")
	public User getCurrentUser(String username) {
		return usersDao.getCurrentUser(username);
	}

	@Secured("ROLE_USER")
	public void updateAccount(User user, String currentUser) {
		usersDao.update(user, currentUser);
	}

	@Secured("ROLE_USER")
	public void delete(String currentUser) {
		usersDao.delete(currentUser);
	}

	@Secured("ROLE_ADMIN")
	public void deleteVolunteer(String username) {
		usersDao.deleteVolunteer(username);
	}

	@Secured("ROLE_ADMIN")
	public List<User> getAllVolunteers() {
		return usersDao.getAllVolunteers();
	}
	
}

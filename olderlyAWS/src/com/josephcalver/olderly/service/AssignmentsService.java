package com.josephcalver.olderly.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;

import com.josephcalver.olderly.dao.AssignmentsDao;
import com.josephcalver.olderly.models.Assignment;
import com.josephcalver.olderly.models.Client;

@Service("assignmentsService")
public class AssignmentsService {

	private AssignmentsDao assignmentsDao;

	@Autowired
	public void setAssignmentsDao(AssignmentsDao assignmentsDao) {
		this.assignmentsDao = assignmentsDao;
	}

	@Secured("ROLE_ADMIN")
	public void create(Assignment assignment) {
		assignmentsDao.create(assignment);
	}

	@Secured({ "ROLE_ADMIN", "ROLE_GUEST_ADMIN" })
	public Assignment getAssignment(int id) {
		Assignment assignment = assignmentsDao.getAssignment(id);
		return assignment;
	}

	@Secured("IS_AUTHENTICATED_FULLY")
	public List<Assignment> getAssignments() {
		return assignmentsDao.getAssignments();
	}

	@Secured("ROLE_ADMIN")
	public void update(Assignment assignment) {
		assignmentsDao.update(assignment);
	}

	@Secured("ROLE_ADMIN")
	public void delete(int id) {
		assignmentsDao.delete(id);
	}
	
	@Secured({ "ROLE_ADMIN", "ROLE_GUEST_ADMIN" })
	public List<Client> getAllClients() {
		return assignmentsDao.getAllClients();
	}

}

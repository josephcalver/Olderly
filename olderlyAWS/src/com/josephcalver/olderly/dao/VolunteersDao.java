package com.josephcalver.olderly.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import com.josephcalver.olderly.models.Assignment;

@Component
public class VolunteersDao {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	public boolean addVolunteer(String username, int id) {

		MapSqlParameterSource params = new MapSqlParameterSource();

		params.addValue("username", username);
		params.addValue("id", id);

		return jdbc.update("update assignments set volunteer=:username where id=:id", params) == 1;
	}

	public boolean cancelVolunteer(int id) {
		MapSqlParameterSource params = new MapSqlParameterSource();

		params.addValue("id", id);

		return jdbc.update("update assignments set volunteer = NULL where id=:id", params) == 1;
	}

	public List<Assignment> getMyAssignments(String username) {
		MapSqlParameterSource params = new MapSqlParameterSource();

		params.addValue("username", username);

		return jdbc.query(
				"select * from assignments join clients on clients.id=assignments.client_id where volunteer=:username",
				params, new RowMapper<Assignment>() {

					public Assignment mapRow(ResultSet rs, int RowNum) throws SQLException {
						Assignment assignment = new Assignment();

						assignment.setId(rs.getInt("id"));
						assignment.setDate(rs.getString("date"));
						assignment.setTime(rs.getString("time"));
						assignment.setDuration(rs.getString("duration"));
						assignment.setDescription(rs.getString("description"));

						return assignment;
					}
				});
	}

	/*
	 * public boolean cancelMyAssignments(String currentUser) {
	 * MapSqlParameterSource params = new MapSqlParameterSource("currentUser",
	 * currentUser);
	 * 
	 * return jdbc.update(
	 * "update assignments set volunteer = NULL where volunteer=:currentUser",
	 * params) == 1; }
	 */

	public boolean cancelAllAssignments(String username) {
		MapSqlParameterSource params = new MapSqlParameterSource("username", username);

		return jdbc.update("update assignments set volunteer = NULL where volunteer=:username", params) == 1;

	}
}

package com.josephcalver.olderly.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import com.josephcalver.olderly.models.Assignment;
import com.josephcalver.olderly.models.Client;

@Component
public class AssignmentsDao {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	public boolean create(Assignment assignment) {
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(assignment);
		return jdbc.update(
				"insert into assignments (date, time, duration, description, client_id) values (date_format(:date, '%d/%m/%Y'), :time, :duration, :description, :clientId)",
				params) == 1;
	}

	public Assignment getAssignment(int id) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("id", id);

		return jdbc.queryForObject("select * from assignments where assignments.id=:id", params,
				new RowMapper<Assignment>() {

					public Assignment mapRow(ResultSet rs, int rowNum) throws SQLException {
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

	public List<Assignment> getAssignments() {

		return jdbc.query("select * from assignments where volunteer is null order by date asc, time asc",
				new RowMapper<Assignment>() {

					public Assignment mapRow(ResultSet rs, int RowNum) throws SQLException {
						Assignment assignment = new Assignment();

						assignment.setId(rs.getInt("id"));
						assignment.setDate(rs.getString("date"));
						assignment.setTime(rs.getString("time"));
						assignment.setDuration(rs.getString("duration"));
						assignment.setDescription(rs.getString("description"));
						assignment.setVolunteer(rs.getString("volunteer"));

						return assignment;
					}
				});
	}

	public boolean update(Assignment assignment) {
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(assignment);

		return jdbc.update(
				"update assignments set date=:date, time=:time, duration=:duration, description=:description where id=:id",
				params) == 1;
	}

	public boolean delete(int id) {
		MapSqlParameterSource params = new MapSqlParameterSource("id", id);

		return jdbc.update("delete from assignments where id=:id", params) == 1;
	}
	
	public List<Client> getAllClients() {		
		return jdbc.query("select * from clients order by lastname", new RowMapper<Client>() {

			public Client mapRow(ResultSet rs, int rowNum) throws SQLException {
				Client client = new Client();

				client.setId(rs.getInt("id"));
				client.setFirstName(rs.getString("firstname"));
				client.setLastName(rs.getString("lastname"));
				client.setAddress(rs.getString("address"));
				client.setTelephone(rs.getString("telephone"));

				return client;
			}
		});
	}
}

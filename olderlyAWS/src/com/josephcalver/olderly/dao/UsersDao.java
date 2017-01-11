package com.josephcalver.olderly.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.josephcalver.olderly.models.User;

@Component("usersDao")
public class UsersDao {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	public boolean create(User user) {

		MapSqlParameterSource params = new MapSqlParameterSource();

		params.addValue("firstname", user.getFirstName());
		params.addValue("lastname", user.getLastName());
		params.addValue("username", user.getUsername());
		params.addValue("password", passwordEncoder.encode(user.getPassword()));
		params.addValue("email", user.getEmail());
		params.addValue("authority", user.getAuthority());
		params.addValue("enabled", user.isEnabled());

		return jdbc.update(
				"insert into users (firstname, lastname, username, password, email, authority, enabled) values (:firstname, :lastname, :username, :password, :email, :authority, :enabled)",
				params) == 1;
	}

	public boolean exists(String username) {
		return jdbc.queryForObject("select count(*) from users where username=:username",
				new MapSqlParameterSource("username", username), Integer.class) > 0;
	}

	public User getCurrentUser(String username) {

		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("username", username);

		return jdbc.queryForObject("select * from users where users.username=:username", params, new RowMapper<User>() {

			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();

				user.setFirstName(rs.getString("firstname"));
				user.setLastName(rs.getString("lastname"));
				user.setUsername(rs.getString("username"));
				user.setEmail(rs.getString("email"));

				return user;

			}
		});
	}

	/*
	 * public List<User> getAllUsers() { return
	 * jdbc.query("select * from users",
	 * BeanPropertyRowMapper.newInstance(User.class)); }
	 */

	public List<User> getAllVolunteers() {

		return jdbc.query("select * from users where authority='ROLE_USER' order by lastname", new RowMapper<User>() {

			public User mapRow(ResultSet rs, int RowNum) throws SQLException {
				User user = new User();

				user.setFirstName(rs.getString("firstname"));
				user.setLastName(rs.getString("lastname"));
				user.setUsername(rs.getString("username"));
				user.setEmail(rs.getString("email"));

				return user;
			}
		});
	}

	public boolean update(User user, String currentUser) {

		MapSqlParameterSource params = new MapSqlParameterSource();

		params.addValue("firstname", user.getFirstName());
		params.addValue("lastname", user.getLastName());
		params.addValue("username", user.getUsername());
		params.addValue("password", passwordEncoder.encode(user.getPassword()));
		params.addValue("email", user.getEmail());
		params.addValue("currentuser", currentUser);

		return jdbc.update(
				"update users set firstname=:firstname, lastname=:lastname, username=:username, email=:email, password=:password where username=:currentuser",
				params) == 1;
	}

	public boolean delete(String currentUser) {
		MapSqlParameterSource params = new MapSqlParameterSource("currentuser", currentUser);

		return jdbc.update("delete from users where username=:currentuser", params) == 1;
	}

	public boolean deleteVolunteer(String username) {
		MapSqlParameterSource params = new MapSqlParameterSource("username", username);

		return jdbc.update("delete from users where username=:username", params) == 1;
	}

}

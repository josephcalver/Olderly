package com.josephcalver.olderly.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import com.josephcalver.olderly.models.Client;

@Component
public class ClientsDao {

	private NamedParameterJdbcTemplate jdbc;

	@Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	public boolean create(Client client) {
		MapSqlParameterSource params = new MapSqlParameterSource();

		params.addValue("firstname", client.getFirstName());
		params.addValue("lastname", client.getLastName());
		params.addValue("address", client.getAddress());
		params.addValue("telephone", client.getTelephone());

		return jdbc.update(
				"insert into clients (firstname, lastname, address, telephone) values (:firstname, :lastname, :address, :telephone)",
				params) == 1;
	}

	public boolean exists(String telephone) {
		return jdbc.queryForObject("select count(*) from clients where telephone=:telephone",
				new MapSqlParameterSource("telephone", telephone), Integer.class) > 0;
	}

	public Client getClient(int id) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("id", id);

		return jdbc.queryForObject("select * from clients where id=:id", params, new RowMapper<Client>() {

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

	public boolean update(Client client) {
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(client);

		return jdbc.update(
				"update clients set firstname=:firstName, lastname=:lastName, address=:address, telephone=:telephone where id=:id",
				params) == 1;

	}

	public boolean delete(int id) {
		MapSqlParameterSource params = new MapSqlParameterSource("id", id);

		return jdbc.update("delete from clients where id=:id", params) == 1;
	}

}

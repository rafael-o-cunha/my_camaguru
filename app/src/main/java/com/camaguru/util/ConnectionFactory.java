package com.camaguru.util;

import javax.sql.DataSource;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

public class ConnectionFactory {
	
	private static HikariDataSource dataSource;

	static {
		try {
			String host = System.getenv("POSTGRES_HOST");
			String port = System.getenv("POSTGRES_PORT");
			String database = System.getenv("POSTGRES_DB");
			String username = System.getenv("POSTGRES_USER");
			String password = System.getenv("POSTGRES_PASSWORD");
			String jdbcUrl = String.format("jdbc:postgresql://%s:%s/%s", host, port, database);
			
			HikariConfig config = new HikariConfig();
			config.setJdbcUrl(jdbcUrl);
			config.setUsername(username);
			config.setPassword(password);
			config.setDriverClassName("org.postgresql.Driver");
			config.setMaximumPoolSize(10);
			
			dataSource = new HikariDataSource(config);
			
			System.out.println("====== Connection pool initialized. ======");
			
		}
		catch(Exception e) {
			throw new RuntimeException("====== Error initializing dataSource ======", e);
		}
	}
	
	public static DataSource getDataSource() {
		return dataSource;
	}
}

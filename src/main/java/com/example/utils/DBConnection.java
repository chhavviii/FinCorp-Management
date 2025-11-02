package com.example.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	private static final String URL = "jdbc:mysql://localhost:3306/BFSI";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "208463";

	public static Connection getConnection() {
		Connection conn = null;
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (ClassNotFoundException e) {
			System.out.println("JDBC Driver not found: " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("Database connection failed: " + e.getMessage());
		}
		return conn;
	}

}

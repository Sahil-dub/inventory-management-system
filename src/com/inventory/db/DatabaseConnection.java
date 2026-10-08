package com.inventory.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class DatabaseConnection {

    private static final String DEFAULT_URL = "jdbc:mysql://localhost:3306/inventory_db";

    private DatabaseConnection() {
        // Utility class
    }

    public static Connection getConnection() throws SQLException {
        String url = getEnv("DB_URL", DEFAULT_URL);
        String user = getEnv("DB_USER", "root");
        String password = getEnv("DB_PASSWORD", "");

        return DriverManager.getConnection(url, user, password);
    }

    private static String getEnv(String name, String defaultValue) {
        String value = System.getenv(name);
        return value == null || value.isBlank() ? defaultValue : value;
    }

    public static void main(String[] args) {
        try (Connection connection = getConnection()) {
            System.out.println("Database connection established successfully.");
        } catch (SQLException e) {
            System.err.println("Database connection failed: " + e.getMessage());
        }
    }
}

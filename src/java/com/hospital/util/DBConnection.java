/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hospital.util;

/**
 *
 * @author moza
 * d
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String DRIVER = "org.apache.derby.jdbc.ClientDriver";
    private static final String URL = "jdbc:derby://localhost:1527/HospitalSystemDB;create=true";
    private static final String USER = "app";
    private static final String PASS = "app";

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName(DRIVER);
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
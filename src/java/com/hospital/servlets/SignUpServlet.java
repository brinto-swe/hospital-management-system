/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hospital.servlets;

import com.hospital.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mozad
 */
@WebServlet(name = "SignUpServlet", urlPatterns = {"/SignUpServlet"})
public class SignUpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");

        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO USERS (NAME, EMAIL, PASSWORD, PHONE, STATUS) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, phone);
            ps.setString(5, "pending"); // initial status

            int result = ps.executeUpdate();
            if(result > 0) {
                response.sendRedirect("signupSuccess.jsp");
            } else {
                response.sendRedirect("signup.jsp?error=Registration Failed");
            }
        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("signup.jsp?error=Exception Occurred");
        }
    }
}

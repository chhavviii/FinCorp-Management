package com.STM;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.utils.DBConnection;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

@WebServlet("/MiniStatement")
public class MiniStatementServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            System.out.println("hihi");
            Connection con = DBConnection.getConnection();
            System.out.println("hihihi");

            // --- Fetch last 10 transactions ---
            String sql = "SELECT * FROM finCorp ORDER BY dateOfTransaction DESC LIMIT 10";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            List<Map<String, Object>> transactions = new ArrayList<>();
            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("branchId", rs.getInt("branchId"));
                row.put("branchName", rs.getString("branchName"));
                row.put("location", rs.getString("location"));
                row.put("transactions", rs.getInt("NumOftransactions"));
                row.put("dateOfTransaction", rs.getDate("dateOfTransaction"));
                System.out.println(rs.getString("branchName"));
                transactions.add(row);
            }

            // --- Find min & max from those 10 ---
            Map<String, Object> minTransaction = null;
            Map<String, Object> maxTransaction = null;

            for (Map<String, Object> row : transactions) {
                if (minTransaction == null || 
                    (int) row.get("transactions") < (int) minTransaction.get("transactions")) {
                    minTransaction = row;
                }
                if (maxTransaction == null || 
                    (int) row.get("transactions") > (int) maxTransaction.get("transactions")) {
                    maxTransaction = row;
                }
            }

            // --- Send data to JSP ---
            request.setAttribute("transactions", transactions);     // latest 10
            request.setAttribute("minTransaction", minTransaction); // min among last 10
            request.setAttribute("maxTransaction", maxTransaction); // max among last 10

            RequestDispatcher rd = request.getRequestDispatcher("miniStatement2.jsp");
            rd.forward(request, response);

            con.close();
        } catch (Exception e) {
            throw new ServletException("DB error", e);
        }
    }
}






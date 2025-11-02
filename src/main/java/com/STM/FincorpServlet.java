package com.STM;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FincorpServlet")
public class FincorpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private String jdbcURL = "jdbc:mysql://localhost:3306/BFSI";
    private String jdbcUser = "root";
    private String jdbcPassword = "208463";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(jdbcURL, jdbcUser, jdbcPassword)) {

                if ("openCreate".equals(action)) {
                    request.getRequestDispatcher("createTr.jsp").forward(request, response);

                } else if ("openSearch".equals(action)) {
                    request.getRequestDispatcher("searchTr.jsp").forward(request, response);

                } else if ("openUpdate".equals(action)) {
                    request.getRequestDispatcher("updateTr.jsp").forward(request, response);

                } else if ("openDelete".equals(action)) {
                    request.getRequestDispatcher("deleteTr.jsp").forward(request, response);

                } else if ("create".equals(action)) {
                    int id = Integer.parseInt(request.getParameter("branchId"));
                    String name = request.getParameter("branchName");
                    String loc = request.getParameter("location");
                    int numTr = Integer.parseInt(request.getParameter("NumOftransactions"));
                    String date = request.getParameter("dateOfTransaction");

                    PreparedStatement ps = con.prepareStatement(
                        "INSERT INTO finCorp (branchId, branchName, location, NumOftransactions, dateOfTransaction) VALUES (?,?,?,?,?)"
                    );
                    ps.setInt(1, id);
                    ps.setString(2, name);
                    ps.setString(3, loc);
                    ps.setInt(4, numTr);
                    ps.setDate(5, Date.valueOf(date));
                    int rows = ps.executeUpdate();

                    out.println("<h3>" + rows + " Record inserted successfully!</h3>");
                    out.println("<a href='FincorpServlet'>Back to Menu</a>");

                } else if ("search".equals(action)) {
                    String idStr = request.getParameter("branchId");

                    if (idStr == null || idStr.trim().isEmpty()) {
                        request.setAttribute("error", "Please enter a Branch ID to search.");
                        request.getRequestDispatcher("searchTr.jsp").forward(request, response);
                    } else {
                        int id = Integer.parseInt(idStr);
                        PreparedStatement ps = con.prepareStatement("SELECT * FROM finCorp WHERE branchId=?");
                        ps.setInt(1, id);
                        ResultSet rs = ps.executeQuery();

                        if (rs.next()) {
                            request.setAttribute("branchId", rs.getInt("branchId"));
                            request.setAttribute("branchName", rs.getString("branchName"));
                            request.setAttribute("location", rs.getString("location"));
                            request.setAttribute("numTr", rs.getInt("NumOftransactions"));
                            request.setAttribute("date", rs.getDate("dateOfTransaction"));
                        } else {
                            request.setAttribute("error", "No record found for Branch ID: " + id);
                        }

                        request.getRequestDispatcher("searchTr.jsp").forward(request, response);
                    }
                }
                else if ("update".equals(action)) {
                    int id = Integer.parseInt(request.getParameter("branchId"));
                    String name = request.getParameter("branchName");
                    String loc = request.getParameter("location");
                    int numTr = Integer.parseInt(request.getParameter("NumOftransactions"));
                    String date = request.getParameter("dateOfTransaction");

                    PreparedStatement ps = con.prepareStatement(
                        "UPDATE finCorp SET branchName=?, location=?, NumOftransactions=?, dateOfTransaction=? WHERE branchId=?"
                    );
                    ps.setString(1, name);
                    ps.setString(2, loc);
                    ps.setInt(3, numTr);
                    ps.setDate(4, Date.valueOf(date));
                    ps.setInt(5, id);
                    int rows = ps.executeUpdate();

                    out.println("<h3>" + rows + " Record updated successfully!</h3>");
                    out.println("<a href='FincorpServlet'>Back to Menu</a>");

                } else if ("delete".equals(action)) {
                    int id = Integer.parseInt(request.getParameter("branchId"));
                    PreparedStatement ps = con.prepareStatement("DELETE FROM finCorp WHERE branchId=?");
                    ps.setInt(1, id);
                    int rows = ps.executeUpdate();

                    out.println("<h3>" + rows + " Record deleted successfully!</h3>");
                    out.println("<a href='FincorpServlet'>Back to Menu</a>");
                }
            }
        } catch (Exception e) {
            e.printStackTrace(out);
        }
    }
}
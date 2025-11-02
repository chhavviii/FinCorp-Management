package com.STM;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.example.utils.Bank;
import com.example.utils.DBConnection;

import java.io.IOException;
import java.sql.*;
import java.sql.Date;
import java.time.LocalDate;
import java.util.*;



@SuppressWarnings("serial")
@WebServlet("/sixmonthsdata")
public class SixMonthStatementServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String startDateStr = request.getParameter("startDate");
		String endDateStr = request.getParameter("endDate");

		LocalDate startDate;
		LocalDate endDate;

		if (startDateStr == null || startDateStr.isEmpty() || endDateStr == null || endDateStr.isEmpty()) {
			endDate = LocalDate.now();
			startDate = endDate.minusMonths(6);
		} else {
			startDate = LocalDate.parse(startDateStr);
			endDate = LocalDate.parse(endDateStr);
		}

		List<Bank> transactions = new ArrayList<>();

		try (Connection conn = DBConnection.getConnection()) {
			String sql = "SELECT * FROM finCorp WHERE dateOfTransaction BETWEEN ? AND ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setDate(1, Date.valueOf(startDate));
			ps.setDate(2, Date.valueOf(endDate));

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Bank t = new Bank();
				t.setBranchId(rs.getInt("branchId"));
				t.setBranchName(rs.getString("branchName"));
				t.setLocation(rs.getString("location"));
				t.setNumOfTransactions(rs.getInt("NumOftransactions"));
				t.setDateOfTransaction(rs.getDate("dateOfTransaction"));
				transactions.add(t);
			}

			// Find min and max transactions from the list
			Bank minTransaction = null;
			Bank maxTransaction = null;

			for (Bank t : transactions) {
				if (minTransaction == null || t.getNumOfTransactions() < minTransaction.getNumOfTransactions()) {
					minTransaction = t;
				}
				if (maxTransaction == null || t.getNumOfTransactions() > maxTransaction.getNumOfTransactions()) {
					maxTransaction = t;
				}
			}

			request.setAttribute("bank", transactions);
			request.setAttribute("minTransaction", minTransaction);
			request.setAttribute("maxTransaction", maxTransaction);

		} catch (Exception e) {
			e.printStackTrace();
		}

		request.getRequestDispatcher("sixMonthStatement.jsp").forward(request, response);
	}
}
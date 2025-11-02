package com.STM;

import java.io.IOException;
//import java.io.PrintWriter;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.utils.UserDAOlogin;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAOlogin userDAO;


	public void init() {
		userDAO = new UserDAOlogin();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        if (userDAO.validate(username, password)) {
            
            request.getSession().setAttribute("username", username);
            response.sendRedirect("dashboard.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    response.sendRedirect("login.jsp"); // redirect GET requests to login page
	}

	
	


}

package com.poc.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.poc.models.User;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserDbUtil UserDbUtil;

	@Resource(name = "jdbc/poc_app")
	private DataSource dataSource;

	@Override
	public void init() throws ServletException {
		super.init();

		// create our User db util ... and pass in the conn pool / datasource
		try {
			UserDbUtil = new UserDbUtil(dataSource);
		} catch (Exception exc) {
			throw new ServletException(exc);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			// read the "command" parameter
			String theCommand = request.getParameter("command");

			// if the command is missing, then default to listing Users
			if (theCommand == null) {
				theCommand = "";
			}

			// route to the appropriate method
			switch (theCommand) {

			case "UPDATE":
				updateUser(request, response);
				break;
				
			case "UPDATEPROFILE":
				viewUser(request, response);
				break;

			case "LOGOUT":
				logoutUser(request, response);
				break;
			}

		} catch (Exception exc) {
			throw new ServletException(exc);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			// read the "command" parameter
			String theCommand = request.getParameter("command");

			// route to the appropriate method
			switch (theCommand) {

			case "LANGUAGE":
				selectLanguage(request, response);
				break;
			case "SIGNUP":
				addUser(request, response);
				break;
			case "LOGIN":
				loginUser(request, response);
				break;
			case "UPDATE":
				updateUser(request, response);
				break;
			}

		} catch (Exception exc) {
			throw new ServletException(exc);
		}

	}

	private void selectLanguage(HttpServletRequest request, HttpServletResponse response) {
		//Get user from session
		
		//add language to user in data base
		
		//redirect to dashboard
		
	}

	private void addUser(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// read User info from form data
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");

		// create a new User object
		User theUser = new User(firstName, lastName, email, mobile, password);

		// add the User to the database
		UserDbUtil.addUser(theUser);

		// load login page
		RequestDispatcher dispatcher = request.getRequestDispatcher("/user-login.jsp");
		dispatcher.forward(request, response);
	}

	private void loginUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// read user inputs
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		// create User object
		User theUser = new User(username, username, password);

		// check user in database
		boolean check = UserDbUtil.checkUser(theUser);
		if (check) {
			theUser = UserDbUtil.getUser(username);

			// set a session for user
			HttpSession session = request.getSession();
			session.setAttribute("CURRENT_USER_FIRST_NAME", theUser.getFirstName());
			session.setAttribute("CURRENT_USER_LAST_NAME", theUser.getLastName());
			session.setAttribute("CURRENT_USER_EMAIL", theUser.getEmail());
			session.setAttribute("CURRENT_USER_MOBILE", theUser.getMobile());
			session.setAttribute("CURRENT_USER_PASSWORD", theUser.getPassword());
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/dashboard.jsp");
			dispatcher.forward(request, response);
		} else {
			PrintWriter out = response.getWriter();
			out.println("Invalid Username/Password");

			RequestDispatcher dispatcher = request.getRequestDispatcher("/user-login.jsp");
			dispatcher.forward(request, response);
		}
	}
	
	private void viewUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			response.sendRedirect("user-update-profile.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void updateUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		if (session != null) {
			// read User info from form data
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			String mobile = request.getParameter("mobile");
			String password = request.getParameter("password");

			// create a new User object
			User theUser = new User(firstName, lastName, email, mobile, password);

			// perform update on database
			UserDbUtil.updateUser(theUser);
			response.sendRedirect("user-login.jsp");
		} else {
			response.sendRedirect("user-login.jsp");
		}
	}

	private void logoutUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// invalidate session
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("user-login.jsp");
	}

}
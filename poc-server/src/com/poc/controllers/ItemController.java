package com.poc.controllers;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.poc.models.Item;

/**
 * Servlet implementation class ItemController
 */
@WebServlet("/ItemController")
public class ItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ItemDbUtil ItemDbUtil;
	@Resource(name = "jdbc/poc_app")
	private DataSource dataSource;

	@Override
	public void init() throws ServletException {
		super.init();

		// create our User db util ... and pass in the conn pool / datasource
		try {
			ItemDbUtil = new ItemDbUtil(dataSource);
		} catch (Exception exc) {
			throw new ServletException(exc);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			// read the "command" parameter
			String theCommand = request.getParameter("command");

			// if the command is missing, then default to listing students
			if (theCommand == null) {
				theCommand = "LIST";
			}

			// route to the appropriate method
			switch (theCommand) {

			case "LIST":
				listItems(request, response);
				break;

			case "SAVE":
				saveItems(request, response);
				break;
			}

		} catch (Exception exc) {
			throw new ServletException(exc);
		}

	}

	private void saveItems(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Item item = null;

		// read User info from form data
		String items = request.getParameter("input-items");
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("CURRENT_USER_EMAIL");
		String stuff = null, quantity = null, unit = null;

		items = items.trim(); 					// Remove whitespaces from beginning and ending
		System.out.println(items);
		items = items.replace("( )+", " "); 	// Change multiple spaces to single space between words
		System.out.println(items);
		String[] itemsArray = items.split(" "); // Convert string to Array
		System.out.println(itemsArray);
		try {
			if (itemsArray.length % 3 == 0) {
				for (int i = 0; i < itemsArray.length - 2; i = i + 3) {
					stuff = itemsArray[i];
					quantity = itemsArray[i + 1];
					unit = itemsArray[i + 2];

					item = new Item(user, unit, quantity, stuff);

					// add the User to the database
					ItemDbUtil.addItems(item);
				}
			}
		} catch (Exception exc) {
			throw new ServletException(exc);
		} finally {
			// load login page
			response.sendRedirect("dashboard.jsp");
		}
	}

	private void listItems(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
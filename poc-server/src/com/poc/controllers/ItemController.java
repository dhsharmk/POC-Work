package com.poc.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.poc.models.Account;
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

			// route to the appropriate method
			switch (theCommand) {

			case "LIST":
				listItems(request, response);
				break;

			case "PREVIEW":
				previewItems(request, response);
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
			case "SAVE":
				saveItems(request, response);
				break;
			}

		} catch (Exception exc) {
			throw new ServletException(exc);
		}

	}

	private void previewItems(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		List<Item> itemslist = new ArrayList<>();
		Item item = null;

		// read user input from form data
		String str = request.getParameter("input-items");
		String items = convertStr(str);

		String cname = request.getParameter("customerName");
		String cmob = request.getParameter("customerMobile");

		String stuff = null, quantity = null, unit = null, price = null, amount = "";
		int total = 0;

		// convert items to array
		String[] itemsArray = items.split(" ");

		try {
			for (int i = 0; i < itemsArray.length - 2; i = i + 5) {
				stuff = itemsArray[i];
				quantity = itemsArray[i + 1];
				unit = itemsArray[i + 2];
				price = itemsArray[i + 3];
				amount = "" + Integer.parseInt(quantity) * Integer.parseInt(price);
				total += Integer.parseInt(amount);

				item = new Item(cname, cmob, unit, quantity, stuff, price);

				itemslist.add(item);
			}
			// add items to the request
			request.setAttribute("ITEMS_PREVIEW", itemslist);
			request.setAttribute("CUSTOMER_NAME", cname);
			request.setAttribute("CUSTOMER_MOB", cmob);
			request.setAttribute("INPUT_ITEMS", items);
			request.setAttribute("TOTAL_AMOUNT", total);

			// send to JSP page (view)
			RequestDispatcher dispatcher = request.getRequestDispatcher("/preview-items.jsp");
			dispatcher.forward(request, response);
		} catch (Exception exc) {
			throw new ServletException(exc);
		}
	}

	private void saveItems(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Item item = null;
		Account account = null;
		String amount = null;
		int total = 0;

		// read user input from form data
		String str = request.getParameter("input-items");
		String items = convertStr(str);
		String paid = request.getParameter("paid");

		String cname = request.getParameter("customerName");
		String cmob = request.getParameter("customerMobile");

		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("CURRENT_USER_EMAIL");

		String stuff = null, quantity = null, unit = null, price = null;

		// convert items to array
		String[] itemsArray = items.split(" ");

		try {
			for (int i = 0; i < itemsArray.length - 2; i = i + 5) {
				stuff = itemsArray[i];
				quantity = itemsArray[i + 1];
				unit = itemsArray[i + 2];
				price = itemsArray[i + 3];

				amount = "" + Integer.parseInt(quantity) * Integer.parseInt(price);
				total += Integer.parseInt(amount);

				item = new Item(user, cname, cmob, unit, quantity, stuff, price);

				// add the User to the database
				ItemDbUtil.addItems(item);
			}
			
			int os = total - Integer.parseInt(paid);
			account = new Account(user, cname, cmob, os);
			ItemDbUtil.addAccount(account);
		} catch (Exception exc) {
			throw new ServletException(exc);
		} finally {
			// load login page
			response.sendRedirect("dashboard.jsp");
		}
	}

	private String convertStr(String inputString) {
		String temp = null;
		String str = inputString;

		// remove whitespaces before and after
		str = str.trim();

		// remove whitespaces from middle
		str = str.replace("( )+", " "); // Change multiple spaces to single space between words
		String[] strArray = str.split(" ");
		if (strArray.length % 5 == 0) {
			boolean c = true;
			for (int i = 0; i < strArray.length - 2; i = i + 5) {
				try {
					int num = Integer.parseInt(strArray[i]);
				} catch (NumberFormatException ex) {
					c = false;
				} finally {
					if (c) {
						temp = strArray[i + 2];
						strArray[i + 2] = strArray[i + 1];
						strArray[i + 1] = strArray[i];
						strArray[i] = temp;
					}
				}
				c = true;
			}
			str = String.join(" ", strArray);
		}
		return str;
	}

	private void listItems(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("CURRENT_USER_EMAIL");
		String date = request.getParameter("date");

		// get students from db util
		List<Item> items = ItemDbUtil.getItems(user, date);

		// add students to the request
		request.setAttribute("ITEM_LIST", items);

		// send to JSP page (view)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-items.jsp");
		dispatcher.forward(request, response);
	}
	
	private void listAccounts(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("CURRENT_USER_EMAIL");

		// get students from db util
		List<Account> Accounts = ItemDbUtil.getAccounts(user);

		// add students to the request
		session.setAttribute("ACCOUNT_LIST", Accounts);
	}

}
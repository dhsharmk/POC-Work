package com.poc.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
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
	public static String replcedRuppeesSign;

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

			case "LISTACCOUNTS":
				listAccounts(request, response);
				break;

			case "VIEWACCOUNT":
				viewAccount(request, response);
				break;

			case "VIEWACCOUNTDASH":
				viewAccountDash(request, response);
				break;

			case "VIEWBILL":
				viewBill(request, response);
				break;
					

			}

		} catch (Exception exc) {
			throw new ServletException(exc);
		}
	}

	private void viewAccountDash(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// get parameters for account
		String cname = request.getParameter("name");
		String cmob = request.getParameter("mobile");

		// set attributes
		request.setAttribute("CUSTOMER_NAME", cname);
		request.setAttribute("CUSTOMER_MOB", cmob);

		// dispatch
		RequestDispatcher dispatcher = request.getRequestDispatcher("/preview-items.jsp");
		dispatcher.forward(request, response);
	}

	private void viewBill(HttpServletRequest request, HttpServletResponse response) {
		try {
			response.sendRedirect("preview-items.jsp");
		} catch (IOException e) {
			e.printStackTrace();
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

			case "DELETEACCOUNT":
				deleteAccount(request, response);
				break;
			}
		} catch (Exception exc) {
			throw new ServletException(exc);
		}
	}

	
	private void saveItems(HttpServletRequest request, HttpServletResponse response) throws Exception {
         System.out.println("inside saveitems");
		Item item = null;
		Account account = null;
		String amount = null;
		int total = 0;

		// read user input from form data
		String rowcountvalue = request.getParameter("input-items");
		int rowcount = Integer.valueOf(rowcountvalue);
		String paid = request.getParameter("paid");
		System.out.println(paid);

		String cname = request.getParameter("customerName");
		String cmob = request.getParameter("customerMobile");

		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("CURRENT_USER_EMAIL");

		String stuff = null, quantity = null, unit = null, rate = null,  price = null, sc = null, qc = null, uc = null, rp = null, pc = null;

		// convert items to array
	  //  String[] itemsArray = handleRupeesSymbol(items);
			
		int j = 1;
		try {
			for (int i = 0; i <rowcount; i++) {
				sc = "stuff" + j;
				qc = "quantity" + j;
				uc = "unit" + j;
				rp = "rate" + j;
				pc = "price" + j;
				j++;
				stuff = request.getParameter(sc);
				quantity = request.getParameter(qc);
				unit = request.getParameter(uc);
				rate = request.getParameter(rp);
				price = request.getParameter(pc);
				if (rate.contains("&#8377;")) 
				rate = (rate.split("&#8377;")[1]);
				System.out.println(rate);
				
				price = "" + Integer.parseInt(quantity) * Integer.parseInt(rate);
				//amount = "" + Integer.parseInt(quantity) * Integer.parseInt(rate);
				total += Integer.parseInt(price);

				item = new Item(user, cname, cmob, unit, quantity, stuff, price, rate);

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
			response.sendRedirect("preview-items.jsp");
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

		// send to JSP page (view)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-accounts.jsp");
		dispatcher.forward(request, response);
	}

	private void viewAccount(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("CURRENT_USER_EMAIL");
		String cmob = request.getParameter("mobile");

		// get students from db util
		List<Item> items = ItemDbUtil.getAccountItems(user, cmob);

		// add students to the request
		request.setAttribute("ITEM_LIST", items);

		// send to JSP page (view)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view-account.jsp");
		dispatcher.forward(request, response);
	}

	private void deleteAccount(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("CURRENT_USER_EMAIL");
		String cmob = request.getParameter("mobile");

		ItemDbUtil.deleteAccount(user, cmob);

		// get students from db util
		List<Account> Accounts = ItemDbUtil.getAccounts(user);

		// add students to the request
		session.setAttribute("ACCOUNT_LIST", Accounts);

		// send to JSP page (view)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-accounts.jsp");
		dispatcher.forward(request, response);
	}

	public String[] handleRupeesSymbol(String items) {
		List<String> temp = Arrays.asList(items.split(" "));
		List<String> itemlist = new ArrayList<String>(temp);
		for (int i = 0; i < itemlist.size(); i++) {
			if (itemlist.get(i).contains("&#8377;")) {
				itemlist.set(i, (itemlist.get(i).split("&#8377;")[1]));
				itemlist.add(i + 1, "rupya");
			}

		}
		String[] newArray = itemlist.toArray(new String[itemlist.size()]);
		 replcedRuppeesSign= String.join(" ", newArray);
		return newArray;
	}

}
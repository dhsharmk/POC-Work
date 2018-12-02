package com.poc.controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.poc.models.Account;
import com.poc.models.Item;

public class ItemDbUtil {

	private static DataSource dataSource;

	public ItemDbUtil(DataSource theDataSource) {
		dataSource = theDataSource;
	}

	private void close(Connection myConn, Statement myStmt, ResultSet myRs) {

		try {
			if (myRs != null) {
				myRs.close();
			}

			if (myStmt != null) {
				myStmt.close();
			}

			if (myConn != null) {
				myConn.close(); // doesn't really close it ... just puts back in connection pool
			}
		} catch (Exception exc) {
			exc.printStackTrace();
		}
	}

	public void addItems(Item theItem) throws Exception {
		String usr = theItem.getUser().replaceAll("[-+.^:,]","");

		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			// get db connection
			myConn = dataSource.getConnection();

			// create sql for insert
			String sql = "insert into items (user, cname, cmob, unit, quantity, stuff, price, rate) values (?, ?, ?, ?, ?, ?, ?, ?)";

			myStmt = myConn.prepareStatement(sql);

			// set the param values for the User
			myStmt.setString(1, usr);
			myStmt.setString(2, theItem.getCname());
			myStmt.setString(3, theItem.getCmob());
			myStmt.setString(4, theItem.getUnit());
			myStmt.setString(5, theItem.getQuantity());
			myStmt.setString(6, theItem.getStuff());
			myStmt.setString(7, theItem.getPrice());
			myStmt.setString(8, theItem.getRate());

			// execute sql insert
			myStmt.execute();
		} finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
		}
	}

	public List<Item> getItems(String theUser, String date) throws Exception {
		String usr = theUser.replaceAll("[-+.^:,]","");
		List<Item> items = new ArrayList<>();

		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;

		try {
			// get a connection
			myConn = dataSource.getConnection();

			// create sql statement
			String sql = "SELECT * FROM `items` where DATE(timestamp)=? and user=?";

			myStmt = myConn.prepareStatement(sql);
			
			myStmt.setString(1, date);
			myStmt.setString(2, usr);

			// execute query
			myRs = myStmt.executeQuery();

			// process result set
			while (myRs.next()) {

				// retrieve data from result set row
				String user = myRs.getString("user");
				String cname = myRs.getString("cname");
				String cmob = myRs.getString("cmob");
				String stuff = myRs.getString("stuff");
				String quantity = myRs.getString("quantity");
				String unit = myRs.getString("unit");
				String price = myRs.getString("price");

				// create new student object
				Item tempItem = new Item(user, cname, cmob, unit, quantity, stuff, price);

				// add it to the list of students
				items.add(tempItem);
			}

			return items;
		} finally {
			// close JDBC objects
			close(myConn, myStmt, myRs);
		}
	}
	
	public void addAccount(Account theAccount) throws Exception {
		String usr = theAccount.getUser().replaceAll("[-+.^:,]","");

		Connection myConn = null;
		PreparedStatement myStmt = null;
		PreparedStatement myStmt1 = null;
		ResultSet myRs = null;

		try {
			// get db connection
			myConn = dataSource.getConnection();

			// create sql statements
			String sql = "select * from accounts where cmob=?";
//			String sql1 = "Update accounts set outstanding=outstanding+? where cmob=?";
			
			myStmt = myConn.prepareStatement(sql);
			
			// set the param values for the User
			myStmt.setString(1, theAccount.getCmob());

			// execute sql
			myRs = myStmt.executeQuery();
			if(!myRs.next()) {
				String sql1 = "insert into accounts (user, cname, cmob, outstanding) values (?, ?, ?, ?)";
				
				myStmt1 = myConn.prepareStatement(sql1);
				
				myStmt1.setString(1, usr);
				myStmt1.setString(2, theAccount.getCname());
				myStmt1.setString(3, theAccount.getCmob());
				myStmt1.setLong(4, theAccount.getOutstanding());
				
				myStmt1.execute();
			}
			else {
				String sql1 = "update accounts set outstanding=outstanding+? where cmob=?";
				
				myStmt1 = myConn.prepareStatement(sql1);
				
				myStmt1.setLong(1, theAccount.getOutstanding());
				myStmt1.setString(2, theAccount.getCmob());
				
				myStmt1.execute();
			}
		} finally {
			// clean up JDBC objects
			close(myConn, myStmt, myRs);
			close(myConn, myStmt1, null);
		}
	}

	public List<Account> getAccounts(String theUser) throws NumberFormatException, SQLException {
		String usr = theUser.replaceAll("[-+.^:,]","");
		List<Account> accounts = new ArrayList<>();

		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;

		try {
			// get a connection
			myConn = dataSource.getConnection();

			// create sql statement
			String sql = "SELECT * FROM `accounts` where user=?";

			myStmt = myConn.prepareStatement(sql);
			
			myStmt.setString(1, usr);

			// execute query
			myRs = myStmt.executeQuery();

			// process result set
			while (myRs.next()) {

				// retrieve data from result set row
				String user = myRs.getString("user");
				String cname = myRs.getString("cname");
				String cmob = myRs.getString("cmob");
				int os = Integer.parseInt(myRs.getString("outstanding"));
//				String ts = myRs.getString("timestamp");

				// create new student object
				Account tempAccount = new Account(user, cname, cmob, os);

				// add it to the list of students
				accounts.add(tempAccount);
			}

			return accounts;
		} finally {
			// close JDBC objects
			close(myConn, myStmt, myRs);
		}
	}

	public List<Item> getAccountItems(String theUser, String cusmob) throws Exception {
		String usr = theUser.replaceAll("[-+.^:,]","");
		List<Item> items = new ArrayList<>();

		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;

		try {
			// get a connection
			myConn = dataSource.getConnection();

			// create sql statement
			String sql = "SELECT * FROM `items` where cmob=? and user=?";

			myStmt = myConn.prepareStatement(sql);
			
			myStmt.setString(1, cusmob);
			myStmt.setString(2, usr);

			// execute query
			myRs = myStmt.executeQuery();

			// process result set
			while (myRs.next()) {

				// retrieve data from result set row
				String user = myRs.getString("user");
				String cname = myRs.getString("cname");
				String cmob = myRs.getString("cmob");
				String stuff = myRs.getString("stuff");
				String quantity = myRs.getString("quantity");
				String unit = myRs.getString("unit");
				String price = myRs.getString("price");

				// create new student object
				Item tempItem = new Item(user, cname, cmob, unit, quantity, stuff, price);

				// add it to the list of students
				items.add(tempItem);
			}

			return items;
		} finally {
			// close JDBC objects
			close(myConn, myStmt, myRs);
		}
	}

	public void deleteAccount(String user, String cmob) throws SQLException {
		user = user.replaceAll("[-+.^:,]","");
		Connection myConn = null;
		Connection myConn1 = null;
		PreparedStatement myStmt = null;
		PreparedStatement myStmt1 = null;

		try {
			// get db connection
			myConn = dataSource.getConnection();
			myConn1 = dataSource.getConnection();

			// create sql for insert
			String sql = "delete from accounts where user=? and cmob=?";
			String sql1 = "delete from items where user=? and cmob=?";

			myStmt = myConn.prepareStatement(sql);
			myStmt1 = myConn1.prepareStatement(sql1);

			// set the param values for the User
			myStmt.setString(1, user);
			myStmt.setString(2, cmob);
			myStmt1.setString(1, user);
			myStmt1.setString(2, cmob);

			// execute sql insert
			myStmt.execute();
			myStmt1.execute();
		} finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
			close(myConn1, myStmt1, null);
		}
	}

}
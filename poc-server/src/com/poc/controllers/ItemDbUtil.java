package com.poc.controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

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
			String sql = "insert into items " + "(user, cname, cmob, unit, quantity, stuff) " + "values (?, ?, ?, ?, ?, ?)";

			myStmt = myConn.prepareStatement(sql);

			// set the param values for the User
			myStmt.setString(1, usr);
			myStmt.setString(2, theItem.getCname());
			myStmt.setString(3, theItem.getCmob());
			myStmt.setString(4, theItem.getUnit());
			myStmt.setString(5, theItem.getQuantity());
			myStmt.setString(6, theItem.getStuff());

			// execute sql insert
			myStmt.execute();
		} finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
		}
	}

	public List<Item> getItems(String theUser) throws Exception {
		String usr = theUser.replaceAll("[-+.^:,]","");
		List<Item> items = new ArrayList<>();

		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;

		try {
			// get a connection
			myConn = dataSource.getConnection();

			// create sql statement
			String sql = "SELECT * FROM `items` where DATE(timestamp) = CURDATE() and user=?";

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
				String stuff = myRs.getString("stuff");
				String quantity = myRs.getString("quantity");
				String unit = myRs.getString("unit");

				// create new student object
				Item tempItem = new Item(user, cname, cmob, unit, quantity, stuff);

				// add it to the list of students
				items.add(tempItem);
			}

			return items;
		} finally {
			// close JDBC objects
			close(myConn, myStmt, myRs);
		}
	}

}
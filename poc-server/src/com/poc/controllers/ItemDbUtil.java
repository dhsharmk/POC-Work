package com.poc.controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
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

		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			// get db connection
			myConn = dataSource.getConnection();

			// create sql for insert
			String sql = "insert into items " + "(user, unit, quantity, stuff) " + "values (?, ?, ?, ?)";

			myStmt = myConn.prepareStatement(sql);

			// set the param values for the User
			myStmt.setString(1, theItem.getUser());
			myStmt.setString(2, theItem.getUnit());
			myStmt.setString(3, theItem.getQuantity());
			myStmt.setString(4, theItem.getStuff());

			// execute sql insert
			myStmt.execute();
		} finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
		}
	}
}
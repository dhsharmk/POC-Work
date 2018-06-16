package com.poc.controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.sql.DataSource;

import com.poc.models.User;

public class UserDbUtil {

	private static DataSource dataSource;

	public UserDbUtil(DataSource theDataSource) {
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

	public void addUser(User theUser) throws Exception {

		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			// get db connection
			myConn = dataSource.getConnection();

			// create sql for insert
			String sql = "insert into users " + "(first_name, last_name, email, mobile, password) "
					+ "values (?, ?, ?, ?, ?)";

			myStmt = myConn.prepareStatement(sql);

			// set the param values for the User
			myStmt.setString(1, theUser.getFirstName());
			myStmt.setString(2, theUser.getLastName());
			myStmt.setString(3, theUser.getEmail());
			myStmt.setString(4, theUser.getMobile());
			myStmt.setString(5, theUser.getPassword());

			// execute sql insert
			myStmt.execute();
		} finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
		}
	}

	public void updateUser(User theUser) throws Exception {

		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			// get db connection
			myConn = dataSource.getConnection();

			// create SQL update statement
			String sql = "update users " + "set first_name=?, last_name=?, mobile=?, password=? " + "where email=?";

			// prepare statement
			myStmt = myConn.prepareStatement(sql);

			// set params
			myStmt.setString(1, theUser.getFirstName());
			myStmt.setString(2, theUser.getLastName());
			myStmt.setString(3, theUser.getMobile());
			myStmt.setString(4, theUser.getPassword());
			myStmt.setString(5, theUser.getEmail());

			// execute SQL statement
			myStmt.execute();
		} finally {
			// clean up JDBC objects
			close(myConn, myStmt, null);
		}
	}

	public boolean checkUser(User theUser) throws SQLException {
		// declare connection objects
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		String sql = null;
		boolean check = false;
		try {
			// get db connection
			myConn = dataSource.getConnection();

			// check whether email or mobile entered and set query accordingly
			sql = "select * from users where mobile=? and password=?";
			myStmt = myConn.prepareStatement(sql);
			myStmt.setString(1, theUser.getMobile());
			myStmt.setString(2, theUser.getPassword());
			myStmt.execute();
			myRs = myStmt.getResultSet();
			if (myRs.next()) {
				check = true;
			} else {
				myStmt.close();
				myRs.close();
				sql = "select * from users where email=? and password=?";
				myStmt = myConn.prepareStatement(sql);
				myStmt.setString(1, theUser.getEmail());
				myStmt.setString(2, theUser.getPassword());
				myStmt.execute();
				myRs = myStmt.getResultSet();
				if (myRs.next()) {
					check = true;
				}
			}
		} catch (Exception e) {
			System.out.println("Exception is: " + e);
		} finally {
			close(myConn, myStmt, myRs);
		}
		return check;
	}
	
	public User getUser(String theUserName) throws Exception {
		User user = null;

		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;

		try {

			// get connection to database
			myConn = dataSource.getConnection();

			// create sql to get selected student
			String sql = "select * from users where email=? or mobile=?";

			// create prepared statement
			myStmt = myConn.prepareStatement(sql);

			// set params
			myStmt.setString(1, theUserName);
			myStmt.setString(2, theUserName);

			// execute statement
			myRs = myStmt.executeQuery();

			// retrieve data from result set row
			if (myRs.next()) {
				String firstName = myRs.getString("first_name");
				String lastName = myRs.getString("last_name");
				String email = myRs.getString("email");
				String mobile = myRs.getString("mobile");
				String password = myRs.getString("password");

				// use the studentId during construction
				user = new User(firstName, lastName, email, mobile, password);
			} else {
				throw new Exception("Could not find student id: " + theUserName);
			}

			return user;
		} finally {
			// clean up JDBC objects
			close(myConn, myStmt, myRs);
		}
	}
}
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Home</title>
    </head>
    <body>
    	<%
    		Cookie[] cks = request.getCookies();
    		if (cks != null) {
    			for (int i = 0; i < cks.length; i++) {
    				String name = cks[i].getName();
    				String value = cks[i].getValue();
    				if (name.equals("email")) {
    					session.setAttribute("CURRENT_USER_EMAIL", cks[i].getValue());
    				}
    				if (name.equals("fname")) {
    					session.setAttribute("CURRENT_USER_FIRST_NAME", cks[i].getValue());
    				}
    				if (name.equals("lname")) {
    					session.setAttribute("CURRENT_USER_LAST_NAME", cks[i].getValue());
    				}
    				if (name.equals("mob")) {
    					session.setAttribute("CURRENT_USER_MOBILE", cks[i].getValue());
    				}
    				if (name.equals("pass")) {
    					session.setAttribute("CURRENT_USER_PASSWORD", cks[i].getValue());
    				}
    				if (i == (cks.length - 1)) // if all cookie are not valid redirect to error page
    				{
    					response.sendRedirect("user-login.jsp");
    					return; // to stop further execution
    				}
    				i++;
    			}
    			response.sendRedirect("preview-items.jsp");
    		} else {
    			response.sendRedirect("user-login.jsp");
    			return; // to stop further execution
    		}
    	%>
    </body>
    </html>
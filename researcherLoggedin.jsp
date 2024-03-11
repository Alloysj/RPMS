<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection.*" %>
<%@ page import="java.sql.DriverManager.*" %>
<%@ page import="java.sql.PreparedStatement.*" %>
<%@ page import="java.sql.ResultSet.*" %>
<%@ page import="java.sql.SQLException.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>EEMS</title>
        <link rel="stylesheet" href="researcher.css"/>
    </head>
    <body>
        <h1>Welcome, researcher 100</h1>

        <a href="editResearcher.jsp?researcherId=300">view and update your profile</a>
        <a href="projectDetails.jsp" target="_blank">enter your project</a>
        <h2>Your Project</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>Project ID</th>
                    <th>Project Name</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Project Funder</th>
                    <th>Amount Funded(Ksh)</th>
                    <th>Project Field</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    
                    // Define database connection details
                    String jdbcUrl = "jdbc:mysql://localhost/rpms";
                    String dbUsername = "root";
                    String dbPassword = "admin";

                    Connection connection = null;
                    PreparedStatement statement = null;
                    ResultSet resultSet = null;

                    try {
                        // Establish database connection
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

                        // Define SQL query to retrieve project information
                        String sql = "SELECT * FROM projects";

                        // Prepare and execute the statement
                        statement = connection.prepareStatement(sql);
                        resultSet = statement.executeQuery();
                        
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/rpms", "root", "admin");
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT * FROM projects");

                        // Process the result set and display project information in the table
                        while (resultSet.next()) {
                            out.println("<tr>");
                            out.println("<td>" + resultSet.getString("project_id") + "</td>");
                            out.println("<td>" + resultSet.getString("name") + "</td>");
                            out.println("<td>" + resultSet.getString("start_date") + "</td>");
                            out.println("<td>" + resultSet.getString("end_date") + "</td>");
                            out.println("<td>" + resultSet.getString("project_funder") + "</td>");
                            out.println("<td>" + resultSet.getString("amount_funded") + "</td>");
                            out.println("<td>" + resultSet.getString("field") + "</td>");
                            out.println("<td><a href=\"updateProject.jsp?projectId=" + resultSet.getString("projectId") + "\">Update</a></td>");
                            out.println("</tr>");
                        }
                    } catch (SQLException | ClassNotFoundException e) {
                        e.printStackTrace();
                    } finally {
                        // Close resources
                        if (resultSet != null) {
                            try {
                                resultSet.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                        if (statement != null) {
                            try {
                                statement.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                        if (connection != null) {
                            try {
                                connection.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    }
                %>
            </tbody>

            <%
        
               
                    String expense = request.getParameter("expense");
                    String expenseAmt = request.getParameter("expenseAmt");
            %>
        </table>

        <table border="1" cellpadding="2">
            <thead>
                <tr>
                    <th>Expense name</th>
                    <th>Amount</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%= expense%></td>
                    <td><%= expenseAmt %></td>
                </tr>
            </tbody>
        </table>

        <h2>Enter Project Expenses</h2>
        <form action="researcherLoggedin.jsp" method="post">
            <input type="hidden" name="projectId" value="3]">
            <table>
                <tr>
                    <td>Expense Name:</td>
                    <td><input type="text" name="expense" required></td>
                </tr>
                <tr>
                    <td>Amount:</td>
                    <td><input type="number" name="expenseAmt" required></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Add Expense"></td>
                </tr>
            </table>
        </form>
    </body>
</html>

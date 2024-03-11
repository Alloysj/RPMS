
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EEMS</title>
        <link rel="stylesheet" href="researcher.css"/>
    </head>
    <body>
        <%@include file="header.jsp" %>

        <h1>Projects</h1>
        <table border="1">

            <thead>
                <tr>
                    <th>Project ID</th>
                    <th>Project Name</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Funder Name</th>
                    <th>Funded Amount</th>
                    <th>Area</th>

                </tr>
            </thead>
            <tbody>
                <%
            
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
        </table>

    </body>
</html>


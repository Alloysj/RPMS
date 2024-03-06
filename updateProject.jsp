<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<%@page import= "java.util.Date.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Researcher Information</title>
    <link rel="stylesheet" href="researcher.css"/>
</head>
<body>
    <h1>Edit project Information</h1>
    <%
        // Get the funderId parameter from the request
        String projectId = request.getParameter("projectId");
        
        // JDBC URL and database credentials
        String jdbcUrl = "jdbc:mysql://localhost/rpms";
        String username = "root";
        String password = "admin";

        // Connection, PreparedStatement, and ResultSet objects
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the database connection
            connection = DriverManager.getConnection(jdbcUrl, username, password);

            // Prepare SQL statement to select the funder information by ID
            String sql = "SELECT * FROM projects WHERE projectId=?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, projectId);

            // Execute the query
            resultSet = statement.executeQuery();

            // Check if a record with the given ID exists
            if (resultSet.next()) {
                // Retrieve funder information
                String name = resultSet.getString("name");
                String startDate = resultSet.getString("start_date");
                String endDate = resultSet.getString("end_date");
                String amountFunded = resultSet.getString("amount_funded");
                String projectFunder = resultSet.getString("project_funder");
                String field = resultSet.getString("field");

                // Display a form to edit funder information
    %>
                <form method="post" action="UpdateResearcherServlet">
                    <input type="hidden" name="projectId" value="<%= projectId %>">
                    <label>project name:</label><br>
                    <input type="text" name="name" value="<%= name %>"><br>
                    <label>start date</label><br>
                    <input type="date" name="startDate" value="<%= startDate %>"><br>
                    <label>end date</label><br>
                    <input type="date" name="endDate" value="<%= endDate %>"><br>
                    <label>amount funded:</label><br>
                    <input type="number" name="amountFunded" value="<%= amountFunded %>"><br>
                    <label>project funder :</label><br>
                    <input type="text" name="projectFunder" value="<%= projectFunder %>"><br>
                    <label>project field :</label><br>
                    <input type="text" name="field" value="<%= field %>"><br>
                    <input type="submit" value="Update">
                </form>
    <%
            } else {
                // Display error message if no record found with the given ID
    %>
                <p>No project found with ID <%= projectId %>.</p>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
    <br>
    <a href="researchers.jsp">Back to Home</a>
    
    <%-- Scriptlet to handle redirection after successful update --%>
    <%
        // Check if the request parameter 'updated' is present
        if (request.getParameter("updated") != null) {
            // Redirect back to funders.jsp after successful update
            response.sendRedirect("projects.jsp");
        }
    %>
</body>
</html>


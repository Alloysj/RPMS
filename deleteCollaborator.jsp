<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Collaborator Information</title>
    <link rel="stylesheet" href="researcher.css"/>
</head>
<body>
    <h1>Delete Collaborator Information</h1>
    <%
         // Get the funderId parameter from the request
        String collaboratorId = request.getParameter("collaboratorId");
                
        // JDBC URL and database credentials
        String jdbcUrl = "jdbc:mysql://localhost/rpms";
        String username = "root";
        String password = "admin";

        // Connection and PreparedStatement objects
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the database connection
            connection = DriverManager.getConnection(jdbcUrl, username, password);

            // Prepare SQL statement to delete the funder by ID
            String sql = "DELETE FROM collaborators WHERE collaboratorId=?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, collaboratorId);

            // Execute the query
            int rowsAffected = statement.executeUpdate();

            // Display success or error message
            if (rowsAffected > 0) {
    %>
                <p class="message">Collaborator with ID <%= collaboratorId %> deleted successfully.</p>
    <%
            } else {
    %>
                <p class="message">Error deleting Collaborator with ID <%= collaboratorId %>.</p>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
    <br>
    <a href="collaborators.jsp">Back to Home</a>
</body>
</html>
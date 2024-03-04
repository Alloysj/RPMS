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
    <title>Edit Funder Information</title>
    <link rel="stylesheet" href="researcher.css"/>
</head>
<body>
    <h1>Edit Funder Information</h1>
    <%
        // Get the funderId parameter from the request
        String funderId = request.getParameter("funderId");
        
        // JDBC URL and database credentials
        String jdbcUrl = "jdbc:mysql://localhost/funders";
        String username = "root";
        String password = "";

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
            String sql = "SELECT * FROM records WHERE funderId=?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, funderId);

            // Execute the query
            resultSet = statement.executeQuery();

            // Check if a record with the given ID exists
            if (resultSet.next()) {
                // Retrieve funder information
                String name = resultSet.getString("name");
                String status = resultSet.getString("status");
                String country = resultSet.getString("country");
                String totalFunds = resultSet.getString("totalFunds");

                // Display a form to edit funder information
    %>
                <form method="post" action="UpdateFunderServlet">
                    <input type="hidden" name="funderId" value="<%= funderId %>">
                    <label>Name:</label><br>
                    <input type="text" name="name" value="<%= name %>"><br>
                    <label>Status:</label><br>
                    <input type="text" name="status" value="<%= status %>"><br>
                    <label>Country:</label><br>
                    <input type="text" name="country" value="<%= country %>"><br>
                    <label>Total Funds:</label><br>
                    <input type="text" name="totalFunds" value="<%= totalFunds %>"><br>
                    <input type="submit" value="Update">
                </form>
    <%
            } else {
                // Display error message if no record found with the given ID
    %>
                <p>No funder found with ID <%= funderId %>.</p>
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
    <a href="funders.jsp">Back to Home</a>
    
    <%-- Scriptlet to handle redirection after successful update --%>
    <%
        // Check if the request parameter 'updated' is present
        if (request.getParameter("updated") != null) {
            // Redirect back to funders.jsp after successful update
            response.sendRedirect("funders.jsp");
        }
    %>
</body>
</html>

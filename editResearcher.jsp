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
    <title>Edit Researcher Information</title>
    <link rel="stylesheet" href="researcher.css"/>
</head>
<body>
    <h1>Edit Researcher Information</h1>
    <%
        // Get the funderId parameter from the request
        String researcherId = request.getParameter("researcherId");
        
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
            String sql = "SELECT * FROM researchers WHERE researcherId=?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, researcherId);

            // Execute the query
            resultSet = statement.executeQuery();

            // Check if a record with the given ID exists
            if (resultSet.next()) {
                // Retrieve funder information
                String fName = resultSet.getString("fName");
                String lName = resultSet.getString("lName");
                String project = resultSet.getString("project");
                String department = resultSet.getString("department");
                String faculty = resultSet.getString("faculty");

                // Display a form to edit funder information
    %>
                <form method="post" action="UpdateResearcherServlet">
                    <input type="hidden" name="researcherId" value="<%= researcherId %>">
                    <label>fName:</label><br>
                    <input type="text" name="fName" value="<%= fName %>"><br>
                    <label>lName:</label><br>
                    <input type="text" name="lName" value="<%= lName %>"><br>
                    <label>project:</label><br>
                    <input type="text" name="project" value="<%= project %>"><br>
                    <label>department :</label><br>
                    <input type="text" name="department" value="<%= department %>"><br>
                    <label>faculty :</label><br>
                    <input type="text" name="faculty" value="<%= faculty %>"><br>
                    <input type="submit" value="Update">
                </form>
    <%
            } else {
                // Display error message if no record found with the given ID
    %>
                <p>No resarcher found with ID <%= researcherId %>.</p>
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
            response.sendRedirect("researchers.jsp");
        }
    %>
</body>
</html>


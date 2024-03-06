import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/projectServlet")
public class projectServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // JDBC URL and database credentials
        String jdbcUrl = "jdbc:mysql://localhost/rpms";
        String username = "root";
        String password = "admin";

        // Get parameters from the request
        String projectName = request.getParameter("name");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String amountFunded = request.getParameter("amountFunded");
        String funderName = request.getParameter("funderName");
        String field = request.getParameter("field");

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            connection = DriverManager.getConnection(jdbcUrl, username, password);

            // Prepare the SQL query (INSERT statement)
            String sql = "INSERT INTO projects(name, start_date, end_date, amount_funded, project_funder, field) VALUES (?, ?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, projectName);
            statement.setString(2, startDate);
            statement.setString(3, endDate);
            statement.setString(4, amountFunded);
            statement.setString(5, funderName);
            statement.setString(6, field);

            // Execute the INSERT statement
            int rowsAffected = statement.executeUpdate();

            // Prepare a separate SELECT query to fetch and display records
            sql = "SELECT * FROM researchers";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();

            // Store data in request attributes for JSP access
            request.setAttribute("projectList", resultSet); // List of researchers data
            request.setAttribute("message", rowsAffected > 0 ? "Record added successfully!" : "Error inserting record!");

            // Forward request to JSP for display
            RequestDispatcher dispatcher = request.getRequestDispatcher("/researcherLoggedin.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e); // Re-throw as ServletException
        } finally {
            // Close resources (in a finally block for guaranteed execution)
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                // Log or handle the exception if closing resources fails
                e.printStackTrace();
            }
        }
    }
}

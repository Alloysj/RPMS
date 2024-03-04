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

@WebServlet("/researcherServlet")
public class researcherServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // JDBC URL and database credentials
        String jdbcUrl = "jdbc:mysql://localhost/rpms";
        String username = "root";
        String password = "";

        // Get parameters from the request
        String researcherId = request.getParameter("researcherId");
        String fName = request.getParameter("fName");
        String lName = request.getParameter("lName");
        String project = request.getParameter("project");
        String department = request.getParameter("department");
        String faculty = request.getParameter("faculty");

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            connection = DriverManager.getConnection(jdbcUrl, username, password);

            // Prepare the SQL query (INSERT statement)
            String sql = "INSERT INTO researchers(researcherId, fName, lName, project, department, faculty) VALUES (?, ?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, researcherId);
            statement.setString(2, fName);
            statement.setString(3, lName);
            statement.setString(4, project);
            statement.setString(5, department);
            statement.setString(6, faculty);

            // Execute the INSERT statement
            int rowsAffected = statement.executeUpdate();

            // Prepare a separate SELECT query to fetch and display records
            sql = "SELECT * FROM researchers";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();

            // Store data in request attributes for JSP access
            request.setAttribute("researcherList", resultSet); // List of researchers data
            request.setAttribute("message", rowsAffected > 0 ? "Record added successfully!" : "Error inserting record!");

            // Forward request to JSP for display
            RequestDispatcher dispatcher = request.getRequestDispatcher("/researchers.jsp");
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

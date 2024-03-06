import java.io.IOException;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;


@WebServlet("/FundersServlet")
public class FundersServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // JDBC URL and database credentials
        String jdbcUrl = "jdbc:mysql://localhost/rpms";
        String username = "root";
        String password = "admin";

        // Get parameters from the request
        String name = request.getParameter("name");
        String status = request.getParameter("status");
        String country = request.getParameter("country");
        String totalFunds = request.getParameter("totalFunds");

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // Load the MySQL JDBC driver (assuming driver is in classpath)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            connection = DriverManager.getConnection(jdbcUrl, username, password);

            // Prepare the SQL query (INSERT statement)
            String sql = "insert into funders(name, status, country, totalFunds) values (?, ?, ?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, status);
            statement.setString(3, country);
            statement.setString(4, totalFunds);

            // Execute the INSERT statement
            int rowsAffected = statement.executeUpdate();

            // Prepare a separate SELECT query to fetch and display records
            sql = "select * from funders";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();

            // Store data in request attributes for JSP access
            request.setAttribute("funderList", resultSet); // List of funders data
            request.setAttribute("message", rowsAffected > 0 ? "Record added successfully!" : "Error inserting record!");

            // Forward request to JSP for display
            RequestDispatcher dispatcher = request.getRequestDispatcher("/funders.jsp");
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
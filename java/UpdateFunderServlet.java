
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

@WebServlet("/UpdateFunderServlet")
public class UpdateFunderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // JDBC URL and database credentials
        String jdbcUrl = "jdbc:mysql://localhost/funders";
        String username = "root";
        String password = "";

        // Get parameters from the request
        String funderId = request.getParameter("funderId");
        String name = request.getParameter("name");
        String status = request.getParameter("status");
        String country = request.getParameter("country");
        String totalFunds = request.getParameter("totalFunds");

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            // Connect to the database
            connection = DriverManager.getConnection(jdbcUrl, username, password);

            // Prepare the SQL query (UPDATE statement)
            String updateSql = "UPDATE records SET name=?, status=?, country=?, totalFunds=? WHERE funderId=?";
            statement = connection.prepareStatement(updateSql);
            statement.setString(1, name);
            statement.setString(2, status);
            statement.setString(3, country);
            statement.setString(4, totalFunds);
            statement.setString(5, funderId);

            // Execute the UPDATE statement
            int rowsAffected = statement.executeUpdate();

            // Check if any rows were affected
            if (rowsAffected > 0) {
                // Prepare a separate SELECT query to fetch and display records
                String selectSql = "SELECT * FROM records";
                try (PreparedStatement selectStatement = connection.prepareStatement(selectSql)) {
                    // Execute the SELECT query
                    ResultSet updatedResultSet = selectStatement.executeQuery();

                    // Store the updated data in request attributes for JSP access
                    request.setAttribute("funderList", updatedResultSet); // Updated list of funders data
                    request.setAttribute("message", "Record updated successfully!"); // Success message

                    // Forward request to funders.jsp for display
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/funders.jsp");
                    dispatcher.forward(request, response);
                } catch (SQLException e) {
                    // Handle SQL exception
                    e.printStackTrace();
                    response.sendRedirect("funders.jsp?message=Failed+to+fetch+updated+data");
                }
            } else {
                // Redirect back to funders.jsp with a failure message
                response.sendRedirect("funders.jsp?message=Failed+to+update+record");
            }
        } catch (SQLException e) {
            // Handle SQL exception
            e.printStackTrace();
        } finally {
            // Close resources (in a finally block for guaranteed execution)
            try {
                if (statement != null)
                    statement.close();
                if (connection != null)
                    connection.close();
            } catch (SQLException e) {
                // Log or handle the exception if closing resources fails
                e.printStackTrace();
            }
        }
    }
}

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

/**
 *
 * @author Everlyne
 */
@WebServlet(urlPatterns = {"/UpdateResearcherServlet"})
public class UpdateResearcherServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         // JDBC URL and database credentials
        String jdbcUrl = "jdbc:mysql://localhost/rpms";
        String username = "root";
        String password = "admin";

        // Get parameters from the request
        String researcherId = request.getParameter("researcherId");
        String fName = request.getParameter("fName");
        String lName = request.getParameter("lName");
        String project = request.getParameter("project");
        String department = request.getParameter("department");
        String faculty = request.getParameter("faculty");

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            // Connect to the database
            connection = DriverManager.getConnection(jdbcUrl, username, password);

            // Prepare the SQL query (UPDATE statement)
            String updateSql = "UPDATE researchers SET fName=?, lName=?, project=?, department=?, faculty=? WHERE funderId=?";
            statement = connection.prepareStatement(updateSql);
            statement.setString(1, fName);
            statement.setString(2, lName);
            statement.setString(3, project);
            statement.setString(4, department);
            statement.setString(5, researcherId);
            statement.setString(6, faculty);

            // Execute the UPDATE statement
            int rowsAffected = statement.executeUpdate();

            // Check if any rows were affected
            if (rowsAffected > 0) {
                // Prepare a separate SELECT query to fetch and display records
                String selectSql = "SELECT * FROM researchers";
                try (PreparedStatement selectStatement = connection.prepareStatement(selectSql)) {
                    // Execute the SELECT query
                    ResultSet updatedResultSet = selectStatement.executeQuery();

                    // Store the updated data in request attributes for JSP access
                    request.setAttribute("researcherList", updatedResultSet); // Updated list of funders data
                    request.setAttribute("message", "Record updated successfully!"); // Success message

                    // Forward request to funders.jsp for display
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/researchers.jsp");
                    dispatcher.forward(request, response);
                } catch (SQLException e) {
                    // Handle SQL exception
                    e.printStackTrace();
                    response.sendRedirect("researchers.jsp?message=Failed+to+fetch+updated+data");
                }
            } else {
                // Redirect back to funders.jsp with a failure message
                response.sendRedirect("researchers.jsp?message=Failed+to+update+record");
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

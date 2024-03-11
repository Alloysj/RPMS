import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // JDBC URL and database credentials
    private static final String JDBC_URL = "jdbc:mysql://localhost/rpms";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "admin";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String researcherId = request.getParameter("txtId");
        String password = request.getParameter("txtpwd");

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a database connection
            Connection connection = DriverManager.getConnection(JDBC_URL, DB_USERNAME, DB_PASSWORD);

            // Prepare and execute the SQL query
            String sql = "SELECT password FROM researchers WHERE researcherId = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, researcherId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String storedPassword = resultSet.getString("password");
                if (storedPassword.equals(password)) {
                    // Successful login
                    response.sendRedirect("researcherLoggedin.jsp");
                } else {
                    // Incorrect password
                    request.setAttribute("errorMessage", "Incorrect password. Please try again.");
                    request.getRequestDispatcher("researcherLogin.jsp").forward(request, response);
                }
            } else {
                // Researcher ID not found
                request.setAttribute("errorMessage", "Researcher ID not found. Please check your ID.");
                request.getRequestDispatcher("researcherLogin.jsp").forward(request, response);
            }

            // Clean up resources
            resultSet.close();
            preparedStatement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().write("An error occurred. Please try again later.");
        }
    }
}

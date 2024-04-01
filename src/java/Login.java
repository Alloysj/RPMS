import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
//import jakarta.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import javaBeansClasses.ProjectManager;
import javaBeansClasses.ResearcherManager;


@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String researcherId = request.getParameter("txtId");
        String password = request.getParameter("txtpwd");
        DataSource dataSource;

        try {
            // Obtain a DataSource using JNDI lookup
            
            InitialContext initContext = new InitialContext();
            dataSource = (DataSource) initContext.lookup("java:comp/env/jdbc/rpms1");

            // Obtain a connection from the DataSource
            try (Connection connection = dataSource.getConnection()) {
                // Prepare and execute the SQL query
                String sql = "SELECT password FROM researchers WHERE researcherId = ?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                    preparedStatement.setString(1, researcherId);
                    try (ResultSet resultSet = preparedStatement.executeQuery()) {
                        if (resultSet.next()) {
                            String storedPassword = resultSet.getString("password");
                            if (storedPassword.equals(password)) {
                                // Successful login
                                HttpSession session = request.getSession();
                                session.setAttribute("researcherId", researcherId);
                                response.sendRedirect("researcherProfile.jsp");
                            } else {
                                // Incorrect password
                                request.setAttribute("errorMessage", "Incorrect password. Please try again.");
                                response.sendRedirect("login.jsp");
                            }
                        } else {
                            // Researcher ID not found
                            request.setAttribute("errorMessage", "Researcher ID not found. Please check your ID.");
                            response.sendRedirect("login.jsp");
                        }
                    }
                }
            }
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
            response.getWriter().write("An error occurred. Please try again later.");
        }
    }
}

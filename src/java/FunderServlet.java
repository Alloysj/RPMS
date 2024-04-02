import java.io.IOException;
import java.sql.SQLException;
import javax.naming.NamingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javaBeansClasses.Funders;
import javaBeansClasses.FunderManager;

@WebServlet("/FunderServlet")
public class FunderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the form
        String name = request.getParameter("name");
        int totalFunds = Integer.parseInt(request.getParameter("totalFunds"));
        String status = request.getParameter("status");
        String country = request.getParameter("country");

        // Create a Funders object with the retrieved parameters
        Funders newFunder = new Funders();
        newFunder.setName(name);
        newFunder.setTotalFunds(totalFunds);
        newFunder.setStatus(status);
        newFunder.setCountry(country);

        // Create a FunderManager object to interact with the database
        FunderManager funderManager;
        try {
            funderManager = new FunderManager();
            // Call the addFunder method to insert the new funder into the database
            funderManager.addFunder(newFunder);
            // Redirect to a success page if insertion is successful
            response.sendRedirect("funders.jsp");
        } catch (NamingException | SQLException e) {
            // Handle exceptions, e.g., database connection errors
            e.printStackTrace(); // Print the stack trace for debugging purposes
            // Redirect to an error page if insertion fails
            response.sendRedirect("error.jsp");
        }
    }
}

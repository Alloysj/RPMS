import java.io.IOException;
import java.sql.SQLException;
import javax.naming.NamingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javaBeansClasses.researchers;
import javaBeansClasses.ResearcherManager;

@WebServlet("/ResearcherServlet")
public class ResearcherServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the form
        String fName = request.getParameter("fName");
        String lName = request.getParameter("lName");
        String faculty = request.getParameter("faculty");
        String department = request.getParameter("department");

        // Create object with the retrieved parameters
        researchers newResearcher = new researchers();
        newResearcher.setfName(fName);
        newResearcher.setlName(lName);
        newResearcher.setFaculty(faculty);
        newResearcher.setDepartment(department);

        // Create a FunderManager object to interact with the database
        ResearcherManager researcherManager;
        try {
            researcherManager = new ResearcherManager();
            // Call the addFunder method to insert the new funder into the database
            researcherManager.addResearcher(newResearcher);
            // Redirect to a success page if insertion is successful
            response.sendRedirect("researchers.jsp");
        } catch (NamingException | SQLException e) {
            // Handle exceptions, e.g., database connection errors
            e.printStackTrace(); // Print the stack trace for debugging purposes
            // Redirect to an error page if insertion fails
            response.sendRedirect("error.jsp");
        }
    }
}

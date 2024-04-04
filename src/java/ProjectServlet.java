import java.io.IOException;
import java.sql.SQLException;
import javax.naming.NamingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import javaBeansClasses.Projects;
import javaBeansClasses.ProjectManager;

@WebServlet("/ProjectServlet")
public class ProjectServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters
        String name = request.getParameter("name");
        int researcherId = Integer.parseInt(request.getParameter("researcherId"));
        Date start_date = java.sql.Date.valueOf(request.getParameter("start_date"));
        Date end_date = java.sql.Date.valueOf(request.getParameter("end_date"));
        int funderId = Integer.parseInt(request.getParameter("funderId"));
        int amountFunded = Integer.parseInt(request.getParameter("amount_funded"));
        String field = request.getParameter("field");

        // Create a Projects object
        Projects newProject = new Projects();
        newProject.setName(name);
        newProject.setResearcherId(researcherId);
        newProject.setStart_date(start_date);
        newProject.setEnd_date(end_date);
        newProject.setFunderId(funderId);
        newProject.setAmount_funded(amountFunded);
        newProject.setField(field);

        // Create a ProjectManager object
        ProjectManager projectManager;
        try {
            projectManager = new ProjectManager();
            // Call the addProject method
            projectManager.addProject(newProject);
            
            response.sendRedirect("projects.jsp");
        } catch (NamingException | SQLException e) {
            // Handle exceptions
            e.printStackTrace(); 
            // Redirect to an error page if insertion fails
            response.sendRedirect("error.jsp");
        }
    }
}

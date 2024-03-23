import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import javaBeansClasses.ProjectManager;
import javaBeansClasses.Projects;
import java.sql.Date;

@WebServlet("/addProject")
public class addProject extends HttpServlet {
    private ProjectManager projectManager; // ProjectManager instance

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve form data
            String name = request.getParameter("name");
            Date start_date = java.sql.Date.valueOf(request.getParameter("start_date"));
            Date end_date = java.sql.Date.valueOf(request.getParameter("end_date"));
            String field = request.getParameter("field");
            int amountFunded = Integer.parseInt(request.getParameter("amount_funded"));
            String projectFunder = request.getParameter("project_funder");

            // Create a Project object 
            Projects project = new Projects();
            project.setName(name);
            project.setStart_date(start_date);
            project.setEnd_date(end_date);
            project.setField(field);
            project.setAmount_funded(amountFunded);
            project.setFunderId(projectFunder);

            // Insert the project into the database using your ProjectManager
            projectManager.addProject(project);

            // Redirect to a success page or display a success message
            response.sendRedirect("researcherProfile.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions 
            
            response.sendRedirect("error.jsp");
        }
    }
}

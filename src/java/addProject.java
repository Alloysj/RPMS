
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import javaBeansClasses.ProjectManager;
import javaBeansClasses.Projects;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;

@WebServlet("/addResearcher")
public class addResearcher extends HttpServlet {

    private ProjectManager projectManager; // ProjectManager instance

    public void init() {
        try {
            projectManager = new ProjectManager();
        } catch (NamingException ex) {
            Logger.getLogger(addResearcher.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve form data
            Projects project = new Projects();
            project.setProject_id(Integer.parseInt(request.getParameter("project_id")));
            project.setAmount_funded(Integer.parseInt(request.getParameter("amount_funded")));
            project.setName(request.getParameter("name"));
            project.setStart_date(java.sql.Date.valueOf(request.getParameter("start_date")));
            project.setEnd_date(java.sql.Date.valueOf(request.getParameter("end_date")));
            project.setProject_id(Integer.parseInt(request.getParameter("researcherId")));
            project.setFunderId(Integer.parseInt(request.getParameter("funderId")));

            project.setField(request.getParameter("field"));
            // Set other fields...
            projectManager.addProject(project);
            response.sendRedirect("researcherProfile.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions 

            response.sendRedirect("error.jsp");
        }
    }
}

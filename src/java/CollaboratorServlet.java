import java.io.IOException;
import java.sql.SQLException;
import javax.naming.NamingException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javaBeansClasses.Collaborators;
import javaBeansClasses.CollaboratorManager;

@WebServlet("/CollaboratorServlet")
public class CollaboratorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the form
        String fName = request.getParameter("fName");
        String lName = request.getParameter("lName");
        String project = request.getParameter("project");
       

        // Create a collaborators object with the retrieved parameters
        Collaborators newCollaborator = new Collaborators();
        newCollaborator.setfName(fName);
        newCollaborator.setlName(lName);
        newCollaborator.setProject(project);
        

        // Create a CollaboratorManager object to interact with the database
        CollaboratorManager collaboratorManager;
        try {
            collaboratorManager = new CollaboratorManager();
            // Call the addCollaborator method to insert the new funder into the database
            collaboratorManager.addCollaborator(newCollaborator);
            // Redirect to a success page if insertion is successful
            response.sendRedirect("collaborators.jsp");
        } catch (NamingException | SQLException e) {
            // Handle exceptions, e.g., database connection errors
            e.printStackTrace(); 
            // Redirect to an error page if insertion fails
            response.sendRedirect("error.jsp");
        }
    }
}

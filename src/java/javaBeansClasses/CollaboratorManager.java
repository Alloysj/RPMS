package javaBeansClasses;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author user
 */
public class CollaboratorManager {

    private DataSource dataSource;

    public CollaboratorManager() throws NamingException {
        InitialContext initContext = new InitialContext();
        dataSource = (DataSource) initContext.lookup("java:comp/env/jdbc/rpms1");
    }

    public Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }

    // methods to interact with the database
    public List<Collaborators> getCollaborators() throws SQLException {
        List<Collaborators> collaborators = new ArrayList<>();
        String sql = "SELECT * FROM collaborators";
        try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Collaborators collaborator = new Collaborators();
                collaborator.setCollaboratorId(rs.getInt("collaboratorId"));
                collaborator.setfName(rs.getString("fName"));
                collaborator.setlName(rs.getString("lName"));
                collaborator.setProject("project");
                collaborator.setProject_id(rs.getInt("project_id"));
                // 
                collaborators.add(collaborator);
            }
        }
        return collaborators;
    }

    public void addCollaborator(Collaborators collaborator) throws SQLException {
        String sql = "INSERT INTO collaborators (collaboratorId, fName, lName, project, project_id) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = dataSource.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, collaborator.getCollaboratorId());
            stmt.setString(2, collaborator.getfName());
            stmt.setString(3, collaborator.getlName());
            stmt.setString(4, collaborator.getProject());
            stmt.setInt(5, collaborator.getProject_id());

            stmt.executeUpdate();
        }
    }

}

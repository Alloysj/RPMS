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

public class ProjectManager {
    private DataSource dataSource;

    public ProjectManager() throws NamingException {
        InitialContext initContext = new InitialContext();
        dataSource = (DataSource) initContext.lookup("java:comp/env/jdbc/rpms1");
    }

    public Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }

    // methods to interact with the database
    public List<Projects> getProjects() throws SQLException {
        List<Projects> projects = new ArrayList<>();
        String sql = "SELECT * FROM projects";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Projects project = new Projects();
                project.setAmount_funded(rs.getInt("amount_funded"));
                project.setName(rs.getString("name"));
                project.setStart_date(rs.getDate("start_date"));
                project.setEnd_date(rs.getDate("end_date"));
                project.setField(rs.getString("field"));
                // Set other fields...
                projects.add(project);
            }
        }
        return projects;
    }

    public void addProject(Projects project) throws SQLException {
        String sql = "INSERT INTO projects (name, start_date, end_date, field, project_id, amount_funded, researcherId, funderId) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, project.getName());
            stmt.setDate(2, project.getStart_date());
            stmt.setDate(3, project.getEnd_date());
            stmt.setString(4, project.getField());
            stmt.setInt(5, project.getProject_id());
            stmt.setInt(6, project.getAmount_funded());
            stmt.setInt(7, project.getResearcherId());
            stmt.setInt(8, project.getFunderId());
            
            stmt.executeUpdate();
        }
    }
    
    // Retrieve projects by researcher ID
   /* public List<Projects> getProjects(int researcherId) {
        List<Projects> projects = new ArrayList<>();

        try (Connection connection = dataSource.getConnection()) {
            String sql = "SELECT name, start_date, end_date, amount_funded, field FROM projects WHERE researcherId = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, researcherId);
                try (ResultSet resultSet = statement.executeQuery()) {
                    while (resultSet.next()) {
                        int amount_funded = resultSet.getInt("amount_funded");
                        String name = resultSet.getString("name");
                        Date start_date = resultSet.getDate("start_date");
                        Date end_date = resultSet.getDate("end_date");
                        String field = resultSet.getString("field");
                        projects.add(new Projects(name, amount_funded, start_date, end_date, field));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exceptions appropriately (logging, error messages, etc.)
        }

        return projects;
    }*/

}

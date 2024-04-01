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
public class FunderManager {
    private DataSource dataSource;

    public FunderManager() throws NamingException {
        InitialContext initContext = new InitialContext();
        dataSource = (DataSource) initContext.lookup("java:comp/env/jdbc/rpms1");
    }
    
     public Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }

    // Your methods to interact with the database
    public List<Funders> getFunders() throws SQLException {
        List<Funders> funders = new ArrayList<>();
        String sql = "SELECT * FROM funders";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Funders funder = new Funders();
                // get values from database
                funder.setName(rs.getString("name"));
                funder.setFunderId(rs.getInt("funderId"));
                funder.setStatus(rs.getString("status"));
                funder.setTotalFunds(rs.getInt("totalFunds"));
                funder.setCountry(rs.getString("country"));
                // 
                funders.add(funder);
            }
        }
        return funders;
    }

    public void addFunder(Funders funder) throws SQLException {
        String sql = "INSERT INTO funders (name, funderId, status, country, totalFunds) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, funder.getName());
            stmt.setInt(2, funder.getFunderId());
            stmt.setString(3, funder.getStatus());
            stmt.setString(4, funder.getCountry());
            stmt.setInt(5, funder.getTotalFunds());
            //
            stmt.executeUpdate();
        }
    }
}

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EEMS</title>
        <link rel="stylesheet" href="researcher.css"/>
    </head>
    <body>
        <%@ include file="header.jsp" %>

        <h1>researcher Information</h1>
        <%
        String researcherId = request.getParameter("researcherId");
        String fName = request.getParameter("fName");
        String lName = request.getParameter("lName");
        String project = request.getParameter("project");
        String department = request.getParameter("department");
        String faculty = request.getParameter("faculty");

        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/rpms", "root", "");

            // Prepare the SQL query
            String insertQuery = "INSERT INTO researchers (researcherId, fName, lName, project, department, faculty) VALUES (?, ?, ?, ?, ?, ?)";
            pst = con.prepareStatement(insertQuery);

            // Set parameter values
            pst.setString(1, researcherId);
            pst.setString(2, fName);
            pst.setString(3, lName);
            pst.setString(4, project);
            pst.setString(5, department);
            pst.setString(6, faculty);

            // Execute the update
            int rowsAffected = pst.executeUpdate();

            // Print success message (you can redirect to a success page if needed)
            out.println("Record inserted successfully!");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle exceptions (log, display an error message, etc.)
        } 
    
        %>


        <h3>Funder Information</h3>

        <form action="researchers.jsp" method="get">
            <table>
                <tr>
                    <td>researcher ID</td>
                    <td><input type="number" name="researcherId"></td>
                </tr>
                <tr>
                    <td>fName</td>
                    <td><input type="text" name="fName"></td>
                </tr>
                <tr>
                    <td>lName</td>
                    <td><input type="text" name="lName"></td>
                </tr>
                <tr>
                    <td>project</td>
                    <td><input type="text" name="project"></td>
                </tr>
                <tr>
                    <td>department</td>
                    <td><input type="text" name="department"></td>
                </tr>
                <tr>
                    <td>faculty </td>
                    <td><input type="text" name="faculty"></td>
                </tr> 
                <tr>
                    <td></td>
                    <td><input type="submit" value="Submit"></td>
                </tr>

            </table>
        </form> 
        <table border="1">
        <thead>
            <tr>
                <th>Funder ID</th>
                <th>Name</th>
                <th>Status</th>
                <th>Country</th>
                <th>Total Funds</th>
                <th>Edit</th>
                <th>Delete</th>
                
            </tr>
        </thead>    
            <%
                Connection con2;
                PreparedStatement pst2;
                ResultSet rs2;
            
                Class.forName("com.mysql.jdbc.Driver");
                con2 = DriverManager.getConnection("jdbc:mysql://localhost/rpms","root","");
                
                String query = "select * from funders";
                Statement st = con2.createStatement();
                
                rs2 = st.executeQuery(query);
                while (rs2.next()) {
        %>
        <tr>
            <td><%= researcherId %></td>
            <td><%= fName %></td>
            <td><%= lName %></td>
            <td><%= project %></td>
            <td><%= department %></td>
            <td><%= faculty %></td>
            <td>Edit</td>
            <td>Delete</td>
        </tr>
        <%
                }
            rs2.close();
            st.close();
            con2.close();
        %>
    </table>
        <form action="researchers.jsp" method="get">

        </form>       
    </body>
</html>

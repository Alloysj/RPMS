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
        
    <h1>Funders Information</h1>
    <%
            String funderId = request.getParameter ("funderId");
            String name = request.getParameter ("name");
            String status = request.getParameter ("status");
            String country = request.getParameter ("country");
            String totalFunds = request.getParameter ("totalFunds");
               
            Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
            
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/rpms","root","");
            String insertQuery = "insert into funders(funderId,name,status,country,totalFunds)values(?,?,?,?,?)";
            pst = con.prepareStatement(insertQuery);
            
            pst.setString(1, funderId);
            pst.setString(2, name);
            pst.setString(3, status);
            pst.setString(4, country);
            pst.setString(5, totalFunds);
            
            int rowsAffected = pst.executeUpdate();
        %> 
        
        
    <h3>Funder Information</h3>

        <form action="funders.jsp" method="get">
            <table>
                <tr>
                    <td>Funder ID</td>
                    <td><input type="number" name="funderId"></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <td>Country</td>
                    <td><input type="text" name="country"></td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td><input type="text" name="status"></td>
                </tr>
                <tr>
                    <td>Total Funds </td>
                    <td><input type="number" name="totalFunds"></td>
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
            <td><%= funderId %></td>
            <td><%= name %></td>
            <td><%= status %></td>
            <td><%= country %></td>
            <td><%= totalFunds %></td>
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
                <form action="funders.jsp" method="get">
                    
                </form>       
</body>
</html>

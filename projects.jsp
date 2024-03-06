
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EEMS</title>
        <link rel="stylesheet" href="researcher.css"/>
    </head>
    <body>
        <%@include file="header.jsp" %>

        <h1>Projects</h1>
        <table border="1">

            <thead>
                <tr>
                    <th>Project Name</th>
                    <th>Funded Amount</th>
                    <th>Funder Name</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Area</th>

                </tr>
            </thead>
            <tbody>
                <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/rpms", "root", "admin");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM projects");

                while (rs.next()) {
                    String projectName = rs.getString("name");
                    Date startDate = rs.getDate("start_date");
                    Date endDate = rs.getDate("end_date");
                    String funder = rs.getString("project_funder");
                    double fundedAmount = rs.getDouble("funded_amount");
                    String field = rs.getString("field");

                %>
                <tr>
                    <td><%= projectName %></td>
                    <td><%= startDate %></td>
                    <td><%= endDate %></td>
                    <td><%= funder %></td>
                    <td><%= fundedAmount %></td>
                    <td><%= field %></td>
                </tr>
            <%
        }

        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
            %>
          </tbody>
        </table>

    </body>
</html>


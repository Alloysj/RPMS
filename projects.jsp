
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <%
              String project_id = request.getParameter ("projectId");
              String project_name = request.getParameter ("projectName");
              String fundedAmt = request.getParameter ("amountFunded");
              String funder_id = request.getParameter ("projectFunder");
              String startdate = request.getParameter ("projectStartDate");
              String enddate = request.getParameter ("projectEndDate");
              String area = request.getParameter ("projectArea");
                
        %> 
        <h1>Details Updated</h1>
        <table border="1">

            <thead>
                <tr>
                    <th> Project ID</th>
                    <th>Project Name</th>
                    <th>Funded Amount</th>
                    <th>Funder Name</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Area</th>

                </tr>
            </thead>
            <tbody>

                <tr>
                    <td><%= project_id %></td>
                    <td><%= project_name %></td>
                    <td><%= fundedAmt %></td>
                    <td><%= funder_id%></td>
                    <td><%= startdate %></td>
                    <td><%= enddate %></td>
                    <td><%= area %></td>
                </tr>

            </tbody>
        </table>
    </body>
</html>


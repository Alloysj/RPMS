<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EEMS</title>
        <link rel="stylesheet" href="researcher.css"/>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <h1>Researchers</h1>
    <h1>Funders Information</h1>
    <%
              String name = request.getParameter ("name");
              String project = request.getParameter ("project");
              String amountFunding = request.getParameter ("amountFunding");
              String funderID = request.getParameter ("projectFunder");
              String funderCountry = request.getParameter ("funderCountry");
              String status = request.getParameter ("status");
                
        %> 

    <table border="1">
        <thead>
            <tr>
                <th>Name</th>
                <th>Project</th>
                <th>Funder ID</th>
                <th>Funder Country</th>
                <th>Status</th>
                <th>Total Fund</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><%= name %></td>
                <td><%= project %></td>
                <td><%= funderID %></td>
                <td><%= funderCountry %></td>
                <td><%= status %></td>
                <td><%= amountFunding %></td>
            </tr>
        </tbody>
    </table>
</body>
</html>


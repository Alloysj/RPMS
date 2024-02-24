<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Funders</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Funders Information</h1>

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
                <td><%= funderHandler.getName() %></td>
                <td><%= funderHandler.getProject() %></td>
                <td><%= funderHandler.getFunderID() %></td>
                <td><%= funderHandler.getFunderCountry() %></td>
                <td><%= funderHandler.getStatus() %></td>
                <td><%= funderHandler.getTotalFund() %></td>
            </tr>
        </tbody>
    </table>
</body>
</html>


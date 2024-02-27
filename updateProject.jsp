<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Project</title>
    <<link rel="stylesheet" href="researcher.css"/>
</head>
<body>

    <form action="projects.jsp" method="post">
        <input type="hidden" name="projectId" value="<%= request.getParameter("projectId") %>">
        <table>
            <tr>
                <td>Project Name:</td>
                <td><input type="text" name="projectName" value="<%= request.getParameter("projectName") %>" required></td>
            </tr>
            <tr>
                <td>Amount Funded:</td>
                <td><input type="number" name="amountFunded" value="<%= request.getParameter("amountFunded") %>" required></td>
            </tr>
            <tr>
                <td>Project Funder:</td>
                <td><input type="text" name="projectFunder" value="<%= request.getParameter("projectFunder") %>" required></td>
            </tr>
            <tr>
                <td>Project startDate:</td>
                <td><input type="date" name="projectStartDate" value="<%= request.getParameter("projectStartDate") %>" required></td>
            </tr>
            <tr>
                <td>Project endDate:</td>
                <td><input type="date" name="projectEndDate" value="<%= request.getParameter("projectEndDate") %>" required></td>
            </tr>
            <tr>
                <td>Project area:</td>
                <td><input type="text" name="projectArea" value="<%= request.getParameter("projectArea") %>" required></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Update"></td>
            </tr>
        </table>
    </form>
</body>
</html>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EEMS</title>
        <link rel="stylesheet" href="researcher.css"/>
    </head>
    <body>
        <h1>update details</h1>
        <form action="funders.jsp">
            <input type="hidden" name="funderID" value="<%= request.getParameter("funderID") %>">
        <table>
            <tr>
                <td>funder Name:</td>
                <td><input type="text" name="name" value="<%= request.getParameter("name") %>" required></td>
            </tr>
            <tr>
                <td>Amount Funding:</td>
                <td><input type="number" name="amountFunding" value="<%= request.getParameter("amountFunding") %>" required></td>
            </tr>
            <tr>
                <td>country:</td>
                <td><input type="text" name="funderCountry" value="<%= request.getParameter("funderCountry") %>" required></td>
            </tr>
            <tr>
                <td>Status:</td>
                <td><select name="status" size="1" value="<%= request.getParameter("funderStatus") %>" required>
                        <option>Active</option>
                        <option>Not active</option>
                    </select></td>
            </tr>
            <tr>
                <td>Project name:</td>
                <td><input type="text" name="project" value="<%= request.getParameter("projectName") %>" required></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Update"></td>
            </tr>
        </table>
        </form>
    </body>
</html>

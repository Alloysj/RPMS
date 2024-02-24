<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EEMS</title>
        <<link rel="stylesheet" href="researcher.css"/>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <h1>Researchers</h1>
        <%
        //get parameter from the request
        String firstName = request.getParameter("researcherID");
        String firstName = request.getParameter("fName");
        String firstName = request.getParameter("lName");
        String firstName = request.getParameter("project");
        String firstName = request.getParameter("department");
        String firstName = request.getParameter("faculty");
        %>
        <table border="2" width="4" cellspacing="2" cellpadding="2">
            <thead>
                <tr>
                    <th>Researcher ID</th>
                    <th>first name</th>
                    <th>last name</th>
                    <th>project</th>
                    <th>department</th>
                    <th>faculty</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%= researcherID%></td>
                    <td><%= fName %></td>
                    <td><%= lName%></td>
                    <td><%= project%></td>
                    <td><%= department%></td>
                    <td><%= faculty%></td>
                </tr>
                <tr>
                    <td><%= researcherID%></td>
                    <td><%= fName %></td>
                    <td><%= lName%></td>
                    <td><%= project%></td>
                    <td><%= department%></td>
                    <td><%= faculty%></td>
                </tr>
            </tbody>
        </table>

    </body>
</html>

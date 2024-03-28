
<%@ page import="javaBeansClasses.ProjectManager" %>
<%@ page import="javaBeansClasses.Projects" %>
<%@ page import="javaBeansClasses.ResearcherManager" %>
<%@ page import="javaBeansClasses.researchers" %>
<%@ page import="java.util.List" %>

<jsp:useBean id="rpms" scope="page" class="javaBeansClasses.ResearcherManager" />
<jsp:useBean id="rpms1" scope="page" class="javaBeansClasses.ProjectManager" />

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Researcher Profile</title>
        <link rel="stylesheet" href="profiles.css"/>
    </head>
    <body>
        <h1>Researcher Profile</h1>

        <% String researcherId = (String) session.getAttribute("researcherId");%>

        <%-- Retrieve project information from the database based on researcher ID --%>
        <%
            List<Projects> projects = rpms1.getProjects();
       
        %>

        <%-- Display project information in a table --%>
        <table>
            <tr>
                <th>project name</th>
                <th>start date</th>
                <th>end date</th>
                <th>Amount funded</th>
                <th>field</th>
                <th>Action</th>
            </tr>
            <% for (Projects project : projects) { %>
            <tr>
                <td><%= project.getName() %></td>
                <td><%= project.getStart_date() %></td>
                <td><%= project.getEnd_date() %></td>
                <td><%= project.getAmount_funded() %></td>
                <td><%= project.getField() %></td>
                <td>edit</td>
            </tr>
            <% } %>
        </table>

        <%-- If no projects found, display a button to create a new project --%>
        <% if (projects.isEmpty()) { %>
        <form action="/addProject.jsp/">
            <input type="submit" value="Create New Project">
        </form>
        <% } %>

        <form action="addProject.jsp">
            <input type="submit" value="Create New Project">
        </form>
        
        <form action="updateResearcher.jsp">
            <input type="submit" value="Update Your details">
        </form>
    </body>
</html>

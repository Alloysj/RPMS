<%@ page import="java.util.List" %>
<%@ page import="javaBeansClasses.ProjectManager" %>
<%@ page import="javaBeansClasses.Projects" %>
<%
    String researcherId = (String) session.getAttribute("researcherId");
%>

<jsp:useBean id="rpms" scope="page" class="javaBeansClasses.ProjectManager" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="header.jsp" %>
        <title>Projects List</title>
    </head>
    <body>
        <% 
        // Invalidate the session
        if (session != null) {
            session.removeAttribute("reseadcherId");
            session.invalidate();
        }
        HttpServletResponse res = (HttpServletResponse) response;
        res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        res.setHeader("Pragma", "no-cache");
        res.setDateHeader("Expires", 0);
        %>
        <h1>Your Project</h1>
        <table>
            <tr>
                <th>Project Name</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Amount Funded</th>
                <th>Field</th>
                <th>Action</th>
            </tr>
            <% 
                Projects loggedInUserProject = rpms.getProjectLoggedIn(researcherId);
            %>
            <tr>
                <td><%= loggedInUserProject.getName() %></td>
                <td><%= loggedInUserProject.getStart_date() %></td>
                <td><%= loggedInUserProject.getEnd_date() %></td>
                <td><%= loggedInUserProject.getAmount_funded() %></td>
                <td><%= loggedInUserProject.getField() %></td>
                <td><a href="editProject.jsp?project_id=<%= loggedInUserProject.getProject_id() %>">Edit</a></td>
            </tr>
        </table>

        <h2>Other Projects</h2>
        <table border="1">
            <tr>
                <th>Project Name</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Amount Funded</th>
                <th>Principal Investigator</th>
                <th>Field</th>
            </tr>
            <% 
                List<Projects> Projects = rpms.getProjects();
                for (Projects project : Projects) { 
            %>
            <tr>
                <td><%= project.getName() %></td>
                <td><%= project.getStart_date() %></td>
                <td><%= project.getEnd_date() %></td>
                <td><%= project.getAmount_funded() %></td>
                <td><%= project.getfName() %></td>
                <td><%= project.getField() %></td>
            </tr>
            <% } %>
        </table>
        <a href="addProject.jsp">create new project</a>
    </body>
</html>

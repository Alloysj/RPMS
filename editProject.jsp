<%@ page import="java.util.List" %>
<%@ page import="javaBeansClasses.ProjectManager" %>
<%@ page import="javaBeansClasses.Projects" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String researcherId = (String) session.getAttribute("researcherId");
%>

<jsp:useBean id="rpms" scope="page" class="javaBeansClasses.ProjectManager" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit Project</title>
    <link rel="stylesheet" href="profiles.css"/>
</head>
<body>
    
    <% 
                Projects loggedInUserProject = rpms.getProjectLoggedIn(researcherId);
            %>
    <h1>Edit Project</h1>
    <form action="projects.jsp" method="post">
        <input type="hidden" name="project_id" value="<%= request.getParameter("project_id") %>">
        <label for="start_date">start_date:</label>
        <input type="date" id="start_date" name="start_date" value="<%= loggedInUserProject.getStart_date() %>"><br><br>
        <label for="end_date">end_date:</label>
        <input type="date" id="end_date" name="end_date" value="<%= loggedInUserProject.getEnd_date() %>"><br><br>
        <label for="Amount_funded">Amount_funded:</label>
        <input type="text" id="Amount_funded" name="Amount_funded" value="<%= loggedInUserProject.getAmount_funded() %>">
        <label for="projectName">Project Name:</label>
        <input type="text" id="projectName" name="projectName" value="<%= loggedInUserProject.getName() %>">
        <label for="field">field:</label>
        <input type="text" id="field" name="field" value="<%= loggedInUserProject.getField() %>">

        <input type="submit" value="Save Changes">
    </form>
    <a href="projects.jsp">Back to Projects List</a>
</body>
</html>

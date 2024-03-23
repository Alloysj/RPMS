<%@ page import="javaBeansClasses.ProjectManager" %>
<%@ page import="javaBeansClasses.Projects" %>
<%@ page import="javaBeansClasses.ResearcherManager" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


  <%
   // int researcherId = (Integer) request.getAttribute("researcherId");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New project</title>
        <link rel="stylesheet" href="profiles.css"/>
    </head>
    <body>
    <h2>Add New Project</h2>
    

    <form action="addProject" method="post">
        
        <label for="name">Project Name:</label>
        <input type="text" id="name" name="name"><br><br>
        <label for="start_date">start date:</label>
        <input type="date" id="start_date" name="start_date"><br><br>
        <label for="end_date">End date:</label>
        <input type="date" id="end_date" name="end_date"><br><br>
        <label for="project_funder">Select project funder:</label>
        <select id="project_funder" name="project_funder">
            <option value="funder1">funder 1</option>
            <option value="funder1">funder 2</option>
            <option value="funder1">funder 3</option>
            <option value="funder1">funder 4</option>
        </select>
        <br><br>
        <label for="amount_funded">Amount funded:</label>
        <input type="number" id="amount_funded" name="amount_funded"><br><br>
        <label for="field">Project area:</label>
        <input type="text" id="field" name="field"><br><br>
        
        <input type="submit" value="Submit">
    </form>
</body>
</html>

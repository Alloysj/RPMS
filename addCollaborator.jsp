<%@ page import="javaBeansClasses.ProjectManager" %>
<%@ page import="javaBeansClasses.Projects" %>
<%@ page import="java.util.List" %>

<jsp:useBean id="rpms1" scope="page" class="javaBeansClasses.ProjectManager" />

<%
    List<Projects> Projects = rpms1.getProjects();
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Collaborator</title>
    <link rel="stylesheet" href="index.css"/>
    <script>
        function validateForm() {
            var Fname = document.getElementById("fName").value;
            var Lname = document.getElementById("lName").value;
            var project = document.getElementById("project").value;
            
            if (Fname.trim() === "") {
                alert("First Name must not be empty");
                return false;
            }
            if (Lname.trim() === "") {
                alert("Last Name must not be empty");
                return false;
            }
            if (project === "" || project === "Select project") {
                alert("Project must not be empty");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <h2>Add Collaborator</h2>
    <form method="post" action="CollaboratorServlet" onsubmit="return validateForm()">
        <label for="fName">Name:</label>
        <input type="text" id="fName" name="fName" required pattern="[A-Za-z]+" title="Name cannot contain numbers"><br><br>
        
        <label for="lName">Last Name:</label>
        <input type="text" id="lName" name="lName" pattern="[A-Za-z]+" title="Name cannot contain numbers"><br><br>

        <label for="project">Project:</label>
        <select id="project" name="project">
                <% for (Projects project : Projects) { %>
                <option value="<%= project.getName() %>"><%= project.getName() %></option>
                <% } %>
            </select>
        

        <input type="submit" value="Submit">
    </form>
</body>
</html>
<%@ page import="java.util.List" %>
<%@ page import="javaBeansClasses.CollaboratorManager" %>
<%@ page import="javaBeansClasses.Collaborators" %>

<jsp:useBean id="rpms" scope="page" class="javaBeansClasses.Collaborators" />
<jsp:useBean id="rpms1" scope="page" class="javaBeansClasses.CollaboratorManager" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List<Collaborators> collaborators = rpms1.getCollaborators();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
    <%@include file="header.jsp" %>
    <title>Collaborator List</title>
    
</head>
<body>
    <h2>Collaborators</h2>
    <table border="1">
        <tr>
            <th>first name</th>
            <th>last name</th>
            <th>project</th>
            <th>project_id</th>
            
            <!-- More headers if needed -->
        </tr>
        <% for (Collaborators collaborator : collaborators) { %>
        <tr>
            <td><%= collaborator.getfName() %></td>
            <td><%= collaborator.getlName() %></td>
            <td><%= collaborator.getProject() %></td>
            <td><%= collaborator.getProject_id() %></td>
        </tr>
        <% } %>
    </table>
    
    <a href="addCollaborator.jsp">add new collaborator</a>
</body>
</html>
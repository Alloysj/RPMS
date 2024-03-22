<%@ page import="java.util.List" %>
<%@ page import="javaBeansClasses.ProjectManager" %>
<%@ page import="javaBeansClasses.Projects" %>

<jsp:useBean id="rpms" scope="page" class="javaBeansClasses.Projects" />
<jsp:useBean id="rpms1" scope="page" class="javaBeansClasses.ProjectManager" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List<Projects> Projects = rpms1.getProjects();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
    <%@include file="header.jsp" %>
    <title>projects List</title>
    
</head>
<body>
    <h2>projects</h2>
    <table border="1">
        <tr>
            <th>project name</th>
            <th>start date</th>
            <th>end date</th>
            <th>Amount funded</th>
            <th>field</th>
        </tr>
        <% for (Projects project : Projects) { %>
        <tr>
            <td><%= project.getName() %></td>
            <td><%= project.getStart_date() %></td>
            <td><%= project.getEnd_date() %></td>
            <td><%= project.getAmount_funded() %></td>
            <td><%= project.getField() %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
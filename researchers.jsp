<%@ page import="java.util.List" %>
<%@ page import="javaBeansClasses.ResearcherManager" %>
<%@ page import="javaBeansClasses.researchers" %>

<jsp:useBean id="rpms" scope="page" class="javaBeansClasses.researchers" />
<jsp:useBean id="rpms1" scope="page" class="javaBeansClasses.ResearcherManager" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List<researchers> researchers = rpms1.getresearchers();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
    <%@include file="header.jsp" %>
    <title>Researchers List</title>
    
</head>
<body>
    <h2>Researchers</h2>
    <table border="1">
        <tr>
            <th>first name</th>
            <th>last Name</th>
            <th>project</th>
            <th>department</th>
            <th>faculty</th>
            <!-- More headers if needed -->
        </tr>
        <% for (researchers researcher : researchers) { %>
        <tr>
            <td><a href="profile.jsp?id=<%= researcher.getResearcherId() %>"><%= researcher.getfName() %></a></td>
            <td><%= researcher.getlName() %></td>
            <td><%= researcher.getProject() %></td>
            <td><%= researcher.getFaculty() %></td>
            <td><%= researcher.getDepartment() %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
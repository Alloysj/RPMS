<%@ page import="java.util.List" %>
<%@ page import="javaBeansClasses.FunderManager" %>
<%@ page import="javaBeansClasses.Funders" %>

<jsp:useBean id="rpms" scope="page" class="javaBeansClasses.Funders" />
<jsp:useBean id="rpms1" scope="page" class="javaBeansClasses.FunderManager" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List<Funders> funders = rpms1.getFunders();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
    <%@include file="header.jsp" %>
    <title>Funder List</title>
    
</head>
<body>
    <h2>Funders</h2>
    <table border="1">
        <tr>
            <th>funder name</th>
            <th>status</th>
            <th>Country</th>
            <th>Total funds</th>
            <!-- More headers if needed -->
        </tr>
        <% for (Funders funder : funders) { %>
        <tr>
            <td><%= funder.getName() %></td>
            <td><%= funder.getStatus() %></td>
            <td><%= funder.getCountry() %></td>
            <td><%= funder.getTotalFunds() %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
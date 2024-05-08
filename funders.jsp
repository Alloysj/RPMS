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
    <link rel="stylesheet" href="index.css"/>
    
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
    <form action="addNewFunder.jsp">
        <button type="submit">Add New Funder</button>
    </form>
</body>
</html>
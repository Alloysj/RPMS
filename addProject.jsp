<%@ page import="java.util.List" %>
<%@ page import="javaBeansClasses.ProjectManager" %>
<%@ page import="javaBeansClasses.Projects" %>
<%@ page import="javaBeansClasses.Funders" %>
<%@ page import="javaBeansClasses.FunderManager" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="funderId" scope="page" class="javaBeansClasses.FunderManager" />
<jsp:useBean id="funderIds" scope="page" class="javaBeansClasses.Funders" />

<%
    List<Funders> Funders = funderId.getFunders();
%>
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

            <label for="researcherId">researcher ID:</label>
            <input type="number" id="researcherId" name="researcherId"><br><br>
            <label for="name">Project Name:</label>
            <input type="text" id="name" name="name"><br><br>
            <label for="start_date">start date:</label>
            <input type="date" id="start_date" name="start_date"><br><br>
            <label for="end_date">End date:</label>
            <input type="date" id="end_date" name="end_date"><br><br>
            <label for="funderId">Select project funder:</label>
            <select id="funderId" name="funderId">
                <% for (Funders funder : Funders) { %>
                <option value="<%= funder.getFunderId() %>"><%= funder.getName() %></option>
                <% } %>
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

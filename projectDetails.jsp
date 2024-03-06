<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>New Project</title>
<link rel="stylesheet" href="researcher.css"/>
</head>
<body>
    <%@ include file="header.jsp" %>
    <%-- Access data from request attributes --%>
    <% String message = (String) request.getAttribute("message"); %>
    <% ResultSet projectList = (ResultSet) request.getAttribute("projectList"); %>

    <%-- Display message (if any) --%>
    <% if (message != null) { %>
    <p><%= message %></p>
    <% } %>

<div class="container">
    <h1>New Project</h1>

    <form method="post" action="projectServlet">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name"><br><br>
        <label for="startDate">startDate:</label>
        <input type="date" id="startDate" name="startDate"><br><br>
        <label for="endDate">endDate:</label>
        <input type="date" id="endDate" name="endDate"><br><br>
        <label for="amountFunded">amountFunded:</label>
        <input type="text" id="amountFunded" name="amountFunded"><br><br>
        <label for="funderName">funderName:</label>
        <input type="text" id="funderName" name="funderName"><br><br>
        <label for="field">field:</label>
        <input type="text" id="field" name="field"><br><br>
        <input type="submit" value="Submit">
    </form>
</div>
<div>    
    <table>
        <thead>
            <tr>
                <th>project Name</th>
                <th>start date</th>
                <th>end date</th>
                <th>amount funded</th>
                <th>funder Name</th>
                <th>field</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
           <% 
        // Iterate through the ResultSet (if available) and display data
        if (projectList != null) {
          while (projectList.next()) {
      %>
      <tr>
        <td><%= projectList.getString("name") %></td>
        <td><%= projectList.getString("startDate") %></td>
        <td><%= projectList.getString("endDate") %></td>
        <td><%= projectList.getString("amountFunded") %></td>
        <td><%= projectList.getString("funderName") %></td>
        <td><%= projectList.getString("field") %></td>
        <td><a href="editProject.jsp?projectId=<%= projectList.getString("projectId") %>">Edit</a></td>
        <td><a href="deleteProject.jsp?projectId=<%= projectList.getString("projectId") %>">Delete</a></td>
      </tr>
      <%
          }
        }
      %>
      
        </tbody>
    </table>
</div>

</body>
</html>
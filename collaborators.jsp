<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Collaborators Information</title>
<link rel="stylesheet" href="researcher.css"/>
</head>
<body>
    <%@ include file="header.jsp" %>
    <%-- Access data from request attributes --%>
    <% String message = (String) request.getAttribute("message"); %>
    <% ResultSet collaboratorList = (ResultSet) request.getAttribute("collaboratorList"); %>
    
    <%-- Display message (if any) --%>
    <% if (message != null) { %>
    <p><%= message %></p>
    <% } %>

<div class="container">
    <h1>Collaborator Information</h1>

    <form method="post" action="CollaboratorServlet">
        <label for="fName">First Name:</label>
        <input type="text" id="fName" name="fName"><br><br>
        <label for="lName"> Last Name:</label>
        <input type="text" id="lName" name="lName"><br><br>
        <label for="project">Project:</label>
        <input type="text" id="project" name="project"><br><br>
       
        <input type="submit" value="Submit">
    </form>
</div>
<div>    
    <table>
        <thead>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Project</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
           <% 
        // Iterate through the ResultSet (if available) and display data
        if (collaboratorList != null) {
          while (collaboratorList.next()) {
      %>
      <tr>
        <td><%= collaboratorList.getString("fName") %></td>
        <td><%= collaboratorList.getString("lName") %></td>
        <td><%= collaboratorList.getString("project") %></td>
        <td><a href="EditCollaborator.jsp?collaboratorId=<%= collaboratorList.getString("collaboratorId") %>">Edit</a></td>
        <td><a href="deleteCollaborator.jsp?collaboratorId=<%= collaboratorList.getString("collaboratorId") %>">Delete</a></td>
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
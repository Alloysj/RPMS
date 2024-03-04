<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Researcher Information</title>
<link rel="stylesheet" href="researcher.css"/>
</head>
<body>
    <%@ include file="header.jsp" %>
    <%-- Access data from request attributes --%>
    <% String message = (String) request.getAttribute("message"); %>
    <% ResultSet researcherList = (ResultSet) request.getAttribute("researcherList"); %>

    <%-- Display message (if any) --%>
    <% if (message != null) { %>
    <p><%= message %></p>
    <% } %>

<div class="container">
    <h1>researcher Information</h1>

    <form method="post" action="researcherServlet">
        <label for="researcherId">researcher ID:</label>
        <input type="number" id="researcherId" name="researcherId"><br><br>
        <label for="fName">Name:</label>
        <input type="text" id="fName" name="fName"><br><br>
        <label for="lName">lName:</label>
        <input type="text" id="lName" name="lName"><br><br>
        <label for="project">project:</label>
        <input type="text" id="project" name="project"><br><br>
        <label for="department">department:</label>
        <input type="text" id="department" name="department"><br><br>
        <label for="faculty">faculty:</label>
        <input type="text" id="faculty" name="faculty"><br><br>
        <input type="submit" value="Submit">
    </form>
</div>
<div>    
    <table>
        <thead>
            <tr>
                <th>Researcher ID</th>
                <th>First Name</th>
                <th>last Name</th>
                <th>project</th>
                <th>department</th>
                <th>faculty</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
           <% 
        // Iterate through the ResultSet (if available) and display data
        if (researcherList != null) {
          while (researcherList.next()) {
      %>
      <tr>
        <td><%= researcherList.getString("researcherId") %></td>
        <td><%= researcherList.getString("fName") %></td>
        <td><%= researcherList.getString("lName") %></td>
        <td><%= researcherList.getString("project") %></td>
        <td><%= researcherList.getString("department") %></td>
        <td><%= researcherList.getString("faculty") %></td>
        <td><a href="editResearcher.jsp?researcherId=<%= researcherList.getString("researcherId") %>">Edit</a></td>
        <td><a href="deleteResearcher.jsp?researcherId=<%= researcherList.getString("researcherId") %>">Delete</a></td>
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
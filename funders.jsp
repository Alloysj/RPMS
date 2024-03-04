<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Funder Information</title>
<link rel="stylesheet" href="researcher.css"/>
</head>
<body>
    <%@ include file="header.jsp" %>
    <%-- Access data from request attributes --%>
    <% String message = (String) request.getAttribute("message"); %>
    <% ResultSet funderList = (ResultSet) request.getAttribute("funderList"); %>

    <%-- Display message (if any) --%>
    <% if (message != null) { %>
    <p><%= message %></p>
    <% } %>

<div class="container">
    <h1>Funder Information</h1>

    <form method="post" action="FundersServlet">
        <label for="funderId">FunderID:</label>
        <input type="number" id="funderId" name="funderId"><br><br>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name"><br><br>
        <label for="status">Status:</label>
        <input type="text" id="status" name="status"><br><br>
        <label for="country">Country:</label>
        <input type="text" id="country" name="country"><br><br>
        <label for="totalFunds">TotalFunds:</label>
        <input type="number" id="totalFunds" name="totalFunds"><br><br>
        <input type="submit" value="Submit">
    </form>
</div>
<div>    
    <table>
        <thead>
            <tr>
                <th>Funder ID</th>
                <th>Name</th>
                <th>Status</th>
                <th>Country</th>
                <th>Total Funds</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
           <% 
        // Iterate through the ResultSet (if available) and display data
        if (funderList != null) {
          while (funderList.next()) {
      %>
      <tr>
        <td><%= funderList.getString("funderId") %></td>
        <td><%= funderList.getString("name") %></td>
        <td><%= funderList.getString("status") %></td>
        <td><%= funderList.getString("country") %></td>
        <td><%= funderList.getString("totalFunds") %></td>
        <td><a href="EditFunder.jsp?funderId=<%= funderList.getString("funderId") %>">Edit</a></td>
        <td><a href="DeleteFunder.jsp?funderId=<%= funderList.getString("funderId") %>">Delete</a></td>
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RPMS</title>
        <link rel="stylesheet" href="researchers.css"/>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <h1>collaborators!</h1>



        <%
              String fName = request.getParameter ("fName");
              String lName = request.getParameter ("lName");
              String project = request.getParameter ("project");
                
        %> 
        <form action="#">
            <label>Enter first name</label>
            <input type="text" name="fName" />
            <label>Enter last name</label>
            <input type="text" name="lName" />
            <label>Enter project name</label>
            <input type="text" name="project" />
            <input type="submit" value="submit">
        </form>

        <table border="1" cellpadding="1">
            <thead>
                <tr>
                    <th>first name</th>
                    <th>last name</th>
                    <th>project</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%= fName%></td>
                    <td><%= lName%></td>
                    <td><%= project%></td>
                </tr>
            </tbody>
        </table>

    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EEMS</title>
        <link rel="stylesheet" href="researcher.css"/>
    </head>
    <body>
        <h1>Hello World!</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Projects funding</th>
                    <th>Country</th>
                    <th>Status</th>
                    <th>Amount Funding(Ksh)</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                 <%
                     String updatedName = request.getParameter("name");
                String updatedProjectName = request.getParameter("projectName");
                String updatedFunderCountry = request.getParameter("funderCountry");
                String updatedFunderStatus = request.getParameter("funderStatus");
                String updatedAmountFunding = request.getParameter("amountFunding");
                
                    // Update the project details in the table
                    // Replace this part with your actual database update logic
                    // This is just a placeholder
                    if (updatedName != null) {
                        // Update the project details in the table
                        // For demonstration, we are just printing the updated values
                        out.println("<tr>");
                        out.println("<td>" + updatedName + "</td>");
                        out.println("<td>" + updatedProjectName + "</td>");
                        out.println("<td>" + updatedFunderCountry + "</td>");
                        out.println("<td>" + updatedFunderStatus + "</td>");
                        out.println("<td>" + updatedAmountFunding + "</td>");
                        out.println("<td><a href=\"updateFunder.jsp?funderID=100\">Update</a></td>");
                        out.println("</tr>");
                    }
                %>
                <tr>
                    <td>400</td>
                    <td>USAID</td>
                    <td>research management profile</td>
                    <td>USA</td>
                    <td>Active</td>
                    <td>300,000</td>
                    <td>
                        <a href="updateFunder.jsp?funderId=100">Update</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </body>
</html>

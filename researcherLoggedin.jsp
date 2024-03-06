<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EEMS</title>
    <link rel="stylesheet" href="researcher.css"/>
</head>
<body>
    <h1>Welcome, researcher 31450</h1>
    
    <a href="editResearcher.jsp?researcherId=101">view and update your profile</a>
    <a href="projectDetails.jsp" target="_blank">enter your project</a>
    <h2>Your Project</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Project ID</th>
                <th>Project Name</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Amount Funded(Ksh)</th>
                <th>Project Field</th>
                <th>Collaborators</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Retrieve form parameters if available
                String updatedProjectId = request.getParameter("projectId");
                String updatedProjectName = request.getParameter("projectName");
                String updatedProjectStartDate = request.getParameter("projectStartDate");
                String updatedProjectEndDate = request.getParameter("projectEndDate");
                String updatedAmountFunded = request.getParameter("amountFunded");
                String updatedProjectArea = request.getParameter("projectArea");
                String updatedProjectFunder = request.getParameter("projectFunder");
                
                
                if (updatedProjectId != null) {
                    // Update the project details in the table
                    out.println("<tr>");
                    out.println("<td>" + updatedProjectId + "</td>");
                    out.println("<td>" + updatedProjectName + "</td>");
                    out.println("<td>" + updatedProjectStartDate + "</td>");
                    out.println("<td>" + updatedProjectEndDate + "</td>");
                    out.println("<td>" + updatedAmountFunded + "</td>");
                    out.println("<td>" + updatedProjectArea + "</td>");
                    out.println("<td>" + updatedProjectFunder + "</td>");
                    out.println("<td><a href=\"updateProject.jsp?projectId=" + updatedProjectId + "\">Update</a></td>");
                    out.println("</tr>");
                }
            %>
            <tr>
                <td>100</td>
                <td>research management profile</td>
                <td>02-02-2024</td>
                <td>02-04-2024</td>
                <td>100,000</td>
                <td>STEM</td>
                <td>Aloise mutune, Victor Wanguya</td>
                <td>
                    <a href="updateProject.jsp?projectId=3">Update</a>
                </td>
            </tr>
        </tbody>
        
        <%
        
               
                String expense = request.getParameter("expense");
                String expenseAmt = request.getParameter("expenseAmt");
        %>
    </table>
     
            <table border="1" cellpadding="2">
                <thead>
                    <tr>
                        <th>Expense name</th>
                        <th>Amount</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%= expense%></td>
                        <td><%= expenseAmt %></td>
                    </tr>
                </tbody>
            </table>

    <h2>Enter Project Expenses</h2>
    <form action="researcherLoggedin.jsp" method="post">
        <input type="hidden" name="projectId" value="3]">
        <table>
            <tr>
                <td>Expense Name:</td>
                <td><input type="text" name="expense" required></td>
            </tr>
            <tr>
                <td>Amount:</td>
                <td><input type="number" name="expenseAmt" required></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Add Expense"></td>
            </tr>
        </table>
    </form>
</body>
</html>

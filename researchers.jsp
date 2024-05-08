<%@ page import="java.util.List" %>
<%@ page import="javaBeansClasses.ResearcherManager" %>
<%@ page import="javaBeansClasses.researchers" %>

<jsp:useBean id="rpms" scope="page" class="javaBeansClasses.researchers" />
<jsp:useBean id="rpms1" scope="page" class="javaBeansClasses.ResearcherManager" />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List<researchers> researchers = rpms1.getresearchers();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <%@include file="header.jsp" %>
        <title>Researchers List</title>
        <style>
            /* Style for pop-up form */
            .popup-form {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: #f9f9f9;
                padding: 20px;
                border: 1px solid #ccc;
                z-index: 10;
                border-radius: 20px;
            }
            /* Style for overlay */
            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 3;
                display: none;
                border-radius: 20px;
            }

            /* Style for disable content when pop-up is active */
            .disabled-content {
                opacity: 0.5;
            }
        </style>

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
        <h2>Researchers</h2>
        <table border="1">
            <tr>
                <th>first name</th>
                <th>last Name</th>
                <th>project</th>
                <th>faculty</th>
                <th>department</th>
                <!-- More headers if needed -->
            </tr>
            <% for (researchers researcher : researchers) { %>
            <tr>
                <td><a href="#" onclick="displayResearcherDetails('<%= researcher.getfName() %>', '<%= researcher.getlName() %>', '<%= researcher.getProject() %>', '<%= researcher.getFaculty() %>', '<%= researcher.getDepartment() %>')"><%= researcher.getfName() %></a></td>
                <td><%= researcher.getlName() %></td>
                <td><%= researcher.getProject() %></td>
                <td><%= researcher.getFaculty() %></td>
                <td><%= researcher.getDepartment() %></td>
            </tr>
            <% } %>
        </table>
        <!-- Pop-up form for displaying researcher details -->
        <div id="popupForm" class="popup-form">
            <h3>Researcher Details</h3>
            <form>
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" disabled><br>

                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName" disabled><br>

                <label for="project">Project:</label>
                <input type="text" id="project" disabled><br>

                <label for="department">Department:</label>
                <input type="text" id="department" disabled><br>

                <label for="faculty">Faculty:</label>
                <input type="text" id="faculty" disabled><br>

                <button type="button" onclick="closePopup()">Close</button>
            </form>
        </div>

        <!-- Overlay to disable content when pop-up is active -->
        <div id="overlay" class="overlay"></div>

        <script>
            // Function to display researcher details in pop-up form
            function displayResearcherDetails(firstName, lastName, project, faculty, department) {
                document.getElementById('firstName').value = firstName;
                document.getElementById('lastName').value = lastName;
                document.getElementById('project').value = project;
                document.getElementById('faculty').value = faculty;
                document.getElementById('department').value = department;

                // Display the pop-up form
                document.getElementById('popupForm').style.display = 'block';
                // Display the overlay to disable content
                document.getElementById('overlay').style.display = 'block';
                // Disable content of underlying page
                document.body.classList.add('disabled-content');
            }

            // Function to close the pop-up form
            function closePopup() {
                // Hide the pop-up form
                document.getElementById('popupForm').style.display = 'none';
                // Hide the overlay
                document.getElementById('overlay').style.display = 'none';
                // Enable content of underlying page
                document.body.classList.remove('disabled-content');
            }
        </script>

        <form action="addResearcher.jsp">
            <input type="submit" value="Add researcher">
        </form>
    </body>
    <%@include file="footer.jsp" %>
</html>
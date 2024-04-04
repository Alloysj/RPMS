<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Researcher</title>
        <link rel="stylesheet" href="profiles.css"/>
    </head>
    <body>
        <h2>Add New researcher</h2>


        <form action="ResearcherServlet" method="post">

            <label for="fName">First Name:</label>
            <input type="text" id="fName" name="fName" required pattern="[A-Za-z]+" title="Name cannot contain numbers"><br><br>
            <label for="lName">Last Name:</label>
            <input type="text" id="lName" name="lName" required pattern="[A-Za-z]+" title="Name cannot contain numbers"><br><br>
            <label for="faculty" id="faculty">Faculty:</label>
            <select>
                <option value="FEDCOS">FEDCOS</option>
                <option value="FASS">FASS</option>
                <option value="FOA">FOA</option>
                <option value="FOS">FOS</option>
                <option value="FERD">FERD</option>
                <option value="LAW">LAW</option>
                <option value="ENGINEERING">ENGINEERING</option>
            </select><br><br>
            <label for="department">Department:</label>
            <input type="text" id="department" name="department" required pattern="[A-Za-z]+" title="Department cannot contain numbers"><br><br>

            <input type="submit" value="Submit">
        </form>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EEMS</title>
        <link rel="stylesheet" href="researcher.css"/>
    </head>
    <body>
        <h1>Update your profile</h1>
        <form action="researchers.jsp">
            <label for="researcherID">Enter ID</label>
            <input type="number" name="researcherID" />
            <label for="fName">first name</label>
            <input type="text" name="fName" />
            <label for="researcherID">last name</label>
            <input type="text" name="lName" />
            <label for="researcherID">project</label>
            <input type="text" name="project" value="" />
            <label for="researcherID">department</label>
            <input type="text" name="department" value="" />
            <label for="researcherID">faculty</label>
            <input type="text" name="faculty" value="" />
            <input type="submit" value="submit" />
        </form>
    </body>
</html>

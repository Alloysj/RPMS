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
                 
                <tr>
                    <td>400</td>
                    <td>USAID</td>
                    <td>research management profile</td>
                    <td>USA</td>
                    <td>Active</td>
                    <td>300,000</td>
                    <td>
                        <a href="updateFunder.jsp?funderId=400">Update</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </body>
</html>

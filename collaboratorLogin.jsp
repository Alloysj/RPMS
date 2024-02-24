<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Collaborator Login</title>
    <link rel="stylesheet" href="login.css"/>
</head>
<body>
    <h1>Collaborator Login</h1>

    <form action="CollaboratorLoginServlet" method="post">
        <table>
            <tr>
                <td>Collaborator ID:</td>
                <td><input type="number" name="CID" required></td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="txtpsw" required></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Login"></td>
            </tr>
        </table>
    </form>
</body>
</html>


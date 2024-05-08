

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RPMS</title>
        <style>
            body{
                background-image: url("Imgs/gate_unedited.jpg");
                background-size: cover;
                background-repeat: no-repeat;
                color: #fff;
            }
            h1, h2 {
                text-align: center;
            }
            td.info{
                color: #fff;
            }
            table{
                border: 1px solid #ddd;
            }

            th, td {
                padding: 10px;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }
            form {
                width: 40%;
                margin: 20px auto;
            }

            input[type="password"],
            input[type="number"] {
                width: 100%;
                padding: 10px;
                margin: 5px 0;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            input[type="submit"],
            input[type="reset"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type="submit"]:hover,
            input[type="reset"]:hover {
                background-color: #45a049;
            }

        </style>
    </head>
    <body>
<<<<<<< HEAD
        <header>
            <h1>Welcome to the Research Profile Management System</h1>
        </header>

        <nav>
            <ul class="circle-container">
                <li><a href="researchers.jsp"><img src="Imgs/Research-PNG-File.png" width="300" height="300" alt="researchers"/> Researchers</a></li>
                <li><a href="collaborators.jsp"><img src="Imgs/collaboration.png" width="300" height="300" alt="collaborators"/> Collaborators</a></li>
                <li><a href="funders.jsp"><img src="Imgs/funders.jpg" width="300" height="300" alt="funders"/> Funders</a></li>
                <li><a href="projects.jsp"><img src="Imgs/project0.png" width="300" height="300" alt="projects"/> Projects</a></li>
                <li><a href="login.jsp"><img src="Imgs/gate_unedited.jpg" width="300" height="300" alt="login"/> Login</a></li>
            </ul>
        </nav>

        <section>
            <h2>About</h2>
            <p>
                Welcome to the Research Management Profile System. This system helps manage and track
                research projects, collaborators, funders, and more. Use the navigation links above
                to explore the different functionalities of the system.
            </p>
        </section>

        <footer>
            <p>&copy; 2024 Research Management Profile System</p>
        </footer>
=======
        <% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setHeader("Expires", "0");%>
        <div align = center>
            <h1>Researcher login</h1>
        </div>
        <form action="Login"  method = post>
            <table>
                <tr>
                    <td class = "info">select user type:</td>
                    <td><select>
                            <option>researcher</option>
                            <option>Funder</option>
                            <option>Administrator</option>
                        </select></td>
                </tr>
                <tr><td class = "info">Enter Id:</td><td> <input type ="number" name ="txtId" placeholder="Enter your researcher id" required></td></tr>
                <tr><td class = "info">Enter password:</td><td> <input type ="password" name ="txtpwd" required></td></tr>
                <tr><td><input type ="submit" value = "login"></td><td><input type = "reset"></td></tr>
            </table>
        </form>
>>>>>>> rpms1
    </body>
</html>

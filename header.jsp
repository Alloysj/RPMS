
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="index.css" type="text/css"/>

        <title>RPMS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            .dropdown {
                position: relative;
                display: inline-block;
            }

            /* Dropdown button */
            .dropbtn {
                background-color: #ffffff;
                color: #333333;
                padding: 12px 16px;
                border: none;
                cursor: pointer;
            }

            /* Dropdown content */
            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #ffffff;
                min-width: 160px;
                z-index: 1;
            }

            /* Links inside the dropdown */
            .dropdown-content a {
                color: #333333;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }


            .dropdown:hover .dropdown-content {
                display: block;
            }


            .dropdown-content a:hover {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <header>
            <div class="container">
                <div class="left"><a href="index.jsp"><img src="Imgs/eu_logo-transparent.png" alt="eu_logo"/></a></div>
                <div class="right">
                    <ul class="header_links">
                        <li><a href="researchers.jsp">Researchers</a></li>
                        <li><a href="collaborators.jsp">Collaborators</a></li>
                        <li><a href="funders.jsp">Funders</a></li>
                        <li><a href="projects.jsp">Projects</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropbtn">Login</a>
                            <div class="dropdown-content">
                                <a href="login.jsp">Researcher</a>
                                <a href="collaboratorLogin.jsp">Collaborator</a>
                                <a href="funderLogin.jsp">Funder</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </header>
    </body>
</html>
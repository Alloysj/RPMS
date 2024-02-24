<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Research Management Profile System</title>
        <link rel="stylesheet" href="researcher.css">
        <style>
           /* Define the mixin */
        
        /* Use the mixin */
        .circle-container {
            @include on-circle(5, 300px, 250px);
            margin: 5em auto 0;
            border: solid 5px tomato;
        }
        
        .circle-container img {
            display: block;
            max-width: 100%;
            border-radius: 50%;
            filter: grayscale(100%);
            border: solid 5px tomato;
            transition: 0.15s;
        }
        
        .circle-container img:hover,
        .circle-container img:active {
            filter: grayscale(0);
        }
        </style>
    </head>
    <body>
        <header>
            <h1>Welcome to the Research Profile Management System</h1>
        </header>

        <nav>
            <ul class="circle-container">
                <li><a href="researchers.jsp"><img src="Imgs/Research-PNG-File.png" width="300" height="300" alt="researchers"/> Researchers</a></li>
                <li><a href="collaborators.jsp"><img src="Imgs/collaboration.png" width="300" height="300" alt="collaborators"/> Collaborators</a></li>
                <li><a href="funders.jsp"><img src="Imgs/funders.jpg" width="300" height="300t" alt="funders"/> Funders</a></li>
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
    </body>
</html>


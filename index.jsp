<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Research Management Profile System</title>
        <link rel="stylesheet" href="researcher.css">
        <style>
           .circle-container {
                display: flex;
                flex-wrap: wrap; 
                justify-content: space-between;
                align-items: center; 
                max-width: 800px; 
                margin: 0 auto; 
            }

            
            .circle-container li {
                justify-items: left;
                width: 50%; 
                padding: 10px; 
                box-sizing: border-box; 
                border: 4px solid green;
            }

            
            .circle-container img {
                max-width: 100%; 
                height: auto; 
                display: block; 
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


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Research Management Profile System</title>
    <link rel="stylesheet" href="researcher.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #2c3e50;
            color: #fff;
            text-align: center;
            padding: 20px 0;
        }

        nav {
            background-color: #3498db;
            color: #fff;
            text-align: center;
            padding: 20px 0;
        }

        nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        nav ul li {
            display: inline-block;
            margin: 0 10px;
        }

        nav ul li a {
            text-decoration: none;
            color: #fff;
            display: block;
            padding: 10px;
            transition: background-color 0.3s ease;
        }

        nav ul li a:hover {
            background-color: #2980b9;
        }

        section {
            padding: 20px;
        }

        footer {
            background-color: #34495e;
            color: #fff;
            text-align: center;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        .circle-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
            max-width: 800px;
            margin: 20px auto;
        }

        .circle-container li {
            justify-items: left;
            width: 45%;
            padding: 10px;
            box-sizing: border-box;
            border: 4px solid #2980b9;
            border-radius: 50%;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .circle-container li:hover {
            transform: scale(1.1);
        }

        .circle-container img {
            max-width: 80%;
            height: auto;
            display: block;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<header>
    <h1>Welcome to the Research Profile Management System</h1>
</header>

<nav>
    <ul class="circle-container">
        <li><a href="researchers.jsp"><img src="Imgs/Research-PNG-File.png" width="200" height="200" alt="researchers"/><br>Researchers</a></li>
        <li><a href="collaborators.jsp"><img src="Imgs/Collaboration.png" width="200" height="200" alt="collaborators"/><br>Collaborators</a></li>
        <li><a href="funders.jsp"><img src="Imgs/funders.jpg" width="200" height="200" alt="funders"/><br>Funders</a></li>
        <li><a href="projects.jsp"><img src="Imgs/project0.png" width="200" height="200" alt="projects"/><br>Projects</a></li>
        
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


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="index.css" type="text/css"/>

        <title>RPMS</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            .container{
                min-height: 100px;
                align-items: center;
            }
            .right{
                padding-top: 20px;
            }
        </style>
    </head>
    <% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
     response.setHeader("Pragma", "no-cache"); // HTTP 1.0
         response.setHeader("Expires", "0");
    %>
    <body>
        <header>
            <div class="container">
                <div class="left"><a href="home.jsp"><img src="Imgs/eu_logos-transparent.png" alt="eu_logo"/></a></div>
                <div class="right">
                    <ul class="header_links">
                        <li><a href="researchers.jsp">Researchers</a></li>
                        <li><a href="collaborators.jsp">Collaborators</a></li>
                        <li><a href="funders.jsp">Funders</a></li>
                        <li><a href="projects.jsp">Projects</a></li>
                        <li><a href="logout.jsp">Logout</a></li>
                    </ul>
                </div>
            </div>
        </header>
        <script>
            // JavaScript to identify and style the active link
            /*** window.onload = function () {
             var links = document.querySelectorAll('.header_links li a');
             links.forEach(function (link) {
             link.addEventListener('click', function () {
             // Remove 'active' class from all links
             links.forEach(function (item) {
             item.classList.remove('active');
             });
             // Add 'active' class to the clicked link
             this.classList.add('active');
             });
             });
             }; ***/

            const locationHref = window.location.href;
            const buttons = document.querySelectorAll('a');


            buttons.forEach(button => {
                // trim to remove white spaces and convert to lowercase
                const textContent = button.textContent.trim().toLowerCase();
                if (locationHref.includes(textContent)) {
                    button.style.backgroundColor = 'red';
                }
            });
        </script>

    </body>
</html>
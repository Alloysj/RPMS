<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
</head>
<body>
    <% 
        // Invalidate the session
        if (session != null) {
            session.removeAttribute("reseadcherId");
            session.invalidate();
        }
        HttpServletResponse res = (HttpServletResponse) response;
        res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        res.setHeader("Pragma", "no-cache");
        res.setDateHeader("Expires", 0);
        // Clear any cookies related to the session
        response.setHeader("Set-Cookie", "JSESSIONID=; Path=/; HttpOnly; Expires=Thu, 01 Jan 1970 00:00:00 GMT");

        try {
            // Redirect to a "Logged Out" page
            response.sendRedirect("index.jsp");
        } catch (IOException ex) {
            ex.printStackTrace(new PrintWriter(out)); 
        }
    %>
</body>
</html>

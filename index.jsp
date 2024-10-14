<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Simple JSP Page</title>
</head>
<body>
    <h2>Enter JNDI Information and Query</h2>
    
    <form method="post" action="process.jsp">
        <!-- JNDI Information Input -->
        <label for="jndiInfo">JNDI Information:</label><br>
        <input type="text" id="jndiInfo" name="jndiInfo"><br><br>
        
        <!-- Query Input -->
        <label for="query">Query:</label><br>
        <input type="text" id="query" name="query"><br><br>
        
        <!-- Submit Button -->
        <button type="submit">Submit</button>
    </form>
</body>
</html>

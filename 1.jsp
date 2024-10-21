<%@ page import="java.sql.*, javax.naming.*, javax.sql.DataSource" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SQL Server Query Page</title>
</head>
<body>
    <h2>Enter Query for SQL Server</h2>
    
    <form method="post">
        <!-- Query Input -->
        <label for="query">Query:</label><br>
        <input type="text" id="query" name="query"><br><br>
        
        <!-- Submit Button -->
        <button type="submit">Submit</button>
    </form>

    <h3>Query Result:</h3>
    <%
        String query = request.getParameter("query");
        if (query != null && !query.trim().isEmpty()) {
            try {
                // JNDI ile MSSQL veri kaynağına bağlan
                Context initContext = new InitialContext();
                DataSource ds = (DataSource) initContext.lookup("java:/comp/env/jdbc/SQLServerDB");
                Connection conn = ds.getConnection();
                
                // SQL sorgusunu çalıştır
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);

                // Sonuçları yazdır
                while (rs.next()) {
                    out.println(rs.getString(1) + "<br>");
                }

                conn.close();
            } catch (Exception e) {
                e.printStackTrace(out);
            }
        }
    %>
</body>
</html>

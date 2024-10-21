<%@ page import="java.sql.*, javax.naming.*, javax.sql.DataSource, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SQL Server Query Page</title>
</head>
<body>
    <h2>SQL Server Query Executor</h2>

    <form method="post">
        <!-- JNDI Input -->
        <label for="jndi">JNDI Name:</label><br>
        <input type="text" id="jndi" name="jndi" value="jdbc/SQLServerDB"><br><br>

        <!-- Query Input -->
        <label for="query">SQL Query:</label><br>
        <input type="text" id="query" name="query"><br><br>

        <!-- Submit Button -->
        <button type="submit">Submit</button>
    </form>

    <h3>Query Result:</h3>
    <%
        String jndi = request.getParameter("jndi");
        String query = request.getParameter("query");

        if (jndi != null && !jndi.trim().isEmpty() && query != null && !query.trim().isEmpty()) {
            out.println("Veritabanına bağlanılıyor...<br>");
            try {
                // JNDI ile MSSQL veri kaynağına bağlan
                Context initContext = new InitialContext();
                DataSource ds = (DataSource) initContext.lookup("java:/comp/env/" + jndi);
                Connection conn = ds.getConnection();
                out.println("Bağlantı başarılı!<br>");

                // SQL sorgusunu çalıştır
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);

                // Sonuçları yazdır
                ResultSetMetaData rsmd = rs.getMetaData();
                int columnsNumber = rsmd.getColumnCount();
                while (rs.next()) {
                    for (int i = 1; i <= columnsNumber; i++) {
                        if (i > 1) out.print(", ");
                        out.print(rs.getString(i));
                    }
                    out.println("<br>");
                }

                conn.close();
            } catch (Exception e) {
                StringWriter sw = new StringWriter();
                PrintWriter pw = new PrintWriter(sw);
                e.printStackTrace(pw);
                out.println("Bir hata oluştu:<br>" + sw.toString());
            }
        } else {
            out.println("Lütfen JNDI adı ve sorgu girin.");
        }
    %>
</body>
</html>

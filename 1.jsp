<%@ page import="java.sql.*, javax.naming.*, javax.sql.DataSource, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SQL Server Query Executor</title>
</head>
<body>
    <form method="post">
        <label for="jndi">JNDI Name:</label><br>
        <input type="text" id="jndi" name="jndi" value="jdbc/SQLServerDB"><br><br>

        <label for="query">SQL Query:</label><br>
        <input type="text" id="query" name="query"><br><br>

        <button type="submit">Submit</button>
    </form>

    <%
        String jndi = request.getParameter("jndi");
        String query = request.getParameter("query");

        if (jndi != null && !jndi.trim().isEmpty() && query != null && !query.trim().isEmpty()) {
            Context initContext = new InitialContext();
            DataSource ds = (DataSource) initContext.lookup("java:/comp/env/" + jndi);
            Connection conn = ds.getConnection();

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

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
        }
    %>
</body>
</html>

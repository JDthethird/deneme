<%@ page import="java.sql.*, javax.naming.*, javax.sql.DataSource, java.io.*" %>
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
            // Hataları yazdırmak için StringWriter ve PrintWriter kullan
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            e.printStackTrace(pw);
            out.println(sw.toString());  // Hataları çıktı olarak bas
        }
    }
%>

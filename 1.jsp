<%@ page import="java.sql.*, javax.naming.*, javax.sql.DataSource, java.io.*" %>
<%
    try {
        // JNDI ile MSSQL veri kaynağına bağlan
        Context initContext = new InitialContext();
        DataSource ds = (DataSource) initContext.lookup("java:/comp/env/jdbc/SQLServerDB");

        // Eğer bağlantı başarılıysa
        Connection conn = ds.getConnection();
        out.println("Veritabanına başarıyla bağlanıldı!<br>");

        conn.close();
    } catch (Exception e) {
        // Hataları yakalamak ve çıktı olarak basmak için StringWriter ve PrintWriter kullan
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        e.printStackTrace(pw);
        out.println("Bir hata oluştu:<br>" + sw.toString());
    }
%>

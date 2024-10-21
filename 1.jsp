<%@ page import="java.sql.*, javax.naming.*, javax.sql.DataSource" %>
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
        out.println("Bağlantı sırasında bir hata oluştu:<br>");
        e.printStackTrace(out);
    }
%>

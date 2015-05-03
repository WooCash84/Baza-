<%@ page language="java" pageEncoding="iso-8859-2" contentType="text/html;
         charset=iso-8859-2" %>
<%@ page import="model.Connect"%>
<%@ page import="java.sql.*" %>
<html>
    <head>
        <title>Test po³±czenia z baz±</TITLE>
    </head>
    <body>
        <h1>Dane odczytane z bazy:</h1><br/>
        <%
            String query ="SELECT * FROM dziekanat.studenci";
            Connect connect = new Connect();
            Connection con = connect.getConnection();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
            ResultSetMetaData rsmd = rs.getMetaData();
            int numberOfColumns = rsmd.getColumnCount();
        %>
        <table cellSpacing="0" cellPadding="10" border="1">
            <tr>
                <%
                    for (int i = 1; i <= numberOfColumns; i++) {
                        out.println("<th align=\"center\">" + rsmd.getColumnName(i)
                                + "</th>");
                    }
                    out.println("</tr>");
                    while (rs.next()) {
                        out.println("<tr>");
                        for (int i = 1; i <= numberOfColumns; i++) {
                            out.println("<td align=\"center\">" + rs.getString(i)
                                    + "</td>");
                        }
                        out.println("</tr>");
                    }
                    rs.close();
                    stmt.close();
                    connect.close();
                %>
    </body>
</html>

<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@page language="java" 
import="java.sql.*"  %>
       
<%
    String url = "jdbc:mysql://localhost:3306/sklep";
    String DBUSER = "root";
    String DBPASS = "lol123";
    String username = request.getParameter("Username");
    String password = request.getParameter("Password");
    session.setAttribute("myusername", username);

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url,DBUSER,DBPASS);
        Statement st = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ps = con.prepareStatement("Select username,password from sklep.usersdata where username =? and password=?");
        ps.setString(1, username);
        ps.setString(2, password);
        rs = ps.executeQuery();
        if (rs.next()) {
            String redirectURL = "purchase.jsp";
            response.sendRedirect(redirectURL);
        } else {
            out.println("Access deined");

        }
    } catch (Exception e) {
        out.println("There is not inserted Data.");

    }
%>
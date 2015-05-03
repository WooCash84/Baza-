package model;

import java.sql.*;

public class Connect {

    public  String driver = "org.postgresql.Driver";
    public  String host = "193.193.92.209";
    public  String dbname = "2014_zapior_patryk";
    public  String user = "2014_zapior_patryk";
    public  String url = "jdbc:postgresql://" + host + "/" + dbname;
    private  String pass = "24603";
    
    public Connection connection;
//    private static Statement st;

//    private static ResultSet res;

    public Connect() {
        connection = makeConnection();
    }
    
     public Connection getConnection() {
        return (connection);
    }
    
    public void close() {
        try {
            connection.close();
        } catch (SQLException sqle) {
            System.err.println("Blad przy zamykaniu polaczenia: " + sqle);
        }
    }

    public Connection makeConnection() {
        try {
            Class.forName(driver);
            Connection connection = DriverManager.getConnection(url, user, pass);
            return (connection);
        } catch (ClassNotFoundException cnfe) {
            System.err.println("Blad ladowania sterownika: " + cnfe);
            return (null);
        } catch (SQLException sqle) {
            System.err.println("Blad przy nawiązywaniu polaczenia: " + sqle);
            return (null);
        }
    }
    /*
     public void getData(){
        try{
            String query = "Select * From dziekana.studenci";
            rs = statement.executeQuery(query); 
        }catch(Exception ex){
            System.out.println("Dupa!");
        }
    }

  
    public static void main(String[] args) throws SQLException{
        Connect connect = new Connect();
        res= st.executeQuery("Select * From dziekanat.studenci");
        while(res.next()){
            System.out.printf("Column 1 returned");
            System.out.println(res.getString(1));
        }
        connect.close();
        res.close();
    }
 */
    public static void main(String[] args){
        try{
        String query = "select * from dziekanat.studenci";
        Connect connect = new Connect();
        Connection con = connect.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(query);
        ResultSetMetaData rsmd = rs.getMetaData();
        System.out.println(rs.getString(query));
        }catch(SQLException e){
            System.out.println("Błąd bazy");
        }
        }
}
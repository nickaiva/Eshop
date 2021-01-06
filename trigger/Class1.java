package mypackage1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Class1 
{
  public static void logPromotion 
  (
  int ID,
  String URL
  ) throws SQLException
  {
    Connection conn=null;
     conn=DriverManager.getConnection("jdbc:default:connection:");
    String sql="update promotion set product_id=?, url=? where id=1";
    try { 
      PreparedStatement pstmt= conn.prepareStatement(sql);
     pstmt.setInt(1,ID);
     pstmt.setString(2,URL);
     pstmt.executeUpdate();
     pstmt.close();
     
     }
     catch(SQLException e){
      System.err.print(e.getMessage());
     }
  }
}
package testConnection;

import java.sql.*;


public class Test_connection {
	
	
     
	public static void main(String args[]){  
		try{  
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection(  "jdbc:mysql://localhost:3306/budget","root","root");  
		 
		Statement stmt=con.createStatement();  
		ResultSet rs=stmt.executeQuery("select * from Expense");  
		while(rs.next())  
		System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3)+" "+rs.getDouble(4)+" "+rs.getString(5));  
		con.close();  
		}catch(Exception e){ System.out.println(e);}  
		}  

}

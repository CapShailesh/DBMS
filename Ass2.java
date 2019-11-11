package jdbc;
import java.sql.*;
import java.util.Scanner;

import com.mysql.jdbc.Connection;

public class Ass2 {

	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Class.forName("com.mysql.jdbc.Driver");
		Scanner ob = new Scanner(System.in);
		java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/te31315", "root", "lenovo");
		Statement stmt = con.createStatement();
		PreparedStatement ps;
		ResultSet rs;
		ResultSetMetaData rsmd;
		
		int ch, ch1;
		
		do
		{
			System.out.println("Menu\n1.Create Table\n2.Create View\n3.Create Index\n6.Exit\nChoice : ");
			ch = ob.nextInt();
			
			switch(ch)
			{
			case 1:
				do
				{
					System.out.println("Menu\n1.Create Table\n2.Insert Value\n3.Display\n4.Drop Table\n5.Exit");
					ch1 = ob.nextInt();
					
					switch(ch1)
					{
						case 1:
							stmt.executeUpdate("Create Table IF NOT EXISTS "
									+ "Person(id int primary key, Name Varchar(20), dob Date, Salary int);");
							break;
							
						case 2:
							ps = con.prepareStatement("INSERT INTO Person VALUES(?,?,?,?)");
							System.out.print("Id : ");
							int roll = ob.nextInt();
							ps.setInt(1, roll);
							
							System.out.print("Name : ");
							ps.setString(2, ob.next());
							System.out.println("Date of birth(YYYY-MM-DD) : ");
							ps.setString(3, ob.next());
							System.out.println("Salary : ");
							ps.setInt(4, ob.nextInt());
							
							ps.executeUpdate();
							break;
							
						case 3:
							rs = stmt.executeQuery("Select * from Person");
							rsmd = rs.getMetaData();
							while(rs.next())
							{
								for(int i = 1;i <= rsmd.getColumnCount();i++)
								{
									System.out.print(rs.getString(i) + " ");
								}
								System.out.println();
							}
							break;
							
						case 4:
							stmt.executeUpdate("Drop TABLE Person");
							break;
							
						case 5:
							break;
							
					}
				}while(ch1 != 5);	
				break;
				
			
			case 2:
				do
				{
					System.out.println("Menu\n1.Create View\n2.Display View\n3.Drop View\n4.How Created\n5.Exit");
					ch1 = ob.nextInt();
					
					switch(ch1)
					{
					case 1:
						stmt.executeUpdate("CREATE OR REPLACE VIEW VPerson AS SELECT id, Name, dob FROM Person");
						break;
						
					case 2:
						rs = stmt.executeQuery("SELECT * FROM VPerson");
						rsmd = rs.getMetaData();
						
						while(rs.next())
						{
							for(int i = 1;i<=rsmd.getColumnCount();i++)
							{
								System.out.print(rs.getString(i) + " ");
							}
							System.out.println();
						}
						break;
						
					case 3:
						stmt.executeUpdate("DROP VIEW VPerson");
						break;
						
					case 4:
						rs = stmt.executeQuery("SHOW CREATE VIEW VPerson");
						rsmd = rs.getMetaData();
						
						while(rs.next())
						{
							for(int i = 1;i<=rsmd.getColumnCount();i++)
							{
								System.out.print(rs.getString(i) + " ");
							}
							System.out.println();
						}
						break;
					}
					
				}while(ch1 != 5);
				break;
				
			case 3:
				do
				{
					System.out.println("Menu\n1.Create Index\n2.Display Indexes\n3.Drop Indexes\n4.Exit");
					ch1 = ob.nextInt();
					
					switch(ch1)
					{
					case 1:
						stmt.executeUpdate("CREATE INDEX IPerson ON Person(id)");
						break;
						
					case 2:
						rs = stmt.executeQuery("SHOW INDEXES FROM Person");
						rsmd = rs.getMetaData();
						
						while(rs.next())
						{
							for(int i = 1; i <= rsmd.getColumnCount(); i++)
							{
								System.out.print(rs.getString(i) + " ");
							}
							System.out.println();
						}
						break;
					case 3:
						stmt.executeUpdate("ALTER TABLE Person DROP INDEX IPerson");
						break;
						
					}
				}while(ch1 != 4);
				break;
				
			case 4:
				do
				{
					System.out.println("Menu\n1.Create Table\n2.Insert\n3.Display\n4.Exit");
					ch1 = ob.nextInt();
					
					switch(ch1)
					{
					case 1:
						stmt.executeUpdate("CREATE TABLE IF NOT EXISTS List(sr INT AUTO_INCREMENT PRIMARY KEY"
								+ ", name VARCHAR(20), division INT)");
						break;
						
					case 2:
						ps = con.prepareStatement("INSERT INTO List(name, division) VALUES(?,?)");
						System.out.print("Name : ");
						ps.setString(1, ob.next());
						
						System.out.print("Division : ");
						ps.setInt(2, ob.nextInt());
												
						ps.executeUpdate();
						break;
						
					case 3:
						rs = stmt.executeQuery("SELECT * FROM List");
						rsmd = rs.getMetaData();
						
						while(rs.next())
						{
							for(int i = 1;i<=rsmd.getColumnCount();i++)
							{
								System.out.print(rs.getString(i) + "");
							}
							System.out.println();
						}
					}
					
				}while(ch1 != 3);
				
				
				
			}
			
		}while(ch != 6);

	}

}

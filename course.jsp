<% //  %>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%!
 
public class Course
{
	String cno;
	int pid;
	String name;
	int year;
	int semester;
	int limit;
public  ArrayList<Course> get() 
	{
		try
		{ 
			ArrayList<Course> return_list = new ArrayList<Course>();
			Class.forName("oracle.jdbc.driver.OracleDriver");       
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","test","test");
	      
			Statement stmt;
			
			stmt = conn.createStatement();
			ResultSet rs;
			ResultSet rs1;
			rs = stmt.executeQuery("select * from course");
			

			while(rs.next())
			{
				Course t = new Course();
				t.cno = rs.getString("course_num");
				t.name = rs.getString("course_name");
				t.year = rs.getInt("year");
				t.semester = rs.getInt("semester");
				//t.limit=rsmd.getColumnCount();
				return_list.add(t);
			}

			return return_list;
		}	
		catch(Exception ex)
		{

			return null;
		}
	}

	public  boolean put(Course cour)
	{
		try
		{  
			Statement stmt;
			int rslt;

			Class.forName("com.mysql.jdbc.Driver");         
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","test","test");
	      
			stmt = conn.createStatement(); 
			
			rslt = stmt.executeUpdate("insert into course values(" 
										+ "'" + cour.cno +"', " 
										+ cour.pid + ", " 
										+ "'"+cour.name +"', "
										+cour.year+", "
										+ cour.semester+", "
										+cour.limit + ")"); 
			if( rslt > 0 )
			{ 
				return true;
			}
			else
			{
				return false;
			}
		}	
		catch(Exception ex)
		{
			return false;
		}
	}

	public  boolean delete(Course cour)
	{
		try
		{  
			Statement stmt;
			int rslt;

			Class.forName("com.mysql.jdbc.Driver");         
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","test","test");
	      
			stmt = conn.createStatement(); 
			
			rslt = stmt.executeUpdate("delete from course where cno =" + cour.cno); 
			if( rslt > 0 )
			{
				return true;
			}
			else
			{
				return false;
			}
		}	
		catch(Exception ex)
		{
			return false;
		}
	}

	public  boolean update(Course cour)
	{
		try
		{
			Statement stmt;
			int rslt;

			Class.forName("com.mysql.jdbc.Driver");         
			Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","test","test");

			stmt = conn.createStatement(); 
			
			rslt = stmt.executeUpdate("update course set "
										+ "pid = " + cour.pid + ", "
										+ "name = " + cour.name + ", "
										+ "semester = " + cour.semester + ", "
										+ "year = " + cour.year + ", "
										+ "limit = " + cour.limit + " "
										+ "where cno = " + cour.cno); 
			if( rslt > 0 )
			{ 
				return true;
			}
			else
			{
				return false;
			}
		}
		catch(Exception ex)
		{
			return false;
		}
	}
}
%>
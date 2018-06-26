<% //강의자료에 관한 클래스와 메소드들의 정의 %>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%!
 
public class Board
{
	int index;
	String cno;
	String title;
	String contents;
	String dialog;
	int pid;
	int time;
	public ArrayList<Board> get()
	{
		try
		{ 
			ArrayList<Board> return_list = new ArrayList<Board>();
			Class.forName("oracle.jdbc.driver.OracleDriver");         
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "","");
	      
			Statement stmt;
			
			stmt = conn.createStatement();
			ResultSet rs;
			rs = stmt.executeQuery("select * from board"); 

			while(rs.next())
			{
				Board t = new Board();
				//t.index = rs.getInt("index");
				t.cno = rs.getString("course_num");
				t.title = rs.getString("title");
				t.contents = rs.getString("contents");
				t.pid = rs.getInt("pid");
				t.dialog = rs.getString("dialog");
				//t.time = rs.getInt("time");
				return_list.add(t);
				
			}

			return return_list;
		}	
		catch(Exception ex)
		{
			return null;
		}
	}
	public boolean put(Board board)
	{
		try
		{  
			Statement stmt;
			int rslt;

			Class.forName("oracle.jdbc.driver.OracleDriver");            
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "","");
	      
			stmt = conn.createStatement(); 
			System.out.println(board.cno + "', '" 
					+ board.title + "', '" 
					+ board.contents +"', '" 
					+ board.dialog + "'," 
					+ board.pid + ")"  );
					
			//rslt = stmt.executeUpdate("create table b(c int)"(course_num, title, contents, pid)); 
			  rslt = stmt.executeUpdate("insert into board values('" 
										+ board.cno + "', '" 
										+ board.title + "', '" 
										+ board.contents +"', " 
										+ board.pid + ",'" 
										+ board.dialog + "')");  
			//System.out.println("111111111111");
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

	public boolean delete(Board board)
	{
		try
		{  
			Statement stmt;
			int rslt;

			Class.forName("oracle.jdbc.driver.OracleDriver");         
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "","");
	      
			stmt = conn.createStatement(); 
			
			rslt = stmt.executeUpdate("delete from board where pk =" + board.index + " and course_no ="+board.cno); 
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

	public boolean update(Board board)
	{
		try
		{
			Statement stmt;
			int rslt;

			Class.forName("oracle.jdbc.driver.OracleDriver");           
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "","");

			stmt = conn.createStatement(); 
			
			rslt = stmt.executeUpdate("update board set "
										+ "bno = " + board.index + ", "
										+ "cno = " + board.cno + ", "
										+ "title = " + board.title + ", "
										+ "data1 = " + board.contents + ", "
										+ "data2 = " + board.dialog + ", "
										+ "where bno = " + board.index + " "
										+ "and cno = " + board.cno); 
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
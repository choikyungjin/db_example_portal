
<%
	//수강 강의
%>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!public class Course_Registration {
		public String cno;
		int sid;

		public ArrayList<Course_Registration> getstudent() {
			try {
				ArrayList<Course_Registration> return_list = new ArrayList<Course_Registration>();
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "test",
						"test");

				Statement stmt;

				stmt = conn.createStatement();
				ResultSet rs;
				rs = stmt.executeQuery("select * from student_course");

				while (rs.next()) {
					Course_Registration t = new Course_Registration();
					t.cno = rs.getString("course_num");
					t.sid = rs.getInt("student_id");
					return_list.add(t);
				}

				return return_list;
			} catch (Exception ex) {
				return null;
			}
		}

		public ArrayList<Course_Registration> getprofessor() {
			try {
				ArrayList<Course_Registration> return_list = new ArrayList<Course_Registration>();
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "test",
						"test");

				Statement stmt;

				stmt = conn.createStatement();
				ResultSet rs;
				rs = stmt.executeQuery("select * from professor_course");

				while (rs.next()) {
					Course_Registration t = new Course_Registration();
					t.cno = rs.getString("course_num");
					t.sid = rs.getInt("professor_id");
					return_list.add(t);
				}

				return return_list;
			} catch (Exception ex) {
				return null;
			}
		}
	}%>
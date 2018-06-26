
<%
	// 사용자 계정 정보를 관리하는 클래스와 메소드.
%>

<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%!public class Account {
		int id;
		String pw;
		int group;
		String name;
		String mail;

		public ArrayList<Account> getstudent() {
			try {
				ArrayList<Account> return_list = new ArrayList<Account>();
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "","");
				Statement stmt;

				stmt = conn.createStatement();
				ResultSet rs;

				rs = stmt.executeQuery("select * from student");

				while (rs.next()) {
					Account t = new Account();
					t.id = rs.getInt("student_id");
					t.pw = rs.getString("student_password");
					t.name = rs.getString("student_name");
					t.group=0;
					t.mail = rs.getString("email");
					return_list.add(t);
				}

				return return_list;
			} catch (Exception ex) {
				return null;
			}
		}
		public ArrayList<Account> getprofessor() {
			try {
				ArrayList<Account> return_list = new ArrayList<Account>();
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "","");
				Statement stmt;

				stmt = conn.createStatement();
				ResultSet rs;

				rs = stmt.executeQuery("select * from professor");

				while (rs.next()) {
					Account t = new Account();
					t.id = rs.getInt("professor_id");
					t.pw = rs.getString("password");
					t.group=1;
					t.name = rs.getString("professor_name");
					return_list.add(t);
				}

				return return_list;
			} catch (Exception ex) {
				return null;
			}
		}

		public boolean put(Account acc) {
			try {
				Statement stmt;
				int rslt;

				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "","");

				stmt = conn.createStatement();

				rslt = stmt.executeUpdate("insert into account values(" + acc.id + ", " + "'" + acc.pw + "', "
						+ acc.group + ", " + "'" + acc.name + "', " + "'" + acc.mail + "')");
				if (rslt > 0) {
					return true;
				} else {
					return false;
				}
			} catch (Exception ex) {
				return false;
			}
		}

		public boolean delete(Account acc) {
			try {
				Statement stmt;
				int rslt;

				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "","");

				stmt = conn.createStatement();

				rslt = stmt.executeUpdate("delete from account where id =" + acc.id);
				if (rslt > 0) {
					return true;
				} else {
					return false;
				}
			} catch (Exception ex) {
				return false;
			}
		}

	}%>
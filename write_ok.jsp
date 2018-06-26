<%@ page language="java" contentType="text/html; charset=EUC-KR"

    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>  
<%
	request.setCharacterEncoding("euc-kr");

	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "";
	String pass = "";
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String title = request.getParameter("title");
	String memo = request.getParameter("memo");
	String num =request.getParameter("num");
	int total = 0;
	
	
	
	try {	
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();

		String sqlCount = "SELECT COUNT(*) FROM kboard";
		ResultSet rs = stmt.executeQuery(sqlCount);
		
		if(rs.next()){
			total = rs.getInt(1);
		}
		rs.close();
		out.print("총 게시물 : " + total + "개");
		
		
		String sql = "INSERT INTO kboard(num,USERNAME,PASSWORD,TITLE,MEMO) VALUES(?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1,total);
		pstmt.setString(2, name);
		pstmt.setString(3, password);
		pstmt.setString(4, title);
		pstmt.setString(5, memo);
		
		pstmt.execute();
		pstmt.close();
		
		conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
	}
%>
  <script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="list.jsp"; 

</script>

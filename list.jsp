<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>�Խ���</title>
 </head>
 <body>
 <%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "test";
	String pass = "test";
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
		
		String sqlList = "SELECT num,USERNAME, TITLE, HIT from kboard";
		rs = stmt.executeQuery(sqlList);
		
%>
<div><a href="index.jsp"><img src="images/kw_logo.jpg"></a></div>
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr height="5">
			<td width="5"></td>
		</tr>
		<tr
			style="background: url('images/table_mid.gif') repeat-x; text-align: center;">
			<td width="5"><img src="images/table_left.gif" width="5"
				height="30" /></td>
			<td width="30">��ȣ</td>
			<td width="379">����</td>
			<td width="73">�ۼ���</td>
			<td width="58">��ȸ��</td>
			<td width="7"><img src="images/table_right.gif" width="5"
				height="30" /></td>
		</tr>
		<%
	if(total==0) {
%>
		<tr align="center" bgcolor="#FFFFFF" height="30">
			<td colspan="6">��ϵ� ���� �����ϴ�.</td>
		</tr>
		<%
	 	} else {
	 		
		while(rs.next()) {
			int idx=rs.getInt(1);
			String name = rs.getString(2);
			String title = rs.getString(3);
			int hit = rs.getInt(4);
		
%>
		<tr height="25" align="center">
			<td>&nbsp;</td>
			<td align="center"><%=idx %></td>
			<td align="center"><a href="view.jsp?idx=<%=idx%>"><%=title %></td>
			<td align="center"><%=name %></td>
			<td align="center"><%=hit %></td>
			<td>&nbsp;</td>
		</tr>
		<tr height="1" bgcolor="#D2D2D2">
			<td colspan="6"></td>
		</tr>
		<% 
		}
	} 
	rs.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
}
%>
		<tr height="1" bgcolor="#82B5DF">
			<td colspan="6" width="752"></td>
		</tr>
	</table>

	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td colspan="4" height="5"></td>
		</tr>
		<tr align="center">
			<td><input type=button value="�۾���" OnClick="window.location='write.jsp'"></td>
		</tr>
	</table>
</body>
</html>
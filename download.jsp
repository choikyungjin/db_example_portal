
<%
	// 강의자료 다운로드
%>
<%@ page pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@include file="account.jsp"%>
<%@include file="board.jsp"%>

<%@include file="course.jsp"%>
<%@include file="course_registration.jsp"%>
<%@include file="tool.jsp"%>
<%@page import="java.io.File"%>
<%@page import="java.io.*"%>

<%
	String fileName = request.getParameter("file_name"); //
	ServletContext context = getServletContext();

	String realFolder = context.getRealPath("upload"); // 
	String filePath = realFolder + "/" + fileName;

	try {
		File file = new File(filePath);
		byte b[] = new byte[(int) file.length()];

		response.reset();
		response.setContentType("application/octet-stream");

		String Encoding = new String(fileName.getBytes("UTF-8"), "8859_1");
		response.setHeader("Content-Disposition", "attachment; filename = " + Encoding);
		response.setHeader("Content-Length", String.valueOf((file.length())));

		if (file.isFile()) {
			FileInputStream in = new FileInputStream(file);

			ServletOutputStream out2 = response.getOutputStream();

			int numRead=0;
			while ((numRead = in.read(b)) != -1) { //
				out2.write(b, 0, numRead);
			}

			out2.close();
			in.close();
		}

	} catch (Exception e) {
	}
%>

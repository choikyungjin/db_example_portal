
<%
	// 메일 보내기
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="java.util.Properties"%>
<%@ page import="java.io.File"%>
<%@ page import="javax.activation.*"%>
<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.Message"%>
<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.Address"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.Authenticator"%>
<%@ page import="test.SMTPAuthenticator"%>
<%@ page import="javax.mail.Authenticator"%>
<%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%-- 
<%@ page import="javax.mail.Multipart" %>
<%@ page import="javax.mail.PasswordAuthentication" %>
<%@ page import="javax.mail.internet.MimeBodyPart" %>
<%@ page import="javax.mail.internet.MimeMultipart" %> --%>



<%
	String sender = "";
	String cno=request.getParameter("cno");
	String subject = request.getParameter("title");
	String receiver = request.getParameter("to");
	
	String content = request.getParameter("dialog");

	Properties p = new Properties();

	p.put("mail.smtp.user", sender);
	p.put("mail.smtp.host", "smtp.gmail.com");
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	// 반드시 true 
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");

	Session ses = null;
	MimeMessage msg = null;

	try {

		ses = Session.getInstance(p, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, "88");
			}
		});
		ses.setDebug(true);

		msg = new MimeMessage(ses);

		Address fromAddr = new InternetAddress(sender);
		msg.setFrom(fromAddr);

		Address toAddr = new InternetAddress(receiver);
		msg.addRecipient(Message.RecipientType.TO, toAddr);

		msg.setSubject(subject);

		msg.setContent(content, "text/html;charset=utf-8");

		Transport.send(msg);

	} catch (Exception mex) {
		System.out.println(mex.toString());
		String script = "<script type='text/javascript'>\n";
		script += "alert('메일발송 실패');\n";
		script += "history.back();\n";
		script += "</script>";
		out.print(script);
		return;
	} 
	String script = "<script type='text/javascript'>\n";
	script += "alert('메일 발송 완료.');\n";
	//script += "history.back();";
	script += "</script>";
	out.print(script);
	response.sendRedirect("student_view.jsp?cno=" + request.getParameter("cno"));
	 %>
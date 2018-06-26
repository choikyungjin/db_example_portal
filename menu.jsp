
<%
	//메뉴
%>

<%@ page pageEncoding="utf-8"%>
<%@include file="account.jsp"%>
<%@include file="board.jsp"%>
<%@include file="course.jsp"%>
<%@include file="course_registration.jsp"%>
<%@include file="tool.jsp"%>
<%
	int is_student = (Integer) session.getAttribute("group");
	ArrayList<Board> board_list = new Board().get();
	ArrayList<Course_Registration> cour_reg_list;
	ArrayList<Course> cour_list = new Course().get();
	ArrayList<Account> acc_list;
	if (is_student == 0) {
		acc_list = new Account().getstudent();
		cour_reg_list = new Course_Registration().getstudent();
	} else {
		acc_list = new Account().getprofessor();
		cour_reg_list = new Course_Registration().getprofessor();
	}
%>
<%
	if (String.valueOf(session.getAttribute("id")).length() < 1) {
		out.println(alertToUrl("로그인 하세요", "/"));
	}

	// 
	ArrayList<String> menu_list = new ArrayList<String>();
	ArrayList<String> menu_url = new ArrayList<String>();
	ArrayList<String> menu_header = new ArrayList<String>();

	if (is_student == 0) {
		menu_list.add("학번 : " + session.getAttribute("id").toString());
		menu_url.add("header"); //  header
		menu_list.add("이름 : " + session.getAttribute("name").toString());
		menu_url.add("header"); //  header
		menu_list.add("로그아웃");
		menu_url.add("logout.jsp");
		//menu_list.add("수강 관리");
		//menu_url.add("course_view.jsp");
		for (Course cour : cour_list) {
			for (Course_Registration reg : cour_reg_list) {
				if (reg.sid == Integer.parseInt(session.getAttribute("id").toString())
						&& reg.cno.equals(cour.cno)) {
					menu_list.add(cour.name);
					menu_url.add("header");//  header
					//menu_list.add("강의 계획서");
					//menu_url.add("course_plan_view.jsp?cno=" + cour.cno);
					menu_list.add("강의자료실");
					menu_url.add("board_list_view.jsp?cno=" + cour.cno);
				}
			}
		}
	} else {
		menu_list.add("교수ID : " + session.getAttribute("id").toString());
		menu_url.add("header"); //  header
		menu_list.add("이름 : " + session.getAttribute("name").toString());
		menu_url.add("header");//  header
		menu_list.add("로그아웃");
		menu_url.add("logout.jsp");
		/* menu_list.add("강의 관리");
		menu_url.add("course_view.jsp"); */
		for (Course cour : cour_list) {
			for (Course_Registration reg : cour_reg_list) {
				if (reg.sid == Integer.parseInt(session.getAttribute("id").toString())
						&& reg.cno.equals(cour.cno)) {

					/* if( cour.pid == Integer.parseInt(session.getAttribute("id").toString()) )
					{
					*/ menu_list.add(cour.name);
					menu_url.add("header");//  header
					menu_list.add("수강생관리");
					menu_url.add("student_view.jsp?cno=" + cour.cno);
					//session.setAttribute("cno", cour.cno);
					//menu_list.add("강의계획서");
					//menu_url.add("course_plan_view.jsp?cno=" + cour.cno);
					menu_list.add("강의자료실");
					menu_url.add("board_list_view.jsp?cno=" + cour.cno);
					//menu_url.add("test.jsp?cno=" + cour.cno);
				}
			}
		}
	}
%>

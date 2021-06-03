<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("username");
	String password = request.getParameter("userpassword");
%>
<HTML>

<HEAD>
	<TITLE>로그인</TITLE>
</HEAD>
<BODY>
<meta charset="utf-8">
	이름 : <%=name %><br>
	비밀번호 : <%=password%><br>
</BODY>
</HTML>
<HTML>
<HEAD>
	<%@ page contentType="text/html; charset=UTF-8" %>
</HEAD>
<BODY>
<%
	String arr[] = new String[]{"111", "222", "333"};
	try{
		out.println(arr[4]+"<br>");
	}catch(Exception e){
		out.println("error ==>" + e + "<=======<br>");
	}
	%>
Good...
</BODY>
</HTML>
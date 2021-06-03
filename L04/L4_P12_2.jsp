<HTML>
<HEAD>
	<%@ page contentType="text/html; charset=UTF-8" %>
	<%! //함수나 변수 선언시 !
	private String call1(){
		String a = "abc";
		String b = "def";
		return (a+b);
	}
	
	private Integer call2(){
		Integer a = 1;
		Integer b = 2;
		return (a+b);
	}
	%>
</HEAD>
<BODY>
String 연산 :<%=call1()%><br>
Integer 연산 :<%=call2()%><br>
Good...
</BODY>
</HTML>

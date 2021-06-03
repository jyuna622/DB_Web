<HTML>
<HEAD>
	<%@ page contentType="text/html; charset=UTF-8" %>
<SCRIPT>
	function call1(){
		var a = "abc";
		var b = "def";
		document.write("String 연산 : " + (a+b));
	}
	function call2(){
		var a = 1;
		var b = 2;
		document.write("Integer 연산 : " + (a+b));
	}
</SCRIPT>
</HEAD>
<BODY>
<SCRIPT>call1();</SCRIPT>
<SCRIPT>call2();</SCRIPT>
Good...
</BODY>
</HTML>

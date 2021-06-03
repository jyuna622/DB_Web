<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<style>
	table{
		border-color : purple;
		border-width : 7px;
		border-style : dotted;
	}
	td{
		border-color : orange;
		border-width : 5px;
		border-style : solid;
	}
	</style>
<title>제목줄입니다</title>
</head>
<body text="#000000" link="#ff0000"
vlink="#00ff00" alink="0000ff">
<table border="1">
 <tr>
  <td colspan="2" bgcolor="blue" align=center>1</td>
  <td bgcolor="red" align=center>2</td>
  <td rowspan="4" bgcolor="skyblue" align=center>3</td>
 </tr>
 <tr>
  <td bgcolor="green" align=center>4</td>
  <td bgcolor="brown" align=center>5</td>
  <td bgcolor="green" align=center>6</td>
 </tr>
 <tr>
  <td bgcolor="pink" align=center>7</td>
  <td bgcolor="purple" align=center>8</td>
  <td bgcolor="pink" align=center>9</td>
 </tr>
 <tr>
  <td bgcolor="purple">0010</td>
  <td bgcolor="yellow">0011</td>
  <td bgcolor="purple">0012</td>
 </tr>
</table>
</body>
</html>
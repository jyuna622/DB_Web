<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</head>
<body>

<FORM METHOD=POST name='fm'>
<table width=650 border=1 cellspacing=0 cellpadding=5>
	<tr>
			<td><b>번호</b></td>
					<td><input type=text name=id size=70 maxlength=70 value=1 readonly>
			</td>
	</tr>
	<tr>
			<td><b>성별</b></td>
					<td>
			 <select name=sex>
				<option value='M' selected>남자
				<option value='W'>여자
			 </select>
			</td>
	</tr>
	<tr>
			<td><b>성명</b></td>
					<td><input type=text name=id size=70 maxlength=70 value='지유나'>
			</td>
	</tr>
	<tr>
			<td><b>주소</b></td>
			<td><input type=text name=addr size=70 maxlength=70 value='경기도 안양시 어딘가에 살고있음'></td>
	</tr>
	<tr>
			<td><b>전화번호</b></td>
					<td><input type=text name=tel size=70 maxlength=70 value=''></td>
	</tr>
</table>

<FORM>
</body>
</html>
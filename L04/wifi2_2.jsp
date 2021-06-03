<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String from_str = request.getParameter("start_number");
	String to_str = request.getParameter("cnt_number");
	int from_num = Integer.parseInt(from_str);
	int to_num = Integer.parseInt(to_str);
%>
<HTML>
<HEAD>
	<meta charset="utf-8">
	<TITLE>FreeWifi</TITLE>
	<style>
		   table{
			  width: 55%;
			  margin-left:22.5%;
			  margin-right:22.5%;

			  border-color : black;
			  border-width : 1px;
			  border-collapse : collapse;
		   }
		   th, td{
			  border-color : black;
			  border-width : 1px;
			  border-collapse : collapse;
		   }
	</style>
</HEAD>
<BODY>
	시작할 항목 번호 : <%=from_num%><br>
	원하는 항목 개수 : <%=to_num%><br>
	
<table border=1>
	<%			
			String filePath = "/var/lib/tomcat9/webapps/ROOT/wifidata123.txt";
			BufferedReader br = new BufferedReader (new FileReader(filePath)); 
			String readtxt;
					
			String[] field_name = br.readLine().split("\t");
			
			double lat = 37.3859876;
			double lng = 127.1212602;
			
			out.println("<tr bgcolor=grey align=center>"+
						"<th width=50>"+field_name[0]+"</th>"+
						"<th >"+field_name[9]+"</th>"+
						"<th width=120>"+field_name[13]+"</th>"+
						"<th width=120>"+field_name[14]+"</th>"+
						"<th width=200>현재지점과 거리</th></tr>");
			
			while ((readtxt = br.readLine()) != null) {		
				String[] field = readtxt.split("\t");
				
				if (Integer.parseInt(field[0]) < from_num) {
					continue;
				} if (Integer.parseInt(field[0]) > from_num + to_num) {
					break;
				}
				
				double dist = Math.sqrt(Math.pow(Double.parseDouble(field[13]) - lat, 2)
						+ Math.pow(Double.parseDouble(field[14]) - lng, 2));
						
				out.println("<tr align=center>"+
							"<td>"+field[0]+"</td>"+
							"<td>"+field[9]+"</td>"+
							"<td>"+field[13]+"</td>"+
							"<td>"+field[14]+"</td>"+
							"<td>"+dist+"</td></tr>");
			}
			br.close();
	%>
</table>
</BODY>
</HTML>
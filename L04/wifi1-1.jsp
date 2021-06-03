<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.io.*"%>
<HTML>
<HEAD>
	<meta charset="utf-8">
	<TITLE>FreeWifi</TITLE>
	<style>
		   table{
			  border-color : black;
			  border-width : 1px;
			  border-collapse: collapse;
		   }
		   td{
			  border-color : black;
			  border-width : 1px;
			  border-collapse: collapse;
		   }
	</style>
</HEAD>
<BODY>
	<%			
			String filePath = "/var/lib/tomcat9/webapps/ROOT/L04/freewifi.txt";
			BufferedReader k39_br = new BufferedReader (new FileReader(filePath)); 
			String readtxt;
					
			String[] field_name = k39_br.readLine().split("\t");
			
			double k39_lat = 37.38598768667056;
			double k39_lng = 127.12126026892624;
			
			k39_LineCnt = 0;
			
			out.println("<table border=1>");
			out.println("<tr bgcolor=grey align=center>"+
						"<th>번호</th>"+
						"<th>주소</th>"+
						"<th>위도</th>"+
						"<th>경도</th>"+
						"<th>현재지점과 거리</th></tr>");
			
			while ((readtxt = k39_br.readLine()) != null) {		
				String[] field = readtxt.split("\t");
				double dist = Math.sqrt(Math.pow(Double.parseDouble(field[13])-k39_lat,2)
						+ Math.pow(Double.parseDouble(field[14])-k39_lng,2));
						
				out.println("<tr align=center>"+
							"<td>"+k39_LineCnt+"</td>"+
							"<td>"+field[9]+"</td>"+
							"<td>"+field[13]+"</td>"+
							"<td>"+field[14]+"</td>"+
							"<td>"+dist+"</td></tr>");
				k39_LineCnt++;
			}
			out.println("</table>");
			k39_br.close();
		}
	}
	%>
</BODY>
</HTML>
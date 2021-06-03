<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String from_str = request.getParameter("from_num");
	String to_str = request.getParameter("to_num");
	int from_num = -1;
	int to_num = -1;
	try{
		from_num = Integer.parseInt(from_str);
		to_num = Integer.parseInt(to_str);
	}catch (Exception e){
	}
%>

<HTML>
<HEAD>
	<meta charset="utf-8">
	<TITLE>FreeWifi3</TITLE>
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
		   ul {
				text-align:center;
			}
			ul li {
				display:inline;
				vertical-align:middle;
			}
			ul li a {
				display:-moz-inline-stack;	/*FF2*/
				display:inline-block;
				vertical-align:top;
				padding:4px;
				margin-right:3px;
				width:15px !important;
				color:#000;
				font:bold 12px tahoma;
				border:1px solid #eee;
				text-align:center;
				text-decoration:none;
				width /**/:26px;	/*IE 5.5*/

			}
			ul li a.now {
				color:#fff;
				background-color:#5CD1E5;
				border:1px solid #5CD1E5;
			}
			ul li a:hover, ul li a:focus {
				color:#fff;
				border:1px solid #5CD1E5;
				background-color:#5CD1E5;
			}
	</style>
</HEAD>
<BODY>	
<table id="freewifi" border=1>
	<caption><B>[전국 무료 와이파이 데이터]</B></caption>
			
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
			
			if (from_num != -1 || to_num != -1) {
			} if (Integer.parseInt(field[0]) < from_num) {
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
	<ul >  
		<li><a href="#"><<</a></li> 
		<li><a href="?from_num=1&to_num=10">1</a></li>  
		<li><a href="?from_num=11&to_num=10">2</a></li>  
		<li><a href="?from_num=21&to_num=10">3</a></li>  
		<li><a href="?from_num=31&to_num=10">4</a></li>  
		<li><a href="?from_num=41&to_num=10">5</a></li>  
		<li><a href="?from_num=51&to_num=10">6</a></li>  
		<li><a href="?from_num=61&to_num=10">7</a></li>  
		<li><a href="?from_num=71&to_num=10">8</a></li>  
		<li><a href="?from_num=81&to_num=10">9</a></li>  
		<li><a href="?from_num=91&to_num=10">10</a></li>  
		<li><a href="#">>></a></li> 
	</ul>
</BODY>
</HTML>
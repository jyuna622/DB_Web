<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.*"%>
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
			.off-screen {
				display: none;
			}
			#nav {
				width: 500px;
				text-align: center;
			}
			#nav a {
				display: inline-block;
				padding: 3px 5px;
				margin-right: 10px;
				font-family:Tahoma;
				background: #ccc;
				color: #000;
				text-decoration: none;
			}
			#nav a.active {
				background: #333;
				color: #fff;
			}


	</style>
</HEAD>
<BODY>
<table id="freewifi" border=1>
	<caption><B>[전국 무료 와이파이 데이터]</B>
			<form action="" id="setRows">
				<p>
					**Showing
					<input type="text" name="rowPerPage" value="10">
					Item per Page**
				</p>
			</form>
	</caption>
	<%
	var $setRows = $('#setRows');

$setRows.submit(function (e) {
	e.preventDefault();
	var rowPerPage = $('[name="rowPerPage"]').val() * 1;// 1 을  곱하여 문자열을 숫자형로 변환

//		console.log(typeof rowPerPage);

	var zeroWarning = 'Sorry, but we cat\'t display "0" rows page. + \nPlease try again.'
	if (!rowPerPage) {
		alert(zeroWarning);
		return;
	}
	$('#nav').remove();
	var $products = $('#products');

	$products.after('<div id="nav">');


	var $tr = $($products).find('tbody tr');
	var rowTotals = $tr.length;
//	console.log(rowTotals);

	var pageTotal = Math.ceil(rowTotals/ rowPerPage);
	var i = 0;

	for (; i < pageTotal; i++) {
		$('<a href="#"></a>')
				.attr('rel', i)
				.html(i + 1)
				.appendTo('#nav');
	}

	$tr.addClass('off-screen')
			.slice(0, rowPerPage)
			.removeClass('off-screen');

	var $pagingLink = $('#nav a');
	$pagingLink.on('click', function (evt) {
		evt.preventDefault();
		var $this = $(this);
		if ($this.hasClass('active')) {
			return;
		}
		$pagingLink.removeClass('active');
		$this.addClass('active');

		// 0 => 0(0*4), 4(0*4+4)
		// 1 => 4(1*4), 8(1*4+4)
		// 2 => 8(2*4), 12(2*4+4)
		// 시작 행 = 페이지 번호 * 페이지당 행수
		// 끝 행 = 시작 행 + 페이지당 행수

		var currPage = $this.attr('rel');
		var startItem = currPage * rowPerPage;
		var endItem = startItem + rowPerPage;

		$tr.css('opacity', '0.0')
				.addClass('off-screen')
				.slice(startItem, endItem)
				.removeClass('off-screen')
				.animate({opacity: 1}, 300);

	});

	$pagingLink.filter(':first').addClass('active');

});


$setRows.submit();
%>

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